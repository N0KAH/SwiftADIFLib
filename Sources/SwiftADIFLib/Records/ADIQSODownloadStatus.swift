/// The ADIF `QSO Download Status` enumeration.
///
/// - Note: See the specification's section III.B for the authoritative list of
///   qso download status values.
public enum ADIQSODownloadStatus: ADIEnumeration {
    ///
    /// the QSO has been downloaded from the online service
    case yes
    ///
    /// the QSO has not been downloaded from the online service
    case no
    /// The specification's `I` value.
    case ignoreOrInvalid

    /// A value that this library does not recognize.
    ///
    /// - Important: This case exists so that unrecognized values survive a
    ///   parse-and-serialize round trip rather than being discarded.
    case unrecognized(String)

    /// Every value the specification defines for this enumeration, in
    /// specification order, excluding ``ADIQSODownloadStatus.unrecognized(_:)``.
    public static let allMembers: [ADIQSODownloadStatus] = [
        .yes,
        .no,
        .ignoreOrInvalid,
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
        case .ignoreOrInvalid:
            "I"
        case let .unrecognized(raw):
            raw
        }
    }

    private static let membersByLowercasedValue: [String: ADIQSODownloadStatus] = [
        "y": .yes,
        "n": .no,
        "i": .ignoreOrInvalid,
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
