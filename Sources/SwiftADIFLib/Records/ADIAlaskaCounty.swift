/// A borough or census area of Alaska.
///
/// Alaska is the one secondary administrative subdivision the specification lists
/// in full, in its section III.B.22.a, rather than leaving to an awarding body.
/// The `USACA_COUNTIES` field therefore validates against this list.
///
/// - Note: A county's code is the two-letter state abbreviation, a comma, and the
///   county name, such as `AK,Aleutians East`.
public struct ADIAlaskaCounty: Hashable, Sendable, CustomStringConvertible {
    /// The county's code, as the specification spells it.
    public let code: String

    /// The county's name.
    public let name: String

    /// The judicial district the county sits in.
    public let judicialDistrict: String

    /// Whether the specification has retired this county.
    ///
    /// - Note: A retired county is kept rather than dropped so a log that used it
    ///   still validates.
    public let isDeleted: Bool

    /// Every Alaska county the specification defines.
    public static let allCounties: [ADIAlaskaCounty] = [
        ADIAlaskaCounty(code: "AK,Aleutians East", name: "Aleutians East", judicialDistrict: "Alaska Third Judicial District", isDeleted: false),
        ADIAlaskaCounty(code: "AK,Aleutians Islands", name: "Aleutians Islands", judicialDistrict: "Alaska Third Judicial District", isDeleted: true),
        ADIAlaskaCounty(code: "AK,Aleutians West", name: "Aleutians West", judicialDistrict: "Alaska Third Judicial District", isDeleted: false),
        ADIAlaskaCounty(code: "AK,Anchorage", name: "Anchorage", judicialDistrict: "Alaska Third Judicial District", isDeleted: false),
        ADIAlaskaCounty(code: "AK,Angoon", name: "Angoon", judicialDistrict: "Alaska First Judicial District", isDeleted: true),
        ADIAlaskaCounty(code: "AK,Barrow", name: "Barrow", judicialDistrict: "Alaska Second Judicial District", isDeleted: true),
        ADIAlaskaCounty(code: "AK,Bethel", name: "Bethel", judicialDistrict: "Alaska Fourth Judicial District", isDeleted: false),
        ADIAlaskaCounty(code: "AK,Bristol Bay", name: "Bristol Bay", judicialDistrict: "Alaska Third Judicial District", isDeleted: false),
        ADIAlaskaCounty(code: "AK,Cordova-McCarthy", name: "Cordova-McCarthy", judicialDistrict: "Alaska Third Judicial District", isDeleted: true),
        ADIAlaskaCounty(code: "AK,Denali", name: "Denali", judicialDistrict: "Alaska Fourth Judicial District", isDeleted: false),
        ADIAlaskaCounty(code: "AK,Dillingham", name: "Dillingham", judicialDistrict: "Alaska Third Judicial District", isDeleted: false),
        ADIAlaskaCounty(code: "AK,Fairbanks", name: "Fairbanks", judicialDistrict: "Alaska Fourth Judicial District", isDeleted: false),
        ADIAlaskaCounty(code: "AK,Fairbanks North Star", name: "Fairbanks North Star", judicialDistrict: "Alaska Fourth Judicial District", isDeleted: false),
        ADIAlaskaCounty(code: "AK,First Judicial District", name: "First Judicial District", judicialDistrict: "Alaska First Judicial District", isDeleted: true),
        ADIAlaskaCounty(code: "AK,Fourth Judicial District", name: "Fourth Judicial District", judicialDistrict: "Alaska Fourth Judicial District", isDeleted: true),
        ADIAlaskaCounty(code: "AK,Haines", name: "Haines", judicialDistrict: "Alaska First Judicial District", isDeleted: false),
        ADIAlaskaCounty(code: "AK,Juneau", name: "Juneau", judicialDistrict: "Alaska First Judicial District", isDeleted: false),
        ADIAlaskaCounty(code: "AK,Hoonah-Angoon", name: "Hoonah-Angoon", judicialDistrict: "Alaska First Judicial District", isDeleted: false),
        ADIAlaskaCounty(code: "AK,Kenai Peninsula", name: "Kenai Peninsula", judicialDistrict: "Alaska Third Judicial District", isDeleted: false),
        ADIAlaskaCounty(code: "AK,Kenai-Cook Inlet", name: "Kenai-Cook Inlet", judicialDistrict: "Alaska Third Judicial District", isDeleted: true),
        ADIAlaskaCounty(code: "AK,Ketchikan", name: "Ketchikan", judicialDistrict: "Alaska First Judicial District", isDeleted: true),
        ADIAlaskaCounty(code: "AK,Ketchikan Gateway", name: "Ketchikan Gateway", judicialDistrict: "Alaska First Judicial District", isDeleted: false),
        ADIAlaskaCounty(code: "AK,Kobuk", name: "Kobuk", judicialDistrict: "Alaska Second Judicial District", isDeleted: true),
        ADIAlaskaCounty(code: "AK,Kodiak Island", name: "Kodiak Island", judicialDistrict: "Alaska Third Judicial District", isDeleted: false),
        ADIAlaskaCounty(code: "AK,Kuskokwim", name: "Kuskokwim", judicialDistrict: "Alaska Fourth Judicial District", isDeleted: true),
        ADIAlaskaCounty(code: "AK,Kusilvak", name: "Kusilvak", judicialDistrict: "Alaska Second Judicial District", isDeleted: false),
        ADIAlaskaCounty(code: "AK,Lake and Peninsula", name: "Lake and Peninsula", judicialDistrict: "Alaska Third Judicial District", isDeleted: false),
        ADIAlaskaCounty(code: "AK,Lynn Canal-Icy Straits", name: "Lynn Canal-Icy Straits", judicialDistrict: "Alaska First Judicial District", isDeleted: true),
        ADIAlaskaCounty(code: "AK,Matanuska-Susitna", name: "Matanuska-Susitna", judicialDistrict: "Alaska Third Judicial District", isDeleted: false),
        ADIAlaskaCounty(code: "AK,Nome", name: "Nome", judicialDistrict: "Alaska Second Judicial District", isDeleted: false),
        ADIAlaskaCounty(code: "AK,North Slope", name: "North Slope", judicialDistrict: "Alaska Second Judicial District", isDeleted: false),
        ADIAlaskaCounty(code: "AK,Northwest Arctic", name: "Northwest Arctic", judicialDistrict: "Alaska Second Judicial District", isDeleted: false),
        ADIAlaskaCounty(code: "AK,Outer Ketchikan", name: "Outer Ketchikan", judicialDistrict: "Alaska First Judicial District", isDeleted: true),
        ADIAlaskaCounty(code: "AK,Palmer-Wasilla-Talkeetna", name: "Palmer-Wasilla-Talkeetna", judicialDistrict: "Alaska Third Judicial District", isDeleted: true),
        ADIAlaskaCounty(code: "AK,Petersburg", name: "Petersburg", judicialDistrict: "Alaska First Judicial District", isDeleted: false),
        ADIAlaskaCounty(code: "AK,Pribilof Islands", name: "Pribilof Islands", judicialDistrict: "Alaska Third Judicial District", isDeleted: false),
        ADIAlaskaCounty(code: "AK,Prince of Wales", name: "Prince of Wales", judicialDistrict: "Alaska First Judicial District", isDeleted: true),
        ADIAlaskaCounty(code: "AK,Prince of Wales-Hyder", name: "Prince of Wales-Hyder", judicialDistrict: "Alaska First Judicial District", isDeleted: false),
        ADIAlaskaCounty(code: "AK,Prince of Wales-Outer Ketchikan", name: "Prince of Wales-Outer Ketchikan", judicialDistrict: "Alaska First Judicial District", isDeleted: true),
        ADIAlaskaCounty(code: "AK,Saint Matthew Island", name: "Saint Matthew Island", judicialDistrict: "Alaska Fourth Judicial District", isDeleted: false),
        ADIAlaskaCounty(code: "AK,Second Judicial District", name: "Second Judicial District", judicialDistrict: "Alaska Second Judicial District", isDeleted: true),
        ADIAlaskaCounty(code: "AK,Seward", name: "Seward", judicialDistrict: "Alaska Third Judicial District", isDeleted: true),
        ADIAlaskaCounty(code: "AK,Sitka", name: "Sitka", judicialDistrict: "Alaska First Judicial District", isDeleted: false),
        ADIAlaskaCounty(code: "AK,Skagway-Hoonah-Angoon", name: "Skagway-Hoonah-Angoon", judicialDistrict: "Alaska First Judicial District", isDeleted: true),
        ADIAlaskaCounty(code: "AK,Skagway", name: "Skagway", judicialDistrict: "Alaska First Judicial District", isDeleted: false),
        ADIAlaskaCounty(code: "AK,Skagway-Yakuta", name: "Skagway-Yakutat", judicialDistrict: "Alaska First Judicial District", isDeleted: true),
        ADIAlaskaCounty(code: "AK,Skagway-Yakutat-Angoon", name: "Skagway-Yakutat-Angoon", judicialDistrict: "Alaska First Judicial District", isDeleted: true),
        ADIAlaskaCounty(code: "AK,Southeast Fairbanks", name: "Southeast Fairbanks", judicialDistrict: "Alaska Fourth Judicial District", isDeleted: false),
        ADIAlaskaCounty(code: "AK,Third Judicial District", name: "Third Judicial District", judicialDistrict: "Alaska Second Judicial District", isDeleted: true),
        ADIAlaskaCounty(code: "AK,Upper Yukon", name: "Upper Yukon", judicialDistrict: "Alaska Fourth Judicial District", isDeleted: true),
        ADIAlaskaCounty(code: "AK,Valdez-Chitina-Whittier", name: "Valdez-Chitina-Whittier", judicialDistrict: "Alaska Third Judicial District", isDeleted: true),
        ADIAlaskaCounty(code: "AK,Valdez-Cordova", name: "Valdez-Cordova", judicialDistrict: "Alaska Third Judicial District", isDeleted: false),
        ADIAlaskaCounty(code: "AK,Wade Hampton", name: "Wade Hampton", judicialDistrict: "Alaska Second Judicial District", isDeleted: true),
        ADIAlaskaCounty(code: "AK,Wales-Hyder", name: "Wales-Hyder", judicialDistrict: "Alaska First Judicial District", isDeleted: false),
        ADIAlaskaCounty(code: "AK,Wrangell", name: "Wrangell", judicialDistrict: "Alaska First Judicial District", isDeleted: false),
        ADIAlaskaCounty(code: "AK,Wrangell-Petersburg", name: "Wrangell-Petersburg", judicialDistrict: "Alaska First Judicial District", isDeleted: true),
        ADIAlaskaCounty(code: "AK,Yakutat", name: "Yakutat", judicialDistrict: "Alaska First Judicial District", isDeleted: false),
        ADIAlaskaCounty(code: "AK,Yukon-Koyukuk", name: "Yukon-Koyukuk", judicialDistrict: "Alaska Fourth Judicial District", isDeleted: false)
    ]

    private static let countiesByCode: [String: ADIAlaskaCounty] = {
        var index = [String: ADIAlaskaCounty](minimumCapacity: Self.allCounties.count)
        for county in Self.allCounties {
            index[county.code.uppercased()] = county
        }

        return index
    }()

    /// The county's code.
    public var description: String {
        code
    }

    /// Creates a county from its specification data.
    ///
    /// - Parameters:
    ///   - code: The county's code.
    ///   - name: The county's name.
    ///   - judicialDistrict: The judicial district it sits in.
    ///   - isDeleted: Whether the specification has retired the county.
    public init(
        code: String,
        name: String,
        judicialDistrict: String,
        isDeleted: Bool = false
    ) {
        self.code = code
        self.name = name
        self.judicialDistrict = judicialDistrict
        self.isDeleted = isDeleted
    }

    /// Creates a county by looking up its code.
    ///
    /// - Parameter code: The county code, in any case.
    /// - Returns: The matching county, or `nil` if the specification defines no
    ///   county with that code.
    public init?(code: some StringProtocol) {
        guard let county = Self.countiesByCode[code.uppercased()] else {
            return nil
        }

        self = county
    }
}
