/// The ADIF `QSL Medium` enumeration.
///
/// - Note: See the specification's section III.B for the authoritative list of
///   qsl medium values.
public enum ADIQSLMedium: ADIEnumeration {
    ///
    /// QSO confirmation via paper QSL card
    case card
    ///
    /// QSO confirmation via eQSL.cc
    case eqsl
    ///
    /// QSO confirmation via ARRL Logbook of the World
    case lotw

    /// A value that this library does not recognize.
    ///
    /// - Important: This case exists so that unrecognized values survive a
    ///   parse-and-serialize round trip rather than being discarded.
    case unrecognized(String)

    /// Every value the specification defines for this enumeration, in
    /// specification order, excluding ``ADIQSLMedium.unrecognized(_:)``.
    public static let allMembers: [ADIQSLMedium] = [
        .card,
        .eqsl,
        .lotw,
    ]

    /// The values the specification marks as import-only.
    ///
    /// - Note: Empty for enumerations that define no import-only values.
    public static let importOnlyMembers: Set<String> = []

    /// The value in the canonical form the specification uses.
    public var description: String {
        switch self {
        case .card:
            "CARD"
        case .eqsl:
            "EQSL"
        case .lotw:
            "LOTW"
        case let .unrecognized(raw):
            raw
        }
    }

    private static let membersByLowercasedValue: [String: ADIQSLMedium] = [
        "card": .card,
        "eqsl": .eqsl,
        "lotw": .lotw,
    ]

    /// Creates a value from its textual form.
    ///
    /// - Parameter rawValue: The value, in any case.
    /// - Returns: The matching member, or `.unrecognized` when `rawValue` names
    ///   no value the specification defines.
    public init(rawValue: some StringProtocol) {
        guard let member = Self.membersByLowercasedValue[rawValue.lowercased()] else {
            self = .unrecognized(rawValue.description)

            return
        }

        self = member
    }
}
