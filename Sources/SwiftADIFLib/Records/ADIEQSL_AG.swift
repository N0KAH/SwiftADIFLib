/// The ADIF `EQSL_AG` enumeration.
///
/// - Note: See the specification's section III.B for the authoritative list of
///   eqsl_ag values.
public enum ADIEQSL_AG: ADIEnumeration {
    ///
    /// The QSO's callsign holds eQSL.cc's "Authenticity Guaranteed" status
    case yes
    ///
    /// The QSO's callsign does not hold eQSL.cc's "Authenticity Guaranteed" status
    case no
    ///
    /// Unspecified (Default)
    case unspecified

    /// A value that this library does not recognize.
    ///
    /// - Important: This case exists so that unrecognized values survive a
    ///   parse-and-serialize round trip rather than being discarded.
    case unrecognized(String)

    /// Every value the specification defines for this enumeration, in
    /// specification order, excluding ``ADIEQSL_AG.unrecognized(_:)``.
    public static let allMembers: [ADIEQSL_AG] = [
        .yes,
        .no,
        .unspecified,
    ]

    /// The values the specification marks as import-only.
    ///
    /// - Note: Empty for enumerations that define no import-only values.
    public static let importOnlyMembers: Set<String> = []

    /// The value in the canonical form the specification uses.
    public var description: String {
        switch self {
        case .yes:
            "Y"
        case .no:
            "N"
        case .unspecified:
            "U"
        case let .unrecognized(raw):
            raw
        }
    }

    private static let membersByLowercasedValue: [String: ADIEQSL_AG] = [
        "y": .yes,
        "n": .no,
        "u": .unspecified,
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
