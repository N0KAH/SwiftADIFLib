/// The ADIF `QSL Sent` enumeration.
///
/// - Note: See the specification's section III.B for the authoritative list of
///   qsl sent values.
public enum ADIQSLSent: ADIEnumeration {
    ///
    /// an outgoing QSL card has been sent the QSO has been uploaded to, and
    /// accepted by, the online service
    case yes
    ///
    /// do not send an outgoing QSL card do not upload the QSO to the online service
    case no
    ///
    /// the contacted station has requested a QSL card the contacted station has
    /// requested the QSO be uploaded to the online service
    case requested
    ///
    /// an outgoing QSL card has been selected to be sent a QSO has been selected to
    /// be uploaded to the online service
    case queued
    /// The specification's `I` value.
    case ignoreOrInvalid

    /// A value that this library does not recognize.
    ///
    /// - Important: This case exists so that unrecognized values survive a
    ///   parse-and-serialize round trip rather than being discarded.
    case unrecognized(String)

    /// Every value the specification defines for this enumeration, in
    /// specification order, excluding ``ADIQSLSent.unrecognized(_:)``.
    public static let allMembers: [ADIQSLSent] = [
        .yes,
        .no,
        .requested,
        .queued,
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
        case .requested:
            "R"
        case .queued:
            "Q"
        case .ignoreOrInvalid:
            "I"
        case let .unrecognized(raw):
            raw
        }
    }

    private static let membersByLowercasedValue: [String: ADIQSLSent] = [
        "y": .yes,
        "n": .no,
        "r": .requested,
        "q": .queued,
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
