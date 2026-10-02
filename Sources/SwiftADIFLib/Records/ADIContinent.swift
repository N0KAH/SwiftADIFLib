/// The ADIF `Continent` enumeration.
///
/// - Note: See the specification's section III.B for the authoritative list of
///   continent values.
public enum ADIContinent: ADIEnumeration {
    /// The specification's `NA` value.
    case northAmerica
    /// The specification's `SA` value.
    case southAmerica
    /// The specification's `EU` value.
    case europe
    /// The specification's `AF` value.
    case africa
    /// The specification's `OC` value.
    case oceania
    /// The specification's `AS` value.
    case asia
    /// The specification's `AN` value.
    case antarctica

    /// A value that this library does not recognize.
    ///
    /// - Important: This case exists so that unrecognized values survive a
    ///   parse-and-serialize round trip rather than being discarded.
    case unrecognized(String)

    /// Every value the specification defines for this enumeration, in
    /// specification order, excluding ``ADIContinent.unrecognized(_:)``.
    public static let allMembers: [ADIContinent] = [
        .northAmerica,
        .southAmerica,
        .europe,
        .africa,
        .oceania,
        .asia,
        .antarctica,
    ]

    /// The values the specification marks as import-only.
    ///
    /// - Note: Empty for enumerations that define no import-only values.
    public static let importOnlyMembers: Set<String> = []

    /// The value in the canonical form the specification uses.
    public var description: String {
        switch self {
        case .northAmerica:
            "NA"
        case .southAmerica:
            "SA"
        case .europe:
            "EU"
        case .africa:
            "AF"
        case .oceania:
            "OC"
        case .asia:
            "AS"
        case .antarctica:
            "AN"
        case let .unrecognized(raw):
            raw
        }
    }

    private static let membersByLowercasedValue: [String: ADIContinent] = [
        "na": .northAmerica,
        "sa": .southAmerica,
        "eu": .europe,
        "af": .africa,
        "oc": .oceania,
        "as": .asia,
        "an": .antarctica,
    ]

    /// Creates a value from its textual form.
    ///
    /// - Parameter rawValue: The value, in any case.
    /// - Returns: The matching value, or `nil` if `rawValue` names no member of
    ///   this enumeration.
    public init?(rawValue: some StringProtocol) {
        guard let member = Self.membersByLowercasedValue[rawValue.lowercased()] else {
            return nil
        }

        self = member
    }
}
