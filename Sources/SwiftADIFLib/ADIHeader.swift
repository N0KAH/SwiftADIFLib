/// The optional header that may precede the records of an ADI file.
///
/// A header begins with any character other than `<` and terminates with the
/// case-insensitive End-Of-Header tag `<EOH>`. It may contain arbitrary text as
/// well as zero or more header fields, each conveyed by a data specifier.
///
/// - Note: If the first character in an ADI file is `<`, the file contains no
///   header. Use ``init(parsing:)`` only when you know a header is present.
public struct ADIHeader: Hashable, Sendable {
    /// Free-form text that precedes the header fields, such as a note about
    /// when and by what the file was generated.
    ///
    /// ADI importers are required to ignore this text.
    public var text: String

    /// The version of ADIF that the file conforms to.
    public var adifVersion: ADIFVersion?

    /// The UTC date and time at which the file was created.
    public var createdTimestamp: ADIHeaderTimestamp?

    /// The name of the logger, converter, or utility that wrote the file.
    public var programID: String?

    /// The version of the logger, converter, or utility that wrote the file.
    public var programVersion: String?

    /// The user-defined fields declared by this header.
    ///
    /// The array is not required to be sorted; ``serialized()`` writes the
    /// declarations in ascending ``UserDefinedField/position`` order.
    public var userDefinedFields: [UserDefinedField]

    /// Header data specifiers whose field names this library does not
    /// recognize.
    ///
    /// Unrecognized fields arise only when reading existing content, so this
    /// array is populated by ``init(parsing:)`` and is always empty for a header
    /// you generate.
    ///
    /// Preserving unrecognized fields means that parsing and re-serializing a
    /// file written by a newer version of the specification, or by a
    /// non-standard tool, does not silently discard data.
    public var unknownFields: [ADIUnknownField]

    /// Creates a header.
    ///
    /// - Parameters:
    ///   - text: Free-form text to place before the header fields.
    ///   - adifVersion: The ADIF version the file conforms to.
    ///   - createdTimestamp: When the file was created.
    ///   - programID: The name of the application that wrote the file.
    ///   - programVersion: The version of the application that wrote the file.
    ///   - userDefinedFields: The user-defined field declarations.
    ///
    /// - Note: This initializer cannot carry ``unknownFields``, because those
    ///   come into existence only when content is read. Use
    ///   ``init(parsing:)`` to obtain a header that tracks them.
    public init(
        text: String = "",
        adifVersion: ADIFVersion? = nil,
        createdTimestamp: ADIHeaderTimestamp? = nil,
        programID: String? = nil,
        programVersion: String? = nil,
        userDefinedFields: [UserDefinedField] = []
    ) {
        self.init(
            text: text,
            adifVersion: adifVersion,
            createdTimestamp: createdTimestamp,
            programID: programID,
            programVersion: programVersion,
            userDefinedFields: userDefinedFields,
            unknownFields: []
        )
    }

    /// Creates a header that also carries fields this library does not
    /// recognize.
    ///
    /// - Parameters:
    ///   - text: Free-form text to place before the header fields.
    ///   - adifVersion: The ADIF version the file conforms to.
    ///   - createdTimestamp: When the file was created.
    ///   - programID: The name of the application that wrote the file.
    ///   - programVersion: The version of the application that wrote the file.
    ///   - userDefinedFields: The user-defined field declarations.
    ///   - unknownFields: Header fields this library does not recognize.
    ///
    /// - Note: This initializer is internal because unrecognized fields only
    ///   appear in content written elsewhere, never in a header being
    ///   generated. Keeping it out of the public API keeps the generating side
    ///   of the library honest: a caller builds a header from the fields the
    ///   specification defines, and reads everything else back through
    ///   ``init(parsing:)``.
    init(
        text: String = "",
        adifVersion: ADIFVersion? = nil,
        createdTimestamp: ADIHeaderTimestamp? = nil,
        programID: String? = nil,
        programVersion: String? = nil,
        userDefinedFields: [UserDefinedField] = [],
        unknownFields: [ADIUnknownField]
    ) {
        self.text = text
        self.adifVersion = adifVersion
        self.createdTimestamp = createdTimestamp
        self.programID = programID
        self.programVersion = programVersion
        self.userDefinedFields = userDefinedFields
        self.unknownFields = unknownFields
    }

    /// Parses a header from the beginning of an ADI file.
    ///
    /// - Parameter text: The ADI content beginning with a header. Free-form
    ///   text before the first `<` becomes ``text``, and scanning stops after
    ///   the `<EOH>` tag. Header fields this library does not recognize are
    ///   collected into ``unknownFields``.
    /// - Throws: ``ADIFError/missingEndOfHeader`` if no `<EOH>` tag appears, or
    ///   ``ADIFError`` if a tag is malformed or a field's data is invalid.
    public init(parsing text: String) throws {
        var scanner = ADITagScanner(text)
        let leadingText = scanner.consumeLeadingText()

        self.init(unknownFields: [])
        self.text = Self.trimTrailingNewlines(leadingText)

        while true {
            guard let tag = try scanner.scanTag() else {
                throw ADIFError.missingEndOfHeader
            }

            switch tag {
            case .endOfHeader:

                return
            case .endOfRecord:
                throw ADIFError.unexpectedTagInHeader(name: tag.name)
            case let .dataSpecifier(specifier):
                try apply(specifier)
            }
        }
    }

