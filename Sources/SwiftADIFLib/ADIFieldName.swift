/// The names of the fields that the ADIF specification defines.
///
/// Field names in ADI files are case independent. Names are compared after
/// uppercasing, which is how ``DataSpecifier`` normalizes them.
enum ADIFieldName {
    /// The header field that identifies the ADIF version of a file.
    static let adifVersion = "ADIF_VER"

    /// The header field that identifies when a file was created.
    static let createdTimestamp = "CREATED_TIMESTAMP"

    /// The header field that identifies the application that wrote a file.
    static let programID = "PROGRAMID"

    /// The header field that identifies the version of the writing application.
    static let programVersion = "PROGRAMVERSION"

    /// The prefix of the header fields that declare user-defined fields.
    static let userDefinedPrefix = "USERDEF"

    /// The header field names defined by the specification.
    static let headerFields: Set<String> = [
        adifVersion,
        createdTimestamp,
        programID,
        programVersion,
    ]

    /// Whether `name` is the name of a header field defined by the
    /// specification.
    ///
    /// - Parameter name: A field name, in any case.
    /// - Returns: `true` if `name` is a specification-defined header field.
    static func isHeaderField(_ name: String) -> Bool {
        headerFields.contains(name.uppercased())
    }

    /// The user-defined field number in a `USERDEFn` header field name.
    ///
    /// - Parameter name: A field name, in any case.
    /// - Returns: The positive integer `n`, or `nil` if `name` is not of the
    ///   form `USERDEFn`.
    static func userDefinedNumber(_ name: String) -> Int? {
        let normalized = name.uppercased()
        guard normalized.hasPrefix(userDefinedPrefix) else {
            return nil
        }

        let digits = normalized.dropFirst(userDefinedPrefix.count)

        guard !digits.isEmpty, digits.allSatisfy({ $0.isASCII && $0.isNumber }) else {
            return nil
        }

        return Int(digits)
    }
}