/// The ADIF `QSO Upload Status` enumeration.
///
/// - Note: See the specification's section III.B for the authoritative list of
///   qso upload status values.
public enum ADIQSOUploadStatus: ADIEnumeration {
    ///
    /// the QSO has been uploaded to, and accepted by, the online service
    case yes
    ///
    /// do not upload the QSO to the online service
    case no
    ///
    /// the QSO has been modified since being uploaded to the online service
    case modified

    /// A value that this library does not recognize.
    ///
    /// - Important: This case exists so that unrecognized values survive a
    ///   parse-and-serialize round trip rather than being discarded.
    case unrecognized(String)

    /// Every value the specification defines for this enumeration, in
    /// specification order, excluding ``ADIQSOUploadStatus.unrecognized(_:)``.
    public static let allMembers: [ADIQSOUploadStatus] = [
        .yes,
        .no,
        .modified,
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
        case .modified:
            "M"
        case let .unrecognized(raw):
            raw
        }
    }

    private static let membersByLowercasedValue: [String: ADIQSOUploadStatus] = [
        "y": .yes,
        "n": .no,
        "m": .modified,
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
