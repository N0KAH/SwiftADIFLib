/// The ADIF `QSL Via` enumeration.
///
/// - Note: See the specification's section III.B for the authoritative list of
///   qsl via values.
public enum ADIQSLVia: ADIEnumeration {
    /// The specification's `B` value.
    case bureau
    /// The specification's `D` value.
    case direct
    /// The specification's `E` value.
    case electronic
    ///
    /// manager (import-only)
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case manager

    /// A value that this library does not recognize.
    ///
    /// - Important: This case exists so that unrecognized values survive a
    ///   parse-and-serialize round trip rather than being discarded.
    case unrecognized(String)

    /// Every value the specification defines for this enumeration, in
    /// specification order, excluding ``ADIQSLVia.unrecognized(_:)``.
    public static let allMembers: [ADIQSLVia] = [
        .bureau,
        .direct,
        .electronic,
        .manager,
    ]

    /// The values the specification marks as import-only.
    ///
    /// - Note: Empty for enumerations that define no import-only values.
    public static let importOnlyMembers: Set<String> = [
        "M",
    ]

    /// The value in the canonical form the specification uses.
    public var description: String {
        switch self {
        case .bureau:
            "B"
        case .direct:
            "D"
        case .electronic:
            "E"
        case .manager:
            "M"
        case let .unrecognized(raw):
            raw
        }
    }

    private static let membersByLowercasedValue: [String: ADIQSLVia] = [
        "b": .bureau,
        "d": .direct,
        "e": .electronic,
        "m": .manager,
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
