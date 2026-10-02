/// An error encountered while parsing or serializing ADIF content.
///
/// Parse errors carry the byte offset at which they were detected so that
/// malformed input can be traced back to a location in the source.
public enum ADIFError: Error, Hashable, Sendable, CustomStringConvertible {
    /// A `<` character was found but the tag was never closed by `>`.
    ///
    /// - Parameter offset: The byte offset of the unterminated `<`.
    case unterminatedTag(offset: Int)

    /// A data specifier contained an empty field name.
    ///
    /// - Parameter offset: The byte offset of the `<` that opened the specifier.
    case emptyFieldName(offset: Int)

    /// A data specifier's name was not followed by a `:`.
    ///
    /// - Parameters:
    ///   - offset: The byte offset at which the `:` was expected.
    ///   - found: The character that was found instead.
    case expectedColon(offset: Int, found: Character)

    /// A data specifier's length was not a valid sequence of ASCII digits.
    ///
    /// - Parameters:
    ///   - offset: The byte offset of the first non-digit.
    ///   - found: The text that was found in place of a length.
    case invalidDataLength(offset: Int, found: String)

    /// A data specifier's length was a valid digit sequence but too large to
    /// represent.
    ///
    /// - Parameter found: The digit sequence that overflowed.
    case dataLengthOverflow(found: String)

    /// The declared data length exceeded the number of characters remaining.
    ///
    /// - Parameters:
    ///   - expected: The declared length, in characters.
    ///   - available: The number of characters actually available.
    case dataTruncated(expected: Int, available: Int)

    /// A version component was outside the range permitted by the `ADIF_VER`
    /// header field.
    ///
    /// - Parameters:
    ///   - name: The name of the offending component.
    ///   - value: The value that was supplied.
    case invalidVersionComponent(name: String, value: Int)

    /// A `CREATED_TIMESTAMP` value did not have the form `YYYYMMDD HHMMSS`.
    ///
    /// - Parameter found: The text that was found in place of a timestamp.
    case invalidTimestamp(found: String)

    /// A field name was not valid in the context in which it appeared.
    ///
    /// - Parameters:
    ///   - name: The offending field name.
    ///   - reason: Why the name was rejected.
    case invalidFieldName(name: String, reason: String)

    /// A header was expected but the content ended before `<EOH>` appeared.
    case missingEndOfHeader

    /// A tag appeared inside a header that may not appear there.
    ///
    /// - Parameter name: The name of the offending tag.
    case unexpectedTagInHeader(name: String)

    /// An `ADIF_VER` header field did not contain a valid `X.Y.Z` version.
    ///
    /// - Parameter found: The text that was found in place of a version.
    case invalidADIFVersion(found: String)

    /// A `USERDEFn` header field used a number that is not a positive integer.
    ///
    /// - Parameter position: The offending field number.
    case invalidUserDefinedFieldPosition(_ position: Int)

    /// Two user-defined fields claimed the same `USERDEFn` number.
    ///
    /// - Parameter position: The duplicated field number.
    case duplicateUserDefinedFieldPosition(_ position: Int)

    /// A user-defined field's enumeration or range specification was invalid.
    ///
    /// - Parameters:
    ///   - specification: The offending specification text.
    ///   - reason: Why the specification was rejected.
    case invalidUserDefinedFieldSpecification(specification: String, reason: String)

    /// A data type that may not be expressed in an ADI file was used in one.
    ///
    /// - Parameters:
    ///   - dataType: The offending data type.
    ///   - reason: Why the data type is not permitted.
    case unsupportedDataType(dataType: String, reason: String)

    /// A value did not have the form required by the ADIF `Date` data type.
    ///
    /// - Parameter found: The text that was found in place of a date.
    case invalidDate(found: String)

    /// A value did not have the form required by the ADIF `Time` data type.
    ///
    /// - Parameter found: The text that was found in place of a time.
    case invalidTime(found: String)

    /// A field's data did not satisfy the restriction the specification places
    /// on that field.
    ///
    /// - Parameters:
    ///   - name: The name of the offending field.
    ///   - found: The data that was supplied.
    ///   - reason: Why the data was rejected.
    case invalidFieldValue(name: String, found: String, reason: String)

    /// A description of the error.
    public var description: String {
        switch self {
        case let .unterminatedTag(offset):
            "Unterminated data specifier starting at byte \(offset)."
        case let .emptyFieldName(offset):
            "Data specifier at byte \(offset) has an empty field name."
        case let .expectedColon(offset, found):
            "Expected ':' at byte \(offset) but found '\(found)'."
        case let .invalidDataLength(offset, found):
            "Expected a data length at byte \(offset) but found \"\(found)\"."
        case let .dataLengthOverflow(found):
            "Data length \"\(found)\" is too large to represent."
        case let .dataTruncated(expected, available):
            "Data specifier declared \(expected) characters but only \(available) are available."
        case let .invalidVersionComponent(name, value):
            "ADIF version component '\(name)' is out of range: \(value)."
        case let .invalidTimestamp(found):
            "Expected a CREATED_TIMESTAMP of the form YYYYMMDD HHMMSS but found \"\(found)\"."
        case let .invalidADIFVersion(found):
            "Expected an ADIF_VER of the form X.Y.Z but found \"\(found)\"."
        case .missingEndOfHeader:
            "Reached the end of the content before the <EOH> tag."
        case let .unexpectedTagInHeader(name):
            "Tag <\(name)> may not appear inside an ADI header."
        case let .invalidUserDefinedFieldPosition(position):
            "USERDEF field numbers must be positive integers, but \(position) was used."
        case let .duplicateUserDefinedFieldPosition(position):
            "More than one USERDEF field claims position \(position)."
        case let .invalidFieldName(name, reason):
            "Field name \"\(name)\" is invalid: \(reason)."
        case let .invalidUserDefinedFieldSpecification(specification, reason):
            "User-defined field specification \"\(specification)\" is invalid: \(reason)."
        case let .unsupportedDataType(dataType, reason):
            "Data type \(dataType) cannot be used here: \(reason)."
        case let .invalidDate(found):
            "Expected a date of the form YYYYMMDD but found \"\(found)\"."
        case let .invalidTime(found):
            "Expected a time of the form HHMM or HHMMSS but found \"\(found)\"."
        case let .invalidFieldValue(name, found, reason):
            "Field \"\(name)\" has the invalid value \"\(found)\": \(reason)."
        }
    }
}
