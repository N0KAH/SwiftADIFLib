/// A tag encountered while scanning ADI content.
///
/// An ADI file is a sequence of tags: Data-Specifiers that convey field data,
/// interspersed with the ``endOfHeader`` and ``endOfRecord`` markers.
enum ADITag: Hashable, Sendable {
    /// The case-insensitive `<EOH>` tag that terminates a header.
    case endOfHeader

    /// The case-insensitive `<EOR>` tag that terminates a record.
    case endOfRecord

    /// A `<NAME:LENGTH[:TYPE]>DATA` tag.
    case dataSpecifier(ADIDataSpecifier)

    /// The tag's name, uppercased.
    var name: String {
        switch self {
        case .endOfHeader:
            "EOH"
        case .endOfRecord:
            "EOR"
        case let .dataSpecifier(specifier):
            specifier.name
        }
    }
}

/// A cursor over the UTF-8 bytes of an ADI file.
///
/// The scanner works in bytes rather than characters because an ADI data length
/// is expressed in characters, and walking bytes lets the scanner skip UTF-8
/// continuation bytes to count characters precisely even when the input is not
/// well-formed text.
struct ADITagScanner {
    private let bytes: [UInt8]
    private var index: Int

    /// The byte offset of the next unread byte.
    var position: Int { index }

    /// Whether every byte has been consumed.
    var isAtEnd: Bool { index >= bytes.count }

    /// Creates a scanner over the UTF-8 bytes of `text`.
    ///
    /// - Parameter text: The ADI content to scan.
    init(_ text: String) {
        self.init(Array(text.utf8))
    }

    /// Creates a scanner over `bytes`.
    ///
    /// - Parameter bytes: The ADI content to scan.
    init(_ bytes: [UInt8]) {
        self.bytes = bytes

        index = 0
    }

    /// Consumes every byte before the next `<` and returns it as text.
    ///
    /// - Returns: The leading free-form text, which ADI importers are required
    ///   to ignore, or an empty string if the next byte is `<`.
    mutating func consumeLeadingText() -> String {
        let start = index
        while index < bytes.count, bytes[index] != UInt8(ascii: "<") { index += 1 }

        return String(decoding: bytes[start..<index], as: UTF8.self)
    }

    /// Consumes bytes until the next `<`, discarding them.
    mutating func skipToNextTag() {
        while index < bytes.count, bytes[index] != UInt8(ascii: "<") { index += 1 }
    }

    /// Consumes tags until the next `<EOR>`, discarding the ones in between.
    ///
    /// A tag the specification does not describe is not a reason to abandon the
    /// rest of a log, so this tolerates the same malformed tags ``scanTag()``
    /// reports and keeps going until the record ends or the input runs out.
    mutating func skipToEndOfRecord() {
        while !isAtEnd {
            do {
                guard let tag = try scanTag() else {
                    return
                }

                if case .endOfRecord = tag {
                    return
                }
            } catch {
                continue
            }
        }
    }

    /// Scans the next tag, skipping any free-form text that precedes it.
    ///
    /// - Returns: The next tag, or `nil` if the end of the input was reached.
    /// - Throws: ``ADIFError`` if a tag is present but malformed.
    mutating func scanTag() throws -> ADITag? {
        skipToNextTag()

        guard index < bytes.count else {
            return nil
        }

        let tagStart = index
        index += 1 // Consume '<'.

        let bodyStart = index
        while index < bytes.count, bytes[index] != UInt8(ascii: ">") { index += 1 }

        guard index < bytes.count else {
            throw ADIFError.unterminatedTag(offset: tagStart)
        }

        let body = String(decoding: bytes[bodyStart..<index], as: UTF8.self)
        index += 1 // Consume '>'.

        if body.uppercased() == "EOH" {
            return .endOfHeader
        }

        if body.uppercased() == "EOR" {
            return .endOfRecord
        }

        return try .dataSpecifier(parseDataSpecifier(body: body, tagStart: tagStart, bodyStart: bodyStart))
    }

    private mutating func parseDataSpecifier(body: String, tagStart: Int, bodyStart: Int) throws -> ADIDataSpecifier {
        guard let nameEnd = body.firstIndex(of: ":") else {
            // The tag body ran to '>' without a length, so this is not a
            // data specifier at all.
            throw ADIFError.expectedColon(offset: bodyStart + body.utf8.count, found: ">")
        }

        let name = String(body[body.startIndex..<nameEnd])

        guard !name.isEmpty else {
            throw ADIFError.emptyFieldName(offset: tagStart)
        }

        // Skip past the colon that separates the field name from the length.
        let remainder = body[body.index(after: nameEnd)...]
        let lengthText: Substring
        let indicatorText: Substring?
        if let indicatorSeparator = remainder.firstIndex(of: ":") {
            lengthText = remainder[remainder.startIndex..<indicatorSeparator]
            indicatorText = remainder[remainder.index(after: indicatorSeparator)...]
        } else {
            lengthText = remainder
            indicatorText = nil
        }

        let offset = bodyStart + name.utf8.count + 1
        let length = try Self.parseLength(String(lengthText), offset: offset)
        let data = String(decoding: try readCharacters(length), as: UTF8.self)

        return try ADIDataSpecifier(
            name: name,
            typeIndicator: indicatorText.flatMap(ADIDataTypeIndicator.init(rawValue:)),
            data: data
        )
    }

    private static func parseLength(_ text: String, offset: Int) throws -> Int {
        guard !text.isEmpty, text.allSatisfy({ $0.isASCII && $0.isNumber }) else {
            throw ADIFError.invalidDataLength(offset: offset, found: text)
        }

        guard let length = Int(text) else {
            throw ADIFError.dataLengthOverflow(found: text)
        }

        return length
    }

    private mutating func readCharacters(_ count: Int) throws -> [UInt8] {
        var result: [UInt8] = []
        result.reserveCapacity(count)
        var remaining = count
        while remaining > 0 {
            guard index < bytes.count else {
                throw ADIFError.dataTruncated(expected: count, available: result.count)
            }

            let leadingByte = bytes[index]
            result.append(leadingByte)
            index += 1
            // Absorb UTF-8 continuation bytes so that a multi-byte character
            // advances the character count exactly once.
            while index < bytes.count, bytes[index] & 0xC0 == 0x80 {
                result.append(bytes[index])
                index += 1
            }
            remaining -= 1
        }

        return result
    }
}
