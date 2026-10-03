/// A region of New Zealand, and the districts within it.
///
/// The specification defines these in its section III.B.23.a as the alternative
/// subdivision enumeration `NZ_Regions`, which the `CNTY_ALT` field uses for New
/// Zealand instead of an awarding body's list.
///
/// - Note: A code is the enumeration name, a colon, the region and district joined
///   by a slash, such as `NZ_Regions:Northland/Far North`.
public struct ADINewZealandRegion: Hashable, Sendable, CustomStringConvertible {
    /// The subdivision's code, as the specification spells it.
    public let code: String

    /// The region this district sits in.
    public let region: String

    /// The district within the region.
    public let district: String

    /// Every New Zealand region and district the specification defines.
    public static let allRegions: [ADINewZealandRegion] = [
        ADINewZealandRegion(code: "NZ_Regions:Northland/Far North", region: "Northland", district: "Far North"),
        ADINewZealandRegion(code: "NZ_Regions:Northland/Whangarei", region: "Northland", district: "Whangarei"),
        ADINewZealandRegion(code: "NZ_Regions:Northland/Kaipara", region: "Northland", district: "Kaipara"),
        ADINewZealandRegion(code: "NZ_Regions:Auckland/Rodney", region: "Auckland", district: "Rodney"),
        ADINewZealandRegion(code: "NZ_Regions:Auckland/North Shore", region: "Auckland", district: "North Shore"),
        ADINewZealandRegion(code: "NZ_Regions:Auckland/Waitakere", region: "Auckland", district: "Waitakere"),
        ADINewZealandRegion(code: "NZ_Regions:Auckland/Auckland", region: "Auckland", district: "Auckland"),
        ADINewZealandRegion(code: "NZ_Regions:Auckland/Manukau", region: "Auckland", district: "Manukau"),
        ADINewZealandRegion(code: "NZ_Regions:Auckland/Papakura", region: "Auckland", district: "Papakura"),
        ADINewZealandRegion(code: "NZ_Regions:Auckland/Franklin", region: "Auckland", district: "Franklin"),
        ADINewZealandRegion(code: "NZ_Regions:Waikato/Thames-Coromandel", region: "Waikato", district: "Thames-Coromandel"),
        ADINewZealandRegion(code: "NZ_Regions:Waikato/Hauraki", region: "Waikato", district: "Hauraki"),
        ADINewZealandRegion(code: "NZ_Regions:Waikato/Waikato", region: "Waikato", district: "Waikato"),
        ADINewZealandRegion(code: "NZ_Regions:Waikato/Matamata Piako", region: "Waikato", district: "Matamata Piako"),
        ADINewZealandRegion(code: "NZ_Regions:Waikato/Hamilton", region: "Waikato", district: "Hamilton"),
        ADINewZealandRegion(code: "NZ_Regions:Waikato/Waipa", region: "Waikato", district: "Waipa"),
        ADINewZealandRegion(code: "NZ_Regions:Waikato/Otorohanga", region: "Waikato", district: "Otorohanga"),
        ADINewZealandRegion(code: "NZ_Regions:Waikato/South Waikato", region: "Waikato", district: "South Waikato"),
        ADINewZealandRegion(code: "NZ_Regions:Waikato/Waitomo", region: "Waikato", district: "Waitomo"),
        ADINewZealandRegion(code: "NZ_Regions:Waikato/Taupo", region: "Waikato", district: "Taupo"),
        ADINewZealandRegion(code: "NZ_Regions:Bay of Plenty/Western Bay of Plenty", region: "Bay of Plenty", district: "Western Bay of Plenty"),
        ADINewZealandRegion(code: "NZ_Regions:Bay of Plenty/Tauranga", region: "Bay of Plenty", district: "Tauranga"),
        ADINewZealandRegion(code: "NZ_Regions:Bay of Plenty/Rotorua", region: "Bay of Plenty", district: "Rotorua"),
        ADINewZealandRegion(code: "NZ_Regions:Bay of Plenty/Kawerau", region: "Bay of Plenty", district: "Kawerau"),
        ADINewZealandRegion(code: "NZ_Regions:Bay of Plenty/Whakatane", region: "Bay of Plenty", district: "Whakatane"),
        ADINewZealandRegion(code: "NZ_Regions:Bay of Plenty/Opotiki", region: "Bay of Plenty", district: "Opotiki"),
        ADINewZealandRegion(code: "NZ_Regions:Gisborne/Gisborne", region: "Gisborne", district: "Gisborne"),
        ADINewZealandRegion(code: "NZ_Regions:Hawkes Bay/Wairoa", region: "Hawkes Bay", district: "Wairoa"),
        ADINewZealandRegion(code: "NZ_Regions:Hawkes Bay/Hastings", region: "Hawkes Bay", district: "Hastings"),
        ADINewZealandRegion(code: "NZ_Regions:Hawkes Bay/Napier", region: "Hawkes Bay", district: "Napier"),
        ADINewZealandRegion(code: "NZ_Regions:Hawkes Bay/Central Hawkes Bay", region: "Hawkes Bay", district: "Central Hawkes Bay"),
        ADINewZealandRegion(code: "NZ_Regions:Taranaki/New Plymouth", region: "Taranaki", district: "New Plymouth"),
        ADINewZealandRegion(code: "NZ_Regions:Taranaki/Stratford", region: "Taranaki", district: "Stratford"),
        ADINewZealandRegion(code: "NZ_Regions:Taranaki/South Taranaki", region: "Taranaki", district: "South Taranaki"),
        ADINewZealandRegion(code: "NZ_Regions:Wanganui-Manawatu/Ruapehu", region: "Wanganui-Manawatu", district: "Ruapehu"),
        ADINewZealandRegion(code: "NZ_Regions:Wanganui-Manawatu/Wanganui", region: "Wanganui-Manawatu", district: "Wanganui"),
        ADINewZealandRegion(code: "NZ_Regions:Wanganui-Manawatu/Rangitikei", region: "Wanganui-Manawatu", district: "Rangitikei"),
        ADINewZealandRegion(code: "NZ_Regions:Wanganui-Manawatu/Manawatu", region: "Wanganui-Manawatu", district: "Manawatu"),
        ADINewZealandRegion(code: "NZ_Regions:Wanganui-Manawatu/Palmerston North", region: "Wanganui-Manawatu", district: "Palmerston North"),
        ADINewZealandRegion(code: "NZ_Regions:Wanganui-Manawatu/Horowhenua", region: "Wanganui-Manawatu", district: "Horowhenua"),
        ADINewZealandRegion(code: "NZ_Regions:Wanganui-Manawatu/Tararua", region: "Wanganui-Manawatu", district: "Tararua"),
        ADINewZealandRegion(code: "NZ_Regions:Wellington/Masterton", region: "Wellington", district: "Masterton"),
        ADINewZealandRegion(code: "NZ_Regions:Wellington/Carterton", region: "Wellington", district: "Carterton"),
        ADINewZealandRegion(code: "NZ_Regions:Wellington/South Wairarapa", region: "Wellington", district: "South Wairarapa"),
        ADINewZealandRegion(code: "NZ_Regions:Wellington/Kapiti Coast", region: "Wellington", district: "Kapiti Coast"),
        ADINewZealandRegion(code: "NZ_Regions:Wellington/Porirua", region: "Wellington", district: "Porirua"),
        ADINewZealandRegion(code: "NZ_Regions:Wellington/Upper Hutt", region: "Wellington", district: "Upper Hutt"),
        ADINewZealandRegion(code: "NZ_Regions:Wellington/Lower Hutt", region: "Wellington", district: "Lower Hutt"),
        ADINewZealandRegion(code: "NZ_Regions:Wellington/Wellington", region: "Wellington", district: "Wellington"),
        ADINewZealandRegion(code: "NZ_Regions:Nelson/Nelson", region: "Nelson", district: "Nelson"),
        ADINewZealandRegion(code: "NZ_Regions:Marlborough/Marlborough", region: "Marlborough", district: "Marlborough"),
        ADINewZealandRegion(code: "NZ_Regions:Tasman/Tasman", region: "Tasman", district: "Tasman"),
        ADINewZealandRegion(code: "NZ_Regions:West Coast/Buller", region: "West Coast", district: "Buller"),
        ADINewZealandRegion(code: "NZ_Regions:West Coast/Grey", region: "West Coast", district: "Grey"),
        ADINewZealandRegion(code: "NZ_Regions:West Coast/Westland", region: "West Coast", district: "Westland"),
        ADINewZealandRegion(code: "NZ_Regions:Canterbury/Kaikoura", region: "Canterbury", district: "Kaikoura"),
        ADINewZealandRegion(code: "NZ_Regions:Canterbury/Hurunui", region: "Canterbury", district: "Hurunui"),
        ADINewZealandRegion(code: "NZ_Regions:Canterbury/Selwyn", region: "Canterbury", district: "Selwyn"),
        ADINewZealandRegion(code: "NZ_Regions:Canterbury/Waimakariri", region: "Canterbury", district: "Waimakariri"),
        ADINewZealandRegion(code: "NZ_Regions:Canterbury/Christchurch", region: "Canterbury", district: "Christchurch"),
        ADINewZealandRegion(code: "NZ_Regions:Canterbury/Banks Peninsula", region: "Canterbury", district: "Banks Peninsula"),
        ADINewZealandRegion(code: "NZ_Regions:Canterbury/Ashburton", region: "Canterbury", district: "Ashburton"),
        ADINewZealandRegion(code: "NZ_Regions:Canterbury/Mackenzie", region: "Canterbury", district: "Mackenzie"),
        ADINewZealandRegion(code: "NZ_Regions:Canterbury/Timaru", region: "Canterbury", district: "Timaru"),
        ADINewZealandRegion(code: "NZ_Regions:Canterbury/Waimate", region: "Canterbury", district: "Waimate"),
        ADINewZealandRegion(code: "NZ_Regions:Otago/Waitaki", region: "Otago", district: "Waitaki"),
        ADINewZealandRegion(code: "NZ_Regions:Otago/Queenstown-Lakes", region: "Otago", district: "Queenstown-Lakes"),
        ADINewZealandRegion(code: "NZ_Regions:Otago/Central Otago", region: "Otago", district: "Central Otago"),
        ADINewZealandRegion(code: "NZ_Regions:Otago/Dunedin", region: "Otago", district: "Dunedin"),
        ADINewZealandRegion(code: "NZ_Regions:Otago/Clutha", region: "Otago", district: "Clutha"),
        ADINewZealandRegion(code: "NZ_Regions:Southland/Gore", region: "Southland", district: "Gore"),
        ADINewZealandRegion(code: "NZ_Regions:Southland/Southland", region: "Southland", district: "Southland"),
        ADINewZealandRegion(code: "NZ_Regions:Southland/Invercargill", region: "Southland", district: "Invercargill")
    ]

