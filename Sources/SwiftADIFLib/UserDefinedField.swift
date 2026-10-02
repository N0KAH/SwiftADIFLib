/// The declaration of a user-defined field, carried by a `USERDEFn` header
/// field.
///
/// A `USERDEFn` header field names the `n`th user-defined field and, through its
/// data type indicator, fixes the ADIF data type of that field's data. The
/// declaration may also constrain the field's value with an enumeration or a
/// range.
///
/// - Note: In an ADI file the name declared here appears directly in
///   QSO-Data-Specifiers in place of a QSO field name, and is matched without
///   regard to case.
public struct UserDefinedField: Hashable, Sendable, CustomStringConvertible {
    /// The one-based number of this user-defined field, which is the `n` in
    /// `USERDEFn`.
    public let position: Int

    /// The name of the user-defined field, normalized to uppercase.
    public let name: String

    /// The ADIF data type of the user-defined field's data, when the
    /// specification declares an indicator for that data type.
    ///
    /// The specification permits any data type except `Digit` and `Character`.
    /// Neither of those data types declares an indicator, so `nil` is the way
    /// to express them.
    public let dataType: DataTypeIndicator?

    /// The enumeration or range that constrains the field's value, if any.
    public let specification: UserDefinedFieldSpecification?

    /// The header field name that declares this field, such as `USERDEF1`.
    public var headerFieldName: String {
        "\(ADIFieldName.userDefinedPrefix)\(position)"
    }

    /// The declaration in the form it takes as a `USERDEFn` header field's
    /// data.
    public var description: String {
        guard let specification else {
            return name
        }

        return name + "," + specification.description
    }

    /// Creates a user-defined field declaration.
    ///
    /// - Parameters:
    ///   - position: The one-based field number. Must be at least `1`.
    ///   - name: The field name. It is normalized to uppercase and must not be
    ///     empty, must not be the name of a specification-defined field, must
    ///     not contain a comma, a colon, an angle bracket, or a curly brace,
    ///     and must not begin or end with a space.
    ///   - dataType: The ADIF data type of the field's data.
    ///   - specification: An optional enumeration or range constraining the
    ///     field's value.
    /// - Throws: ``ADIFError/invalidUserDefinedFieldPosition(_:)`` if
    ///   `position` is less than `1`, or
    ///   ``ADIFError/invalidFieldName(name:reason:)`` if `name` is not usable
    ///   as a user-defined field name.
    public init(
        position: Int,
        name: String,
        dataType: DataTypeIndicator? = nil,
        specification: UserDefinedFieldSpecification? = nil
    ) throws {
        guard position >= 1 else {
            throw ADIFError.invalidUserDefinedFieldPosition(position)
        }

        try Self.validate(name: name)

        self.position = position
        self.name = name.uppercased()
        self.dataType = dataType
        self.specification = specification
    }

    /// Creates a user-defined field declaration by parsing the data of a
    /// `USERDEFn` header field.
    ///
    /// - Parameters:
    ///   - position: The one-based field number.
    ///   - data: The header field's data, of the form `FIELDNAME`,
    ///     `FIELDNAME,{S,M,L}`, or `FIELDNAME,{5:20}`.
    ///   - dataType: The data type indicator taken from the `USERDEFn` data
    ///     specifier itself.
    /// - Throws: ``ADIFError`` if `data` is malformed or names a field or
    ///   specification the specification does not permit.
    public init(position: Int, parsing data: String, dataType: DataTypeIndicator?) throws {
        let fieldName: String
        let rawSpecification: String?

        if let comma = data.firstIndex(of: ",") {
            fieldName = String(data[data.startIndex..<comma])
            rawSpecification = String(data[data.index(after: comma)...])
        } else {
            fieldName = data
            rawSpecification = nil
        }

        try self.init(
            position: position,
            name: fieldName,
            dataType: dataType,
            specification: rawSpecification.flatMap(Self.parseSpecification)
        )
    }

    private static func parseSpecification(_ raw: String) -> UserDefinedFieldSpecification? {
        guard
            raw.count >= 2,
            raw.hasPrefix("{"),
            raw.hasSuffix("}")
        else {
            return nil
        }

        let body = String(raw.dropFirst().dropLast())

        // A range is a single `lower:upper` item, so it has to be recognized
        // before the comma-delimited enumeration form is attempted.
        if !body.contains(",") {
            let bounds = body.split(separator: ":", maxSplits: 1, omittingEmptySubsequences: false)

            if bounds.count == 2,
               let lower = Double(bounds[0]),
               let upper = Double(bounds[1]),
               lower < upper {
                return .range(lowerBound: lower, upperBound: upper)
            }
        }

        let values = body.split(separator: ",", omittingEmptySubsequences: false)

        guard !values.isEmpty, values.allSatisfy({ !$0.isEmpty && !$0.contains(":") }) else {
            return nil
        }

        return .enumeration(values: values.map(String.init))
    }

    private static func validate(name: String) throws {
        guard !name.isEmpty else {
            throw ADIFError.invalidFieldName(name: name, reason: "it is empty")
        }

        guard !ADIFieldName.isHeaderField(name) else {
            throw ADIFError.invalidFieldName(
                name: name,
                reason: "it is already the name of a specification-defined field"
            )
        }

        guard !name.contains(where: Self.isForbiddenInFieldName) else {
            throw ADIFError.invalidFieldName(
                name: name,
                reason: "it may not contain a comma, a colon, an angle bracket, or a curly brace"
            )
        }

        guard name.first != " ", name.last != " " else {
            throw ADIFError.invalidFieldName(
                name: name,
                reason: "it may not begin or end with a space character"
            )
        }
    }

    private static func isForbiddenInFieldName(_ character: Character) -> Bool {
        character == "," || character == ":" || character == "<" || character == ">" || character == "{" || character == "}"
    }
}