/// The ADIF `Propagation Mode` enumeration.
///
/// - Note: See the specification's section III.B for the authoritative list of
///   propagation mode values.
public enum ADIPropagationMode: ADIEnumeration {
    /// The specification's `AS` value.
    case aircraftScatter
    /// The specification's `AUE` value.
    case auroraE
    /// The specification's `AUR` value.
    case aurora
    /// The specification's `BS` value.
    case backScatter
    /// The specification's `ECH` value.
    case echoLink
    /// The specification's `EME` value.
    case earthMoonEarth
    /// The specification's `ES` value.
    case sporadicE
    /// The specification's `F2` value.
    case f2Reflection
    /// The specification's `FAI` value.
    case fieldAlignedIrregularities
    /// The specification's `GWAVE` value.
    case groundWave
    /// The specification's `INTERNET` value.
    case internetAssisted
    /// The specification's `ION` value.
    case ionoscatter
    /// The specification's `IRL` value.
    case irlp
    ///
    /// Line of Sight (includes transmission through obstacles such as walls)
    case lineOfSight
    /// The specification's `MS` value.
    case meteorScatter
    ///
    /// Terrestrial or atmospheric repeater or transponder
    case repeaterOrTransponder
    /// The specification's `RS` value.
    case rainScatter
    /// The specification's `SAT` value.
    case satellite
    /// The specification's `TEP` value.
    case transEquatorial
    /// The specification's `TR` value.
    case troposphericDucting

    /// A value that this library does not recognize.
    ///
    /// - Important: This case exists so that unrecognized values survive a
    ///   parse-and-serialize round trip rather than being discarded.
    case unrecognized(String)

    /// Every value the specification defines for this enumeration, in
    /// specification order, excluding ``ADIPropagationMode.unrecognized(_:)``.
    public static let allMembers: [ADIPropagationMode] = [
        .aircraftScatter,
        .auroraE,
        .aurora,
        .backScatter,
        .echoLink,
        .earthMoonEarth,
        .sporadicE,
        .f2Reflection,
        .fieldAlignedIrregularities,
        .groundWave,
        .internetAssisted,
        .ionoscatter,
        .irlp,
        .lineOfSight,
        .meteorScatter,
        .repeaterOrTransponder,
        .rainScatter,
        .satellite,
        .transEquatorial,
        .troposphericDucting,
    ]

    /// The values the specification marks as import-only.
    ///
    /// - Note: Empty for enumerations that define no import-only values.
    public static let importOnlyMembers: Set<String> = []

    /// The value in the canonical form the specification uses.
    public var description: String {
        switch self {
        case .aircraftScatter:
            "AS"
        case .auroraE:
            "AUE"
        case .aurora:
            "AUR"
        case .backScatter:
            "BS"
        case .echoLink:
            "ECH"
        case .earthMoonEarth:
            "EME"
        case .sporadicE:
            "ES"
        case .f2Reflection:
            "F2"
        case .fieldAlignedIrregularities:
            "FAI"
        case .groundWave:
            "GWAVE"
        case .internetAssisted:
            "INTERNET"
        case .ionoscatter:
            "ION"
        case .irlp:
            "IRL"
        case .lineOfSight:
            "LOS"
        case .meteorScatter:
            "MS"
        case .repeaterOrTransponder:
            "RPT"
        case .rainScatter:
            "RS"
        case .satellite:
            "SAT"
        case .transEquatorial:
            "TEP"
        case .troposphericDucting:
            "TR"
        case let .unrecognized(raw):
            raw
        }
    }

    private static let membersByLowercasedValue: [String: ADIPropagationMode] = [
        "as": .aircraftScatter,
        "aue": .auroraE,
        "aur": .aurora,
        "bs": .backScatter,
        "ech": .echoLink,
        "eme": .earthMoonEarth,
        "es": .sporadicE,
        "f2": .f2Reflection,
        "fai": .fieldAlignedIrregularities,
        "gwave": .groundWave,
        "internet": .internetAssisted,
        "ion": .ionoscatter,
        "irl": .irlp,
        "los": .lineOfSight,
        "ms": .meteorScatter,
        "rpt": .repeaterOrTransponder,
        "rs": .rainScatter,
        "sat": .satellite,
        "tep": .transEquatorial,
        "tr": .troposphericDucting,
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
