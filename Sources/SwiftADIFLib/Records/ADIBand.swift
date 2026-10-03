/// The ADIF `Band` enumeration.
///
/// - Note: See the specification's section III.B for the authoritative list of
///   band values.
public enum ADIBand: ADIEnumeration {
    ///
    /// Lower Freq (MHz): .1357
    ///
    /// Upper Freq (MHz): .1378
    case band2190m
    ///
    /// Lower Freq (MHz): .472
    ///
    /// Upper Freq (MHz): .479
    case band630m
    ///
    /// Lower Freq (MHz): .501
    ///
    /// Upper Freq (MHz): .504
    case band560m
    ///
    /// Lower Freq (MHz): 1.8
    ///
    /// Upper Freq (MHz): 2.0
    case band160m
    ///
    /// Lower Freq (MHz): 3.5
    ///
    /// Upper Freq (MHz): 4.0
    case band80m
    ///
    /// Lower Freq (MHz): 5.06
    ///
    /// Upper Freq (MHz): 5.45
    case band60m
    ///
    /// Lower Freq (MHz): 7.0
    ///
    /// Upper Freq (MHz): 7.3
    case band40m
    ///
    /// Lower Freq (MHz): 10.1
    ///
    /// Upper Freq (MHz): 10.15
    case band30m
    ///
    /// Lower Freq (MHz): 14.0
    ///
    /// Upper Freq (MHz): 14.35
    case band20m
    ///
    /// Lower Freq (MHz): 18.068
    ///
    /// Upper Freq (MHz): 18.168
    case band17m
    ///
    /// Lower Freq (MHz): 21.0
    ///
    /// Upper Freq (MHz): 21.45
    case band15m
    ///
    /// Lower Freq (MHz): 24.890
    ///
    /// Upper Freq (MHz): 24.99
    case band12m
    ///
    /// Lower Freq (MHz): 28.0
    ///
    /// Upper Freq (MHz): 29.7
    case band10m
    ///
    /// Lower Freq (MHz): 40
    ///
    /// Upper Freq (MHz): 45
    case band8m
    ///
    /// Lower Freq (MHz): 50
    ///
    /// Upper Freq (MHz): 54
    case band6m
    ///
    /// Lower Freq (MHz): 54.000001
    ///
    /// Upper Freq (MHz): 69.9
    case band5m
    ///
    /// Lower Freq (MHz): 70
    ///
    /// Upper Freq (MHz): 71
    case band4m
    ///
    /// Lower Freq (MHz): 144
    ///
    /// Upper Freq (MHz): 148
    case band2m
    ///
    /// Lower Freq (MHz): 222
    ///
    /// Upper Freq (MHz): 225
    case band125m
    ///
    /// Lower Freq (MHz): 420
    ///
    /// Upper Freq (MHz): 450
    case band70cm
    ///
    /// Lower Freq (MHz): 902
    ///
    /// Upper Freq (MHz): 928
    case band33cm
    ///
    /// Lower Freq (MHz): 1240
    ///
    /// Upper Freq (MHz): 1300
    case band23cm
    ///
    /// Lower Freq (MHz): 2300
    ///
    /// Upper Freq (MHz): 2450
    case band13cm
    ///
    /// Lower Freq (MHz): 3300
    ///
    /// Upper Freq (MHz): 3500
    case band9cm
    ///
    /// Lower Freq (MHz): 5650
    ///
    /// Upper Freq (MHz): 5925
    case band6cm
    ///
    /// Lower Freq (MHz): 10000
    ///
    /// Upper Freq (MHz): 10500
    case band3cm
    ///
    /// Lower Freq (MHz): 24000
    ///
    /// Upper Freq (MHz): 24250
    case band125cm
    ///
    /// Lower Freq (MHz): 47000
    ///
    /// Upper Freq (MHz): 47200
    case band6mm
    ///
    /// Lower Freq (MHz): 75500
    ///
    /// Upper Freq (MHz): 81000
    case band4mm
    ///
    /// Lower Freq (MHz): 119980
    ///
    /// Upper Freq (MHz): 123000
    case band25mm
    ///
    /// Lower Freq (MHz): 134000
    ///
    /// Upper Freq (MHz): 149000
    case band2mm
    ///
    /// Lower Freq (MHz): 241000
    ///
    /// Upper Freq (MHz): 250000
    case band1mm
    ///
    /// Lower Freq (MHz): 300000
    ///
    /// Upper Freq (MHz): 7500000
    case submm

