/// The single-character data type indicator that may optionally follow a data
/// specifier's length, conveying the ADIF data type of the specifier's data.
///
/// Data type indicators are case insensitive, so indicators compare and hash
/// without regard to case.
///
/// - Note: The normative source is the "Data Types" table in the ADIF
///   specification at <https://adif.org/adif>. Most data types have no
///   indicator at all and are conveyed only by the meaning of the field.
public enum ADIDataTypeIndicator: Hashable, Sendable, CustomStringConvertible {
    /// The `Boolean` data type, spelled `B`.
    ///
    /// Data is the single ASCII character `Y` or `N` (case insensitive) when
    /// `true` or `false`, respectively.
    case boolean

    /// The `Number` data type, spelled `N`.
    case number

    /// The `Date` data type, spelled `D`.
    ///
    /// Data is eight digits representing a UTC date in `YYYYMMDD` form.
    case date

    /// The `Time` data type, spelled `T`.
    ///
    /// Data is four or six digits representing a UTC time in `HHMM` or
    /// `HHMMSS` form.
    case time

    /// The `String` data type, spelled `S`.
    ///
    /// Data is a sequence of ASCII characters in the range 32 through 126.
    case string

    /// The `IntlString` data type, spelled `I`.
    ///
    /// - Important: Fields of type `IntlString` must only be used in ADX
    ///   files. They cannot be expressed in ADI files.
    case intlString

    /// The `MultilineString` data type, spelled `M`.
    ///
    /// Data is a sequence of characters and line breaks, where a line break is
    /// an ASCII CR immediately followed by an ASCII LF.
    case multilineString

    /// The `IntlMultilineString` data type, spelled `G`.
    ///
    /// - Important: Fields of type `IntlMultilineString` must only be used in
    ///   ADX files. They cannot be expressed in ADI files.
    case intlMultilineString

    /// The `Enumeration` data type, spelled `E`.
    ///
    /// Data is a single value selected from an explicit list of legal,
    /// case-insensitive values.
    case enumeration

    /// The `Location` data type, spelled `L`.
    ///
    /// Data is eleven characters representing a latitude or longitude in
    /// `XDDD MM.MMM` form.
    case location

    /// An indicator that this library does not recognize.
    ///
    /// - Important: This case exists so that unrecognized indicators survive a
    ///   parse-and-serialize round trip rather than being discarded.
    case unrecognized(String)

    /// The indicator in its canonical, uppercase textual form.
    public var description: String {
        switch self {
        case .boolean:
            "B"
        case .number:
            "N"
        case .date:
            "D"
        case .time:
            "T"
        case .string:
            "S"
        case .intlString:
            "I"
        case .multilineString:
            "M"
        case .intlMultilineString:
            "G"
        case .enumeration:
            "E"
        case .location:
            "L"
        case let .unrecognized(rawValue):
            rawValue
        }
    }

    /// Whether a data type with this indicator may appear in an ADI file.
    ///
    /// - Returns: `false` for ``intlString`` and ``intlMultilineString``,
    ///   which the specification restricts to ADX files.
    public var isPermittedInADI: Bool {
        switch self {
        case .intlString, .intlMultilineString:
            false
        default:
            true
        }
    }

    /// Creates an indicator from its textual form.
    ///
    /// - Parameter rawValue: The indicator, in any case.
    /// - Returns: The matching indicator, or `nil` if `rawValue` is empty.
    public init?(rawValue: some StringProtocol) {
        let normalized = rawValue.uppercased()
        guard !normalized.isEmpty else {
            return nil
        }

        self = switch normalized {
        case "B":
            .boolean
        case "N":
            .number
        case "D":
            .date
        case "T":
            .time
        case "S":
            .string
        case "I":
            .intlString
        case "M":
            .multilineString
        case "G":
            .intlMultilineString
        case "E":
            .enumeration
        case "L":
            .location
        default:
            .unrecognized(normalized)
        }
    }
}
