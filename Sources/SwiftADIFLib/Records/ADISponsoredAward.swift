/// The ADIF `Sponsored Award` enumeration.
///
/// - Note: See the specification's section III.B for the authoritative list of
///   sponsored award values.
public enum ADISponsoredAward: ADIEnumeration {
    ///
    /// Sponsoring Organization: ADIF Development Group
    case adif
    ///
    /// Sponsoring Organization: ARI - l'Associazione Radioamatori Italiani
    case ari
    ///
    /// Sponsoring Organization: ARRL - American Radio Relay League
    case arrl
    ///
    /// Sponsoring Organization: CQ Magazine
    case cq
    ///
    /// Sponsoring Organization: DARC - Deutscher Amateur-Radio-Club e.V.
    case darc
    ///
    /// Sponsoring Organization: eQSL
    case eqsl
    ///
    /// Sponsoring Organization: IARU - International Amateur Radio Union
    case iaru
    ///
    /// Sponsoring Organization: JARL - Japan Amateur Radio League
    case jarl
    ///
    /// Sponsoring Organization: RSGB - Radio Society of Great Britain
    case rsgb
    ///
    /// Sponsoring Organization: TAG - Tambov award group
    case tag
    ///
    /// Sponsoring Organization: WAB - Worked all Britain
    case wabag

    /// A value that this library does not recognize.
    ///
    /// - Important: This case exists so that unrecognized values survive a
    ///   parse-and-serialize round trip rather than being discarded.
    case unrecognized(String)

    /// Every value the specification defines for this enumeration, in
    /// specification order, excluding ``ADISponsoredAward.unrecognized(_:)``.
    public static let allMembers: [ADISponsoredAward] = [
        .adif,
        .ari,
        .arrl,
        .cq,
        .darc,
        .eqsl,
        .iaru,
        .jarl,
        .rsgb,
        .tag,
        .wabag,
    ]

    /// The values the specification marks as import-only.
    ///
    /// - Note: Empty for enumerations that define no import-only values.
    public static let importOnlyMembers: Set<String> = []

    /// The value in the canonical form the specification uses.
    public var description: String {
        switch self {
        case .adif:
            "ADIF_"
        case .ari:
            "ARI_"
        case .arrl:
            "ARRL_"
        case .cq:
            "CQ_"
        case .darc:
            "DARC_"
        case .eqsl:
            "EQSL_"
        case .iaru:
            "IARU_"
        case .jarl:
            "JARL_"
        case .rsgb:
            "RSGB_"
        case .tag:
            "TAG_"
        case .wabag:
            "WABAG_"
        case let .unrecognized(raw):
            raw
        }
    }

    private static let membersByLowercasedValue: [String: ADISponsoredAward] = [
        "adif_": .adif,
        "ari_": .ari,
        "arrl_": .arrl,
        "cq_": .cq,
        "darc_": .darc,
        "eqsl_": .eqsl,
        "iaru_": .iaru,
        "jarl_": .jarl,
        "rsgb_": .rsgb,
        "tag_": .tag,
        "wabag_": .wabag,
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
