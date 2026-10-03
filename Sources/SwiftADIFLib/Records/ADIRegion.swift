/// A region that a QSO can belong to for award purposes.
///
/// The specification defines a small, closed set of region entity codes. Each
/// region either applies within one DXCC entity or, in the case of `NONE`,
/// stands for a station that is in no applicable region at all.
///
/// - Note: See the specification's section III.B for the authoritative list.
public struct ADIRegion: Hashable, Sendable, CustomStringConvertible {
    /// The region entity code the specification assigns this region.
    public let code: String

    /// The DXCC entity this region applies within.
    ///
    /// - Note: `nil` for a region that applies in no single entity.
    public let dxccEntityCode: String?

    /// The region's name.
    public let name: String

    /// The station prefix associated with the region, where the specification
    ///   gives one.
    public let prefix: String?

    /// The award programs the region applies to, where the specification
    ///   limits it.
    public let applicability: String?

    /// Every region the specification defines, in specification order.
    public static let allRegions: [ADIRegion] = [
        ADIRegion(code: "NONE", dxccEntityCode: nil, name: "Not within a WAE or CQ region that is within a DXCC entity", prefix: nil, applicability: nil),
        ADIRegion(code: "IV", dxccEntityCode: "206", name: "ITU Vienna", prefix: "4U1V", applicability: "CQ, WAE"),
        ADIRegion(code: "AI", dxccEntityCode: "248", name: "African Italy", prefix: "IG9", applicability: "CQ"),
        ADIRegion(code: "SY", dxccEntityCode: "248", name: "Sicily", prefix: "IT9", applicability: "CQ, WAE"),
        ADIRegion(code: "BI", dxccEntityCode: "259", name: "Bear Island", prefix: "JW/B", applicability: "CQ, WAE"),
        ADIRegion(code: "SI", dxccEntityCode: "279", name: "Shetland Islands", prefix: "GM/S", applicability: "CQ, WAE"),
        ADIRegion(code: "KO", dxccEntityCode: "296", name: "Kosovo", prefix: "YU8", applicability: "CQ, WAE"),
        ADIRegion(code: "KO", dxccEntityCode: "0", name: "Kosovo", prefix: "Z6", applicability: "CQ, WAE"),
        ADIRegion(code: "KO", dxccEntityCode: "522", name: "Kosovo", prefix: "Z6", applicability: "CQ, WAE"),
        ADIRegion(code: "ET", dxccEntityCode: "390", name: "European Turkey", prefix: "TA1", applicability: "CQ"),
    ]

    private static let regionsByCode: [String: [String: ADIRegion]] = [
        "NONE": [
            "": ADIRegion(code: "NONE", dxccEntityCode: nil, name: "Not within a WAE or CQ region that is within a DXCC entity", prefix: nil, applicability: nil),
        ],
        "IV": [
            "206": ADIRegion(code: "IV", dxccEntityCode: "206", name: "ITU Vienna", prefix: "4U1V", applicability: "CQ, WAE"),
        ],
        "AI": [
            "248": ADIRegion(code: "AI", dxccEntityCode: "248", name: "African Italy", prefix: "IG9", applicability: "CQ"),
        ],
        "SY": [
            "248": ADIRegion(code: "SY", dxccEntityCode: "248", name: "Sicily", prefix: "IT9", applicability: "CQ, WAE"),
        ],
        "BI": [
            "259": ADIRegion(code: "BI", dxccEntityCode: "259", name: "Bear Island", prefix: "JW/B", applicability: "CQ, WAE"),
        ],
        "SI": [
            "279": ADIRegion(code: "SI", dxccEntityCode: "279", name: "Shetland Islands", prefix: "GM/S", applicability: "CQ, WAE"),
        ],
        "KO": [
            "296": ADIRegion(code: "KO", dxccEntityCode: "296", name: "Kosovo", prefix: "YU8", applicability: "CQ, WAE"),
            "0": ADIRegion(code: "KO", dxccEntityCode: "0", name: "Kosovo", prefix: "Z6", applicability: "CQ, WAE"),
            "522": ADIRegion(code: "KO", dxccEntityCode: "522", name: "Kosovo", prefix: "Z6", applicability: "CQ, WAE"),
        ],
        "ET": [
            "390": ADIRegion(code: "ET", dxccEntityCode: "390", name: "European Turkey", prefix: "TA1", applicability: "CQ"),
        ],
    ]

