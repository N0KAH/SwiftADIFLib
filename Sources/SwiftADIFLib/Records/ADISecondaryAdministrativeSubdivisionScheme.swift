/// A scheme for naming secondary administrative subdivisions within a DXCC
/// entity, such as U.S. counties or Russian districts.
///
/// The specification describes these schemes in its sections III.B.22 and III.B.23
/// rather than listing their values, because each scheme's subdivisions are
/// published by the awarding body the scheme names. A scheme therefore says which
/// authority maintains the list and how a code is formatted, not what every code
/// is.
///
/// - Note: Section III.B.22.a does list its values, and is available as
///   `ADIAlaskaCounty`.
public struct ADISecondaryAdministrativeSubdivisionScheme: Hashable, Sendable, CustomStringConvertible {
    /// The scheme's name, such as `U.S. Counties`.
    public let name: String

    /// The DXCC entity this scheme applies within.
    public let dxccEntityCode: String

    /// That DXCC entity's name.
    public let dxccEntityName: String

    /// How many subdivisions the scheme defines, where the specification counts
    ///   them.
    public let count: String?

    /// The award program the scheme serves.
    public let award: String?

    /// The name of the list of subdivisions.
    public let subdivisionList: String?

    /// The organisation that maintains the subdivision list.
    public let awardSponsor: String?

    /// How a subdivision code is formatted within this scheme.
    public let codeFormat: String?

    /// Every subdivision scheme the specification describes.
    public static let allSchemes: [ADISecondaryAdministrativeSubdivisionScheme] = [
        ADISecondaryAdministrativeSubdivisionScheme(name: "U.S. Counties", dxccEntityCode: "6", dxccEntityName: "Alaska", count: nil, award: "USA-CA", subdivisionList: "Alaskan Counties", awardSponsor: "CQ Magazine", codeFormat: "<Two-letter state abbr.> COMMA <county name>"),
        ADISecondaryAdministrativeSubdivisionScheme(name: "U.S. Counties", dxccEntityCode: "110", dxccEntityName: "Hawaii", count: "5", award: "USA-CA", subdivisionList: "CountyHunter FIPS 6-4", awardSponsor: "CQ Magazine", codeFormat: "<Two-letter state abbr.> COMMA <county name>"),
        ADISecondaryAdministrativeSubdivisionScheme(name: "U.S. Counties", dxccEntityCode: "291", dxccEntityName: "United States", count: "3068", award: "USA-CA", subdivisionList: "CountyHunter FIPS 6-4", awardSponsor: "CQ Magazine", codeFormat: "<Two-letter state abbr.> COMMA <county name>"),
        ADISecondaryAdministrativeSubdivisionScheme(name: "Russian Districts", dxccEntityCode: "15", dxccEntityName: "Asiatic Russia", count: "2644 (+ 180 deleted)", award: "RDA", subdivisionList: "RDA List", awardSponsor: "Tambov award group (\"TAG\")", codeFormat: "<Two-letter Oblast abbr.> DASH <Two-digit district code>"),
        ADISecondaryAdministrativeSubdivisionScheme(name: "Russian Districts", dxccEntityCode: "54", dxccEntityName: "European Russia", count: "2644 (+ 180 deleted)", award: "RDA", subdivisionList: "RDA List", awardSponsor: "Tambov award group (\"TAG\")", codeFormat: "<Two-letter Oblast abbr.> DASH <Two-digit district code>"),
        ADISecondaryAdministrativeSubdivisionScheme(name: "Russian Districts", dxccEntityCode: "61", dxccEntityName: "Franz Josef Land", count: "2644 (+ 180 deleted)", award: "RDA", subdivisionList: "RDA List", awardSponsor: "Tambov award group (\"TAG\")", codeFormat: "<Two-letter Oblast abbr.> DASH <Two-digit district code>"),
        ADISecondaryAdministrativeSubdivisionScheme(name: "Russian Districts", dxccEntityCode: "126", dxccEntityName: "Kaliningrad", count: "2644 (+ 180 deleted)", award: "RDA", subdivisionList: "RDA List", awardSponsor: "Tambov award group (\"TAG\")", codeFormat: "<Two-letter Oblast abbr.> DASH <Two-digit district code>"),
        ADISecondaryAdministrativeSubdivisionScheme(name: "Russian Districts", dxccEntityCode: "151", dxccEntityName: "Malyj Vysotski Is", count: "2644 (+ 180 deleted)", award: "RDA", subdivisionList: "RDA List", awardSponsor: "Tambov award group (\"TAG\")", codeFormat: "<Two-letter Oblast abbr.> DASH <Two-digit district code>"),
        ADISecondaryAdministrativeSubdivisionScheme(name: "Ukrainian Districts", dxccEntityCode: "288", dxccEntityName: "Ukraine", count: "761", award: "URDA", subdivisionList: "URDA List", awardSponsor: "UARL", codeFormat: "<Two-letter Oblast abbr.> DASH <Two-digit district code>"),
        ADISecondaryAdministrativeSubdivisionScheme(name: "Japanese Cities", dxccEntityCode: "339", dxccEntityName: "Japan", count: "815(+ 99 deleted)", award: "JCC", subdivisionList: "JCC List", awardSponsor: "JARL", codeFormat: "<Two-digit prefecture code> <Two-digit or four-digit city code>"),
        ADISecondaryAdministrativeSubdivisionScheme(name: "Japanese Ku", dxccEntityCode: "339", dxccEntityName: "Japan", count: "175 (+ 7 deleted)", award: "WAKU", subdivisionList: "Ku List", awardSponsor: "JARL", codeFormat: "<Two-digit prefecture code> <Two-digit city code> <Two-digit Ku code>"),
        ADISecondaryAdministrativeSubdivisionScheme(name: "Japanese Guns", dxccEntityCode: "339", dxccEntityName: "Japan", count: "379 (+ 244 deleted)", award: "JCG", subdivisionList: "JCG List", awardSponsor: "JARL", codeFormat: "<Two-digit prefecture code> <Three-digit gun code>"),
        ADISecondaryAdministrativeSubdivisionScheme(name: "Japanese Cities / Ku / Guns", dxccEntityCode: "339", dxccEntityName: "Japan", count: "See Japanese Cities, Japanese Ku, & Japanese Guns", award: "AJA", subdivisionList: "JCC List Ku List JCG List", awardSponsor: "JARL", codeFormat: "See Japanese Cities, Japanese Ku, & Japanese Guns"),
        ADISecondaryAdministrativeSubdivisionScheme(name: "NZ Counties", dxccEntityCode: "170", dxccEntityName: "New Zealand", count: "112", award: "NZ Counties", subdivisionList: "NZART Lists North Island South Island", awardSponsor: "NZART", codeFormat: "<Three-digit county code>"),
        ADISecondaryAdministrativeSubdivisionScheme(name: "Spanish DMEs", dxccEntityCode: "21", dxccEntityName: "Balearic Is.", count: "67", award: "DME", subdivisionList: "DME List", awardSponsor: "URE", codeFormat: "<Two-digit province code> <Three-digit city code>"),
        ADISecondaryAdministrativeSubdivisionScheme(name: "Spanish DMEs", dxccEntityCode: "29", dxccEntityName: "Canary Is.", count: "88", award: "DME", subdivisionList: "DME List", awardSponsor: "URE", codeFormat: "<Two-digit province code> <Three-digit city code>"),
        ADISecondaryAdministrativeSubdivisionScheme(name: "Spanish DMEs", dxccEntityCode: "32", dxccEntityName: "Ceuta & Melilla", count: "2", award: "DME", subdivisionList: "DME List", awardSponsor: "URE", codeFormat: "<Two-digit province code> <Three-digit city code>"),
        ADISecondaryAdministrativeSubdivisionScheme(name: "Spanish DMEs", dxccEntityCode: "281", dxccEntityName: "Spain", count: "7967", award: "DME", subdivisionList: "DME List", awardSponsor: "URE", codeFormat: "<Two-digit province code> <Three-digit city code>"),
        ADISecondaryAdministrativeSubdivisionScheme(name: "NZ_Regions", dxccEntityCode: "170", dxccEntityName: "New Zealand", count: nil, award: "NZ Regions", subdivisionList: "NZ_Regions", awardSponsor: "NZART", codeFormat: "NZ_Regions:Hawkes Bay/Wairoa → Hawkes Bay region, Wairoa district")
    ]

