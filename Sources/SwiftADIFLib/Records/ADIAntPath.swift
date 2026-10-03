/// The ADIF `Ant Path` enumeration.
///
/// - Note: See the specification's section III.B for the authoritative list of
///   ant path values.
public enum ADIAntPath: ADIEnumeration {
    /// The specification's `G` value.
    case grayline
    /// The specification's `O` value.
    case other
    /// The specification's `S` value.
    case shortPath
    /// The specification's `L` value.
    case longPath

    /// A value that this library does not recognize.
    ///
    /// - Important: This case exists so that unrecognized values survive a
    ///   parse-and-serialize round trip rather than being discarded.
    case unrecognized(String)

    /// Every value the specification defines for this enumeration, in
    /// specification order, excluding ``ADIAntPath.unrecognized(_:)``.
    public static let allMembers: [ADIAntPath] = [
        .grayline,
        .other,
        .shortPath,
        .longPath,
    ]

    /// The values the specification marks as import-only.
    ///
    /// - Note: Empty for enumerations that define no import-only values.
    public static let importOnlyMembers: Set<String> = []

    /// The value in the canonical form the specification uses.
    public var description: String {
        switch self {
        case .grayline:
            "G"
        case .other:
            "O"
        case .shortPath:
            "S"
        case .longPath:
            "L"
        case let .unrecognized(raw):
            raw
        }
    }

    private static let membersByLowercasedValue: [String: ADIAntPath] = [
        "g": .grayline,
        "o": .other,
        "s": .shortPath,
        "l": .longPath,
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