    private static let regionsByDXCCEntity: [String: [ADIRegion]] = [
        "0": [
            ADIRegion(code: "KO", dxccEntityCode: "0", name: "Kosovo", prefix: "Z6", applicability: "CQ, WAE"),
        ],
        "206": [
            ADIRegion(code: "IV", dxccEntityCode: "206", name: "ITU Vienna", prefix: "4U1V", applicability: "CQ, WAE"),
        ],
        "248": [
            ADIRegion(code: "AI", dxccEntityCode: "248", name: "African Italy", prefix: "IG9", applicability: "CQ"),
            ADIRegion(code: "SY", dxccEntityCode: "248", name: "Sicily", prefix: "IT9", applicability: "CQ, WAE"),
        ],
        "259": [
            ADIRegion(code: "BI", dxccEntityCode: "259", name: "Bear Island", prefix: "JW/B", applicability: "CQ, WAE"),
        ],
        "279": [
            ADIRegion(code: "SI", dxccEntityCode: "279", name: "Shetland Islands", prefix: "GM/S", applicability: "CQ, WAE"),
        ],
        "296": [
            ADIRegion(code: "KO", dxccEntityCode: "296", name: "Kosovo", prefix: "YU8", applicability: "CQ, WAE"),
        ],
        "390": [
            ADIRegion(code: "ET", dxccEntityCode: "390", name: "European Turkey", prefix: "TA1", applicability: "CQ"),
        ],
        "522": [
            ADIRegion(code: "KO", dxccEntityCode: "522", name: "Kosovo", prefix: "Z6", applicability: "CQ, WAE"),
        ],
    ]

    /// The region entity code.
    public var description: String {
        code
    }

    /// Creates a region from its specification data.
    ///
    /// - Parameters:
    ///   - code: The region entity code.
    ///   - dxccEntityCode: The DXCC entity the region applies within.
    ///   - name: The region's name.
    ///   - prefix: The associated station prefix, if any.
    ///   - applicability: The award programs the region applies to, if limited.
    public init(
        code: String,
        dxccEntityCode: String? = nil,
        name: String,
        prefix: String? = nil,
        applicability: String? = nil
    ) {
        self.code = code
        self.dxccEntityCode = dxccEntityCode
        self.name = name
        self.prefix = prefix
        self.applicability = applicability
    }

    /// Creates a region by looking up its region entity code and DXCC entity.
    ///
    /// - Parameters:
    ///   - code: The region entity code, in any case.
    ///   - dxccEntityCode: The DXCC entity code the region applies within.
    /// - Returns: The matching region, or `nil` if the specification defines no
    ///   region with that code in that DXCC entity.
    /// - Note: The specification reuses a region entity code across DXCC
    ///   entities, so the DXCC entity code is required to identify one region.
    public init?(code: some StringProtocol, dxccEntityCode: String?) {
        guard let byEntity = Self.regionsByCode[code.uppercased()] else {
            return nil
        }

        guard let region = byEntity[dxccEntityCode ?? ""] else {
            return nil
        }

        self = region
    }

    /// Returns every region the specification defines within a DXCC entity.
    ///
    /// - Parameter dxccEntityCode: The DXCC entity code.
    /// - Returns: The regions that apply within that entity, in specification
    ///   order.
    public static func regions(inDXCCEntity dxccEntityCode: String) -> [ADIRegion] {
        Self.regionsByDXCCEntity[dxccEntityCode] ?? []
    }
}