    private static let schemesByDXCCEntity: [String: [ADISecondaryAdministrativeSubdivisionScheme]] = {
        var index = [String: [ADISecondaryAdministrativeSubdivisionScheme]](minimumCapacity: Self.allSchemes.count)
        for scheme in Self.allSchemes {
            index[scheme.dxccEntityCode, default: []].append(scheme)
        }

        return index
    }()

    /// The scheme's name.
    public var description: String {
        name
    }

    /// Creates a subdivision scheme from its specification data.
    ///
    /// - Parameters:
    ///   - name: The scheme's name.
    ///   - dxccEntityCode: The DXCC entity the scheme applies within.
    ///   - dxccEntityName: That entity's name.
    ///   - count: How many subdivisions the scheme defines, if stated.
    ///   - award: The award program the scheme serves.
    ///   - subdivisionList: The name of the list of subdivisions.
    ///   - awardSponsor: The organisation maintaining the list.
    ///   - codeFormat: How a subdivision code is formatted.
    public init(
        name: String,
        dxccEntityCode: String,
        dxccEntityName: String,
        count: String? = nil,
        award: String? = nil,
        subdivisionList: String? = nil,
        awardSponsor: String? = nil,
        codeFormat: String? = nil
    ) {
        self.name = name
        self.dxccEntityCode = dxccEntityCode
        self.dxccEntityName = dxccEntityName
        self.count = count
        self.award = award
        self.subdivisionList = subdivisionList
        self.awardSponsor = awardSponsor
        self.codeFormat = codeFormat
    }

    /// Returns every subdivision scheme that applies within a DXCC entity.
    ///
    /// - Parameter dxccEntityCode: The DXCC entity code.
    /// - Returns: That entity's schemes, in specification order.
    public static func schemes(inDXCCEntity dxccEntityCode: some StringProtocol) -> [ADISecondaryAdministrativeSubdivisionScheme] {
        Self.schemesByDXCCEntity[String(dxccEntityCode)] ?? []
    }
}
