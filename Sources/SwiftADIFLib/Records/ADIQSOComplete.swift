/// The ADIF `QSO Complete` enumeration.
///
/// - Note: See the specification's section III.B for the authoritative list of
///   qso complete values.
public enum ADIQSOComplete: ADIEnumeration {
    /// The specification's `Y` value.
    case yes
    /// The specification's `N` value.
    case no
    /// The specification's `NIL` value.
    case notHeard
    /// The specification's `?` value.
    case uncertain

    /// A value that this library does not recognize.
    ///
    /// - Important: This case exists so that unrecognized values survive a
    ///   parse-and-serialize round trip rather than being discarded.
    case unrecognized(String)

    /// Every value the specification defines for this enumeration, in
    /// specification order, excluding ``ADIQSOComplete.unrecognized(_:)``.
    public static let allMembers: [ADIQSOComplete] = [
        .yes,
        .no,
        .notHeard,
        .uncertain,
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
        case .notHeard:
            "NIL"
        case .uncertain:
            "?"
        case let .unrecognized(raw):
            raw
        }
    }

    private static let membersByLowercasedValue: [String: ADIQSOComplete] = [
        "y": .yes,
        "n": .no,
        "nil": .notHeard,
        "?": .uncertain,
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
