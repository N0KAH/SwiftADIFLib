/// The optional enumeration or range that constrains a user-defined field's
/// value.
///
/// A specification appears after the field name and a comma, enclosed in curly
/// brackets.
public enum ADIHeaderUserDefinedFieldSpecification: Hashable, Sendable, CustomStringConvertible {
    /// A comma-delimited list of permitted values, each of data type `String`.
    ///
    /// For example `{S,M,L}`.
    case enumeration(values: [String])

    /// A lower bound of type `Number`, a colon, and a larger upper bound of
    /// type `Number`.
    ///
    /// For example `{5:20}`.
    case range(lowerBound: Double, upperBound: Double)

    /// The specification in the form it takes inside a `USERDEFn` header field.
    public var description: String {
        switch self {
        case let .enumeration(values):
            "{\(values.joined(separator: ","))}"
        case let .range(lowerBound, upperBound):
            "{\(Self.number(lowerBound)):\(Self.number(upperBound))}"
        }
    }

    /// Creates an enumeration specification from its permitted values.
    ///
    /// - Parameter values: The permitted values. Must not be empty, and no
    ///   value may contain a comma, which the specification uses as the
    ///   delimiter.
    /// - Throws: ``ADIFError/invalidUserDefinedFieldSpecification(specification:reason:)``
    ///   if `values` is empty or contains a value with a comma.
    public init(enumeration values: [String]) throws {
        guard !values.isEmpty else {
            throw ADIFError.invalidUserDefinedFieldSpecification(
                specification: "",
                reason: "an enumeration must list at least one value"
            )
        }

        for value in values where value.contains(",") {
            throw ADIFError.invalidUserDefinedFieldSpecification(
                specification: value,
                reason: "an enumerated value may not contain a comma"
            )
        }

        self = .enumeration(values: values)
    }

    /// Creates a range specification from its bounds.
    ///
    /// - Parameters:
    ///   - lowerBound: The inclusive lower bound.
    ///   - upperBound: The inclusive upper bound. Must be greater than
    ///     `lowerBound`.
    /// - Throws: ``ADIFError/invalidUserDefinedFieldSpecification(specification:reason:)``
    ///   if `upperBound` is not greater than `lowerBound`.
    public init(lowerBound: Double, upperBound: Double) throws {
        guard lowerBound < upperBound else {
            throw ADIFError.invalidUserDefinedFieldSpecification(
                specification: "{\(lowerBound):\(upperBound)}",
                reason: "the upper bound must be larger than the lower bound"
            )
        }

        self = .range(lowerBound: lowerBound, upperBound: upperBound)
    }

    private static func number(_ value: Double) -> String {
        guard value == value.rounded() else {
            return String(value)
        }

        // `Int(_:)` traps on a magnitude it cannot represent, so a bound far
        // beyond `Int.max` falls back to the plain decimal form instead of
        // crashing the caller.
        guard let whole = Int(exactly: value.rounded()) else {
            return String(value)
        }

        return String(whole)
    }
}