    /// Creates a conventional header stamped with the current ADIF version and
    /// creation time.
    ///
    /// - Parameters:
    ///   - programID: The name of the application writing the file.
    ///   - programVersion: The version of the application writing the file.
    ///   - createdAt: When the file was created. Defaults to now, in UTC.
    ///   - text: Free-form text to place before the header fields.
    ///   - userDefinedFields: The user-defined field declarations.
    /// - Returns: A header carrying the ADIF version, creation timestamp,
    ///   program identification, and any user-defined field declarations.
    public static func standard(
        programID: String,
        programVersion: String,
        createdAt: ADIHeaderTimestamp = .now,
        text: String = "",
        userDefinedFields: [UserDefinedField] = []
    ) -> ADIHeader {
        ADIHeader(
            text: text,
            adifVersion: .current,
            createdTimestamp: createdAt,
            programID: programID,
            programVersion: programVersion,
            userDefinedFields: userDefinedFields
        )
    }

    /// Renders this header in ADI form, including the terminating `<EOH>` tag.
    ///
    /// Fields are written in the order the specification presents them:
    /// `ADIF_VER`, `CREATED_TIMESTAMP`, `PROGRAMID`, `PROGRAMVERSION`, the
    /// `USERDEFn` declarations in ascending order of `n`, then any unrecognized
    /// fields in the order they were given.
    ///
    /// - Returns: The header, terminated by a newline so that records may
    ///   follow on the next line.
    /// - Throws: ``ADIFError/duplicateUserDefinedFieldPosition(_:)`` if two
    ///   user-defined fields claim the same number, or
    ///   ``ADIFError/unsupportedDataType(dataType:reason:)`` if a field's data
    ///   type may not appear in an ADI file.
    public func serialized() throws -> String {
        let fields = try dataSpecifiers()
        var lines: [String] = []

        if !text.isEmpty {
            lines.append(text)
        }
        lines.append(contentsOf: fields.map { $0.serialized() })
        lines.append("<EOH>")

        return lines.joined(separator: "\n") + "\n"
    }

    private mutating func apply(_ specifier: DataSpecifier) throws {
        let name = specifier.name

        if name == ADIFieldName.adifVersion {
            guard let version = ADIFVersion(parsing: specifier.data) else {
                throw ADIFError.invalidADIFVersion(found: specifier.data)
            }

            adifVersion = version

            return
        }

        if name == ADIFieldName.createdTimestamp {
            guard let timestamp = ADIHeaderTimestamp(parsing: specifier.data) else {
                throw ADIFError.invalidTimestamp(found: specifier.data)
            }

            createdTimestamp = timestamp

            return
        }

        if name == ADIFieldName.programID {
            programID = specifier.data

            return
        }

        if name == ADIFieldName.programVersion {
            programVersion = specifier.data

            return
        }

        if let position = ADIFieldName.userDefinedNumber(name) {
            let field = try UserDefinedField(
                position: position,
                parsing: specifier.data,
                dataType: specifier.typeIndicator
            )
            userDefinedFields.append(field)

            return
        }

        unknownFields.append(ADIUnknownField(specifier))
    }

    private func dataSpecifiers() throws -> [DataSpecifier] {
        var specifiers: [DataSpecifier] = []

        if let adifVersion {
            specifiers.append(try DataSpecifier(name: ADIFieldName.adifVersion, data: adifVersion.description))
        }

        if let createdTimestamp {
            specifiers.append(try DataSpecifier(name: ADIFieldName.createdTimestamp, data: createdTimestamp.description))
        }

        if let programID {
            specifiers.append(try DataSpecifier(name: ADIFieldName.programID, data: programID))
        }

        if let programVersion {
            specifiers.append(try DataSpecifier(name: ADIFieldName.programVersion, data: programVersion))
        }

        var seenPositions: Set<Int> = []
        for field in userDefinedFields.sorted(by: { $0.position < $1.position }) {
            guard seenPositions.insert(field.position).inserted else {
                throw ADIFError.duplicateUserDefinedFieldPosition(field.position)
            }

            specifiers.append(
                try DataSpecifier(
                    name: field.headerFieldName,
                    typeIndicator: field.dataType,
                    data: field.description
                )
            )
        }

        for field in unknownFields {
            specifiers.append(try field.validatedForADI())
        }

        return specifiers
    }

    private static func trimTrailingNewlines(_ text: String) -> String {
        var result = Substring(text)
        while let last = result.last, last == "\n" || last == "\r" {
            result = result.dropLast()
        }

        return String(result)
    }
}