    private static let regionsByCode: [String: ADINewZealandRegion] = {
        var index = [String: ADINewZealandRegion](minimumCapacity: Self.allRegions.count)
        for region in Self.allRegions {
            index[region.code.uppercased()] = region
        }

        return index
    }()

    private static let regionsByRegion: [String: [ADINewZealandRegion]] = {
        var index = [String: [ADINewZealandRegion]](minimumCapacity: 16)
        for region in Self.allRegions {
            index[region.region.lowercased(), default: []].append(region)
        }

        return index
    }()

    /// The subdivision's code.
    public var description: String {
        code
    }

    /// Creates a region from its specification data.
    ///
    /// - Parameters:
    ///   - code: The subdivision's code.
    ///   - region: The region this district sits in.
    ///   - district: The district within the region.
    public init(code: String, region: String, district: String) {
        self.code = code
        self.region = region
        self.district = district
    }

    /// Creates a region by looking up its code.
    ///
    /// - Parameter code: The subdivision code, in any case.
    /// - Returns: The matching region and district, or `nil` if the specification
    ///   defines none with that code.
    public init?(code: some StringProtocol) {
        guard let region = Self.regionsByCode[code.uppercased()] else {
            return nil
        }

        self = region
    }

    /// Returns every district within a region.
    ///
    /// - Parameter region: The region's name, in any case.
    /// - Returns: That region's districts, in specification order.
    public static func districts(inRegion region: some StringProtocol) -> [ADINewZealandRegion] {
        Self.regionsByRegion[region.lowercased()] ?? []
    }
}
