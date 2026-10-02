/// A single ADI Data-Specifier: the `<NAME:LENGTH[:TYPE]>DATA` construct that
/// conveys one field's data in an ADI file.
///
/// Data-Specifiers are the atoms of the ADI file format. Both header fields
/// and QSO fields are expressed as Data-Specifiers; only the set of legal
/// names differs.
///
/// - Note: Field names in ADI files are case independent, so ``name`` is
///   normalized to uppercase. This makes specifiers from files written by
///   different applications compare equal.
public struct DataSpecifier: Hashable, Sendable {
    /// The name of the field that ``data`` belongs to, normalized to uppercase.
    public let name: String

    /// The ADIF data type of ``data``, when the specifier declares one.
    public let typeIndicator: DataTypeIndicator?

    /// The field's data.
    public let data: String

    /// The number of characters in ``data``.
    ///
    /// This is the value written as the data specifier's length.
    ///
    /// - Note: The specification defines ADI data as a sequence of ASCII
    ///   characters, for which the character count and the byte count agree.
    ///   This library counts Unicode characters instead, which agrees with the
    ///   byte count for all conforming input and degrades more predictably for
    ///   the non-ASCII characters that real-world files occasionally contain.
    public var length: Int {
        ADICalendar.characterCount(of: data)
    }

    /// Creates a data specifier.
    ///
    /// - Parameters:
    ///   - name: The field name. It is normalized to uppercase and must not be
    ///     empty or contain `<`, `>`, or `:`.
    ///   - typeIndicator: The ADIF data type of ``data``, or `nil` when the
    ///     specifier omits the indicator.
    ///   - data: The field's data.
    /// - Throws: ``ADIFError/invalidFieldName(name:reason:)`` if `name` is not
    ///   usable as a data specifier's field name.
    public init(name: String, typeIndicator: DataTypeIndicator? = nil, data: String) throws {
        try Self.validate(name: name)
        self.name = name.uppercased()
        self.typeIndicator = typeIndicator
        self.data = data
    }

    /// Creates a specifier from an already validated, already normalized name.
    private init(uncheckedName: String, typeIndicator: DataTypeIndicator?, data: String) {
        name = uncheckedName
        self.typeIndicator = typeIndicator
        self.data = data
    }

    /// Returns a copy of this specifier with a different data type indicator.
    ///
    /// - Parameter typeIndicator: The indicator to apply.
    /// - Returns: The updated specifier.
    public func settingTypeIndicator(_ typeIndicator: DataTypeIndicator?) -> DataSpecifier {
        DataSpecifier(uncheckedName: name, typeIndicator: typeIndicator, data: data)
    }

    /// Renders this specifier in ADI form.
    ///
    /// - Returns: The specifier as `<NAME:LENGTH[:TYPE]>DATA`.
    public func serialized() -> String {
        var result = "<\(name):\(length)"
        if let typeIndicator {
            result += ":\(typeIndicator.description)"
        }

        return result + ">\(data)"
    }

    /// Validates that this specifier may be written to an ADI file.
    ///
    /// - Returns: This specifier, unchanged.
    /// - Throws: ``ADIFError/unsupportedDataType(dataType:reason:)`` if the
    ///   specifier's data type may only appear in an ADX file.
    public func validatedForADI() throws -> DataSpecifier {
        if let typeIndicator, !typeIndicator.isPermittedInADI {
            throw ADIFError.unsupportedDataType(
                dataType: typeIndicator.description,
                reason: "fields of this type must only be used in ADX files"
            )
        }

        return self
    }

    private static func validate(name: String) throws {
        guard !name.isEmpty else {
            throw ADIFError.invalidFieldName(name: name, reason: "it is empty")
        }

        guard !name.contains(where: { $0 == "<" || $0 == ">" || $0 == ":" }) else {
            throw ADIFError.invalidFieldName(
                name: name,
                reason: "it may not contain an angle bracket or a colon"
            )
        }

    }
}