    /// A value that this library does not recognize.
    ///
    /// - Important: This case exists so that unrecognized values survive a
    ///   parse-and-serialize round trip rather than being discarded.
    case unrecognized(String)

    /// Every value the specification defines for this enumeration, in
    /// specification order, excluding ``ADIBand.unrecognized(_:)``.
    public static let allMembers: [ADIBand] = [
        .band2190m,
        .band630m,
        .band560m,
        .band160m,
        .band80m,
        .band60m,
        .band40m,
        .band30m,
        .band20m,
        .band17m,
        .band15m,
        .band12m,
        .band10m,
        .band8m,
        .band6m,
        .band5m,
        .band4m,
        .band2m,
        .band125m,
        .band70cm,
        .band33cm,
        .band23cm,
        .band13cm,
        .band9cm,
        .band6cm,
        .band3cm,
        .band125cm,
        .band6mm,
        .band4mm,
        .band25mm,
        .band2mm,
        .band1mm,
        .submm,
    ]

    /// The values the specification marks as import-only.
    ///
    /// - Note: Empty for enumerations that define no import-only values.
    public static let importOnlyMembers: Set<String> = []

    /// The value in the canonical form the specification uses.
    public var description: String {
        switch self {
        case .band2190m:
            "2190m"
        case .band630m:
            "630m"
        case .band560m:
            "560m"
        case .band160m:
            "160m"
        case .band80m:
            "80m"
        case .band60m:
            "60m"
        case .band40m:
            "40m"
        case .band30m:
            "30m"
        case .band20m:
            "20m"
        case .band17m:
            "17m"
        case .band15m:
            "15m"
        case .band12m:
            "12m"
        case .band10m:
            "10m"
        case .band8m:
            "8m"
        case .band6m:
            "6m"
        case .band5m:
            "5m"
        case .band4m:
            "4m"
        case .band2m:
            "2m"
        case .band125m:
            "1.25m"
        case .band70cm:
            "70cm"
        case .band33cm:
            "33cm"
        case .band23cm:
            "23cm"
        case .band13cm:
            "13cm"
        case .band9cm:
            "9cm"
        case .band6cm:
            "6cm"
        case .band3cm:
            "3cm"
        case .band125cm:
            "1.25cm"
        case .band6mm:
            "6mm"
        case .band4mm:
            "4mm"
        case .band25mm:
            "2.5mm"
        case .band2mm:
            "2mm"
        case .band1mm:
            "1mm"
        case .submm:
            "submm"
        case let .unrecognized(raw):
            raw
        }
    }

    private static let membersByLowercasedValue: [String: ADIBand] = [
        "2190m": .band2190m,
        "630m": .band630m,
        "560m": .band560m,
        "160m": .band160m,
        "80m": .band80m,
        "60m": .band60m,
        "40m": .band40m,
        "30m": .band30m,
        "20m": .band20m,
        "17m": .band17m,
        "15m": .band15m,
        "12m": .band12m,
        "10m": .band10m,
        "8m": .band8m,
        "6m": .band6m,
        "5m": .band5m,
        "4m": .band4m,
        "2m": .band2m,
        "1.25m": .band125m,
        "70cm": .band70cm,
        "33cm": .band33cm,
        "23cm": .band23cm,
        "13cm": .band13cm,
        "9cm": .band9cm,
        "6cm": .band6cm,
        "3cm": .band3cm,
        "1.25cm": .band125cm,
        "6mm": .band6mm,
        "4mm": .band4mm,
        "2.5mm": .band25mm,
        "2mm": .band2mm,
        "1mm": .band1mm,
        "submm": .submm,
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
