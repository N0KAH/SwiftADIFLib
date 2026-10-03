/// The ADIF `Award` enumeration.
///
/// - Note: See the specification's section III.B for the authoritative list of
///   award values.
public enum ADIAward: ADIEnumeration {
    /// The specification's `AJA` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case aja
    /// The specification's `CQDX` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case cqdx
    /// The specification's `CQDXFIELD` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case cqdxfield
    /// The specification's `CQWAZ_MIXED` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case cqwazMixed
    /// The specification's `CQWAZ_CW` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case cqwazCw
    /// The specification's `CQWAZ_PHONE` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case cqwazPhone
    /// The specification's `CQWAZ_RTTY` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case cqwazRtty
    /// The specification's `CQWAZ_160m` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case cqwaz160m
    /// The specification's `CQWPX` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case cqwpx
    /// The specification's `DARC_DOK` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case darcDok
    /// The specification's `DXCC` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case dxcc
    /// The specification's `DXCC_MIXED` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case dxccMixed
    /// The specification's `DXCC_CW` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case dxccCw
    /// The specification's `DXCC_PHONE` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case dxccPhone
    /// The specification's `DXCC_RTTY` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case dxccRtty
    /// The specification's `IOTA` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case iota
    /// The specification's `JCC` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case jcc
    /// The specification's `JCG` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case jcg
    /// The specification's `MARATHON` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case marathon
    /// The specification's `RDA` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case rda
    /// The specification's `WAB` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case wab
    /// The specification's `WAC` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case wac
    /// The specification's `WAE` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case wae
    /// The specification's `WAIP` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case waip
    /// The specification's `WAJA` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case waja
    /// The specification's `WAS` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case was
    /// The specification's `WAZ` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case waz
    /// The specification's `USACA` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case usaca
    /// The specification's `VUCC` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case vucc

    /// A value that this library does not recognize.
    ///
    /// - Important: This case exists so that unrecognized values survive a
    ///   parse-and-serialize round trip rather than being discarded.
    case unrecognized(String)

    /// Every value the specification defines for this enumeration, in
    /// specification order, excluding ``ADIAward.unrecognized(_:)``.
    public static let allMembers: [ADIAward] = [
        .aja,
        .cqdx,
        .cqdxfield,
        .cqwazMixed,
        .cqwazCw,
        .cqwazPhone,
        .cqwazRtty,
        .cqwaz160m,
        .cqwpx,
        .darcDok,
        .dxcc,
        .dxccMixed,
        .dxccCw,
        .dxccPhone,
        .dxccRtty,
        .iota,
        .jcc,
        .jcg,
        .marathon,
        .rda,
        .wab,
        .wac,
        .wae,
        .waip,
        .waja,
        .was,
        .waz,
        .usaca,
        .vucc,
    ]

    /// The values the specification marks as import-only.
    ///
    /// - Note: Empty for enumerations that define no import-only values.
    public static let importOnlyMembers: Set<String> = [
        "AJA",
        "CQDX",
        "CQDXFIELD",
        "CQWAZ_MIXED",
        "CQWAZ_CW",
        "CQWAZ_PHONE",
        "CQWAZ_RTTY",
        "CQWAZ_160m",
        "CQWPX",
        "DARC_DOK",
        "DXCC",
        "DXCC_MIXED",
        "DXCC_CW",
        "DXCC_PHONE",
        "DXCC_RTTY",
        "IOTA",
        "JCC",
        "JCG",
        "MARATHON",
        "RDA",
        "WAB",
        "WAC",
        "WAE",
        "WAIP",
        "WAJA",
        "WAS",
        "WAZ",
        "USACA",
        "VUCC",
    ]

    /// The value in the canonical form the specification uses.
    public var description: String {
        switch self {
        case .aja:
            "AJA"
        case .cqdx:
            "CQDX"
        case .cqdxfield:
            "CQDXFIELD"
        case .cqwazMixed:
            "CQWAZ_MIXED"
        case .cqwazCw:
            "CQWAZ_CW"
        case .cqwazPhone:
            "CQWAZ_PHONE"
        case .cqwazRtty:
            "CQWAZ_RTTY"
        case .cqwaz160m:
            "CQWAZ_160m"
        case .cqwpx:
            "CQWPX"
        case .darcDok:
            "DARC_DOK"
        case .dxcc:
            "DXCC"
        case .dxccMixed:
            "DXCC_MIXED"
        case .dxccCw:
            "DXCC_CW"
        case .dxccPhone:
            "DXCC_PHONE"
        case .dxccRtty:
            "DXCC_RTTY"
        case .iota:
            "IOTA"
        case .jcc:
            "JCC"
        case .jcg:
            "JCG"
        case .marathon:
            "MARATHON"
        case .rda:
            "RDA"
        case .wab:
            "WAB"
        case .wac:
            "WAC"
        case .wae:
            "WAE"
        case .waip:
            "WAIP"
        case .waja:
            "WAJA"
        case .was:
            "WAS"
        case .waz:
            "WAZ"
        case .usaca:
            "USACA"
        case .vucc:
            "VUCC"
        case let .unrecognized(raw):
            raw
        }
    }

    private static let membersByLowercasedValue: [String: ADIAward] = [
        "aja": .aja,
        "cqdx": .cqdx,
        "cqdxfield": .cqdxfield,
        "cqwaz_mixed": .cqwazMixed,
        "cqwaz_cw": .cqwazCw,
        "cqwaz_phone": .cqwazPhone,
        "cqwaz_rtty": .cqwazRtty,
        "cqwaz_160m": .cqwaz160m,
        "cqwpx": .cqwpx,
        "darc_dok": .darcDok,
        "dxcc": .dxcc,
        "dxcc_mixed": .dxccMixed,
        "dxcc_cw": .dxccCw,
        "dxcc_phone": .dxccPhone,
        "dxcc_rtty": .dxccRtty,
        "iota": .iota,
        "jcc": .jcc,
        "jcg": .jcg,
        "marathon": .marathon,
        "rda": .rda,
        "wab": .wab,
        "wac": .wac,
        "wae": .wae,
        "waip": .waip,
        "waja": .waja,
        "was": .was,
        "waz": .waz,
        "usaca": .usaca,
        "vucc": .vucc,
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
