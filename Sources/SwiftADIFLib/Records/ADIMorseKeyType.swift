/// The ADIF `Morse Key Type` enumeration.
///
/// - Note: See the specification's section III.B for the authoritative list of
///   morse key type values.
public enum ADIMorseKeyType: ADIEnumeration {
    ///
    /// Characteristics: a single control which actuates a single switch.
    ///
    /// Morse Composition: a human makes the dits and dahs and builds characters
    ///
    /// Examples: Lionel J-38
    case straightKey
    ///
    /// Characteristics: a single control which actuates a SPDT (single poll, double
    /// throw) switch.
    ///
    /// Morse Composition: a human makes the dits and dahs and builds characters
    ///
    /// Examples: W1SFR Green Machine Torsion Bar Cootie
    case sideswiper
    ///
    /// Mechanical semi-automatic keyer or Bug
    ///
    /// Characteristics: a control which actuates a switch as well as a control
    /// which actuates a spring and pendulum mechanism which actuates a switch. Both
    /// switches are wired in parallel.
    ///
    /// Morse Composition: a machine makes the dits and a human makes the dahs and
    /// builds characters.
    ///
    /// Examples: Vibroplex Blue Racer Deluxe
    case bug
    ///
    /// Mechanical fully-automatic keyer or Bug
    ///
    /// Characteristics: a control which actuates one of two separate spring and
    /// pendulum mechanisms at a time, each of which actuates a switch. Both
    /// switches are wired in parallel.
    ///
    /// Morse Composition: a machine makes the dits and the dahs and a human builds
    /// characters.
    ///
    /// Examples: GHD GN209FA fully-automatic bug
    case fullyAutomaticKeyer
    ///
    /// Characteristics: a single control which actuates two independent switches.
    ///
    /// Morse Composition: a machine makes the dits and the dahs and a human builds
    /// the characters.
    ///
    /// Examples: American Morse Mini-B
    case singlePaddle
    ///
    /// Characteristics: two controls which actuate independent switches.
    ///
    /// Morse Composition: a machine makes the dits and the dahs and a human builds
    /// the characters.
    ///
    /// Examples: Begali Sculpture, VK3IL pressure paddles, M0UKD capacitive touch
    /// paddles
    case dualPaddle
    ///
    /// Characteristics: an electronic device performs the actuation of the switch.
    ///
    /// Morse Composition: a machine makes the dits and dahs to build the
    /// characters.
    ///
    /// Examples: N1MM+ Logging Software
    case computerDriven

    /// A value that this library does not recognize.
    ///
    /// - Important: This case exists so that unrecognized values survive a
    ///   parse-and-serialize round trip rather than being discarded.
    case unrecognized(String)

    /// Every value the specification defines for this enumeration, in
    /// specification order, excluding ``ADIMorseKeyType.unrecognized(_:)``.
    public static let allMembers: [ADIMorseKeyType] = [
        .straightKey,
        .sideswiper,
        .bug,
        .fullyAutomaticKeyer,
        .singlePaddle,
        .dualPaddle,
        .computerDriven,
    ]

    /// The values the specification marks as import-only.
    ///
    /// - Note: Empty for enumerations that define no import-only values.
    public static let importOnlyMembers: Set<String> = []

    /// The value in the canonical form the specification uses.
    public var description: String {
        switch self {
        case .straightKey:
            "SK"
        case .sideswiper:
            "SS"
        case .bug:
            "BUG"
        case .fullyAutomaticKeyer:
            "FAB"
        case .singlePaddle:
            "SP"
        case .dualPaddle:
            "DP"
        case .computerDriven:
            "CPU"
        case let .unrecognized(raw):
            raw
        }
    }

    private static let membersByLowercasedValue: [String: ADIMorseKeyType] = [
        "sk": .straightKey,
        "ss": .sideswiper,
        "bug": .bug,
        "fab": .fullyAutomaticKeyer,
        "sp": .singlePaddle,
        "dp": .dualPaddle,
        "cpu": .computerDriven,
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
