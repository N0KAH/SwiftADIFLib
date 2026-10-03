/// The ADIF `QSL Rcvd` enumeration.
///
/// - Note: See the specification's section III.B for the authoritative list of
///   qsl rcvd values.
public enum ADIQSLRcvd: ADIEnumeration {
    ///
    /// yes (confirmed)
    ///
    /// an incoming QSL card has been received the QSO has been confirmed by the
    /// online service
    case yes
    ///
    /// an incoming QSL card has not been received the QSO has not been confirmed by
    /// the online service
    case no
    ///
    /// the logging station has requested a QSL card the logging station has
    /// requested the QSO be uploaded to the online service
    case requested
    /// The specification's `I` value.
    case ignoreOrInvalid
    ///
    /// DXCC award credit granted for the QSL card - instead use
    /// <CREDIT_GRANTED:39>DXCC:card,DXCC_BAND:card,DXCC_MODE:card DXCC credit
    /// granted for the LoTW confirmation - instead use
    /// <CREDIT_GRANTED:39>DXCC:lotw,DXCC_BAND:lotw,DXCC_MODE:lotw
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case verified

    /// A value that this library does not recognize.
    ///
    /// - Important: This case exists so that unrecognized values survive a
    ///   parse-and-serialize round trip rather than being discarded.
    case unrecognized(String)

    /// Every value the specification defines for this enumeration, in
    /// specification order, excluding ``ADIQSLRcvd.unrecognized(_:)``.
    public static let allMembers: [ADIQSLRcvd] = [
        .yes,
        .no,
        .requested,
        .ignoreOrInvalid,
        .verified,
    ]

    /// The values the specification marks as import-only.
    ///
    /// - Note: Empty for enumerations that define no import-only values.
    public static let importOnlyMembers: Set<String> = [
        "V",
    ]

    /// The value in the canonical form the specification uses.
    public var description: String {
        switch self {
        case .yes:
            "Y"
        case .no:
            "N"
        case .requested:
            "R"
        case .ignoreOrInvalid:
            "I"
        case .verified:
            "V"
        case let .unrecognized(raw):
            raw
        }
    }

    private static let membersByLowercasedValue: [String: ADIQSLRcvd] = [
        "y": .yes,
        "n": .no,
        "r": .requested,
        "i": .ignoreOrInvalid,
        "v": .verified,
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
