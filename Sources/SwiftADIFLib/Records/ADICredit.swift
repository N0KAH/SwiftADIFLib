/// The ADIF `Credit` enumeration.
///
/// A credit records participation in an award program run by a sponsoring
/// organization. The specification names each credit's sponsor, the award it
/// counts toward, and the facet -- such as band or mode -- it applies to.
///
/// - Note: See the specification's section III.B for the authoritative list.
public enum ADICredit: ADIEnumeration {
    /// Credit for the Mixed facet of the DX award, run by CQ Magazine.
    ///
    /// - Note: The specification's value is `CQDX`.
    case cqdx
    /// Credit for the Band facet of the DX award, run by CQ Magazine.
    ///
    /// - Note: The specification's value is `CQDX_BAND`.
    case cqdxBand
    /// Credit for the Mode facet of the DX award, run by CQ Magazine.
    ///
    /// - Note: The specification's value is `CQDX_MODE`.
    case cqdxMode
    /// Credit for the Mobile facet of the DX award, run by CQ Magazine.
    ///
    /// - Note: The specification's value is `CQDX_MOBILE`.
    case cqdxMobile
    /// Credit for the QRP facet of the DX award, run by CQ Magazine.
    ///
    /// - Note: The specification's value is `CQDX_QRP`.
    case cqdxQrp
    /// Credit for the Satellite facet of the DX award, run by CQ Magazine.
    ///
    /// - Note: The specification's value is `CQDX_SATELLITE`.
    case cqdxSatellite
    /// Credit for the Mixed facet of the DX Field award, run by CQ Magazine.
    ///
    /// - Note: The specification's value is `CQDXFIELD`.
    case cqdxfield
    /// Credit for the Band facet of the DX Field award, run by CQ Magazine.
    ///
    /// - Note: The specification's value is `CQDXFIELD_BAND`.
    case cqdxfieldBand
    /// Credit for the Mode facet of the DX Field award, run by CQ Magazine.
    ///
    /// - Note: The specification's value is `CQDXFIELD_MODE`.
    case cqdxfieldMode
    /// Credit for the Mobile facet of the DX Field award, run by CQ Magazine.
    ///
    /// - Note: The specification's value is `CQDXFIELD_MOBILE`.
    case cqdxfieldMobile
    /// Credit for the QRP facet of the DX Field award, run by CQ Magazine.
    ///
    /// - Note: The specification's value is `CQDXFIELD_QRP`.
    case cqdxfieldQrp
    /// Credit for the Satellite facet of the DX Field award, run by CQ Magazine.
    ///
    /// - Note: The specification's value is `CQDXFIELD_SATELLITE`.
    case cqdxfieldSatellite
    /// Credit for the Mixed facet of the Worked All Zones (WAZ) award, run by CQ Magazine.
    ///
    /// - Note: The specification's value is `CQWAZ_MIXED`.
    case cqwazMixed
    /// Credit for the Band facet of the Worked All Zones (WAZ) award, run by CQ Magazine.
    ///
    /// - Note: The specification's value is `CQWAZ_BAND`.
    case cqwazBand
    /// Credit for the Mode facet of the Worked All Zones (WAZ) award, run by CQ Magazine.
    ///
    /// - Note: The specification's value is `CQWAZ_MODE`.
    case cqwazMode
    /// Credit for the Satellite facet of the Worked All Zones (WAZ) award, run by CQ Magazine.
    ///
    /// - Note: The specification's value is `CQWAZ_SATELLITE`.
    case cqwazSatellite
    /// Credit for the EME facet of the Worked All Zones (WAZ) award, run by CQ Magazine.
    ///
    /// - Note: The specification's value is `CQWAZ_EME`.
    case cqwazEme
    /// Credit for the Mobile facet of the Worked All Zones (WAZ) award, run by CQ Magazine.
    ///
    /// - Note: The specification's value is `CQWAZ_MOBILE`.
    case cqwazMobile
    /// Credit for the QRP facet of the Worked All Zones (WAZ) award, run by CQ Magazine.
    ///
    /// - Note: The specification's value is `CQWAZ_QRP`.
    case cqwazQrp
    /// Credit for the Mixed facet of the WPX award, run by CQ Magazine.
    ///
    /// - Note: The specification's value is `CQWPX`.
    case cqwpx
    /// Credit for the Band facet of the WPX award, run by CQ Magazine.
    ///
    /// - Note: The specification's value is `CQWPX_BAND`.
    case cqwpxBand
    /// Credit for the Mode facet of the WPX award, run by CQ Magazine.
    ///
    /// - Note: The specification's value is `CQWPX_MODE`.
    case cqwpxMode
    /// Credit for the Mixed facet of the DX Century Club (DXCC) award, run by ARRL.
    ///
    /// - Note: The specification's value is `DXCC`.
    case dxcc
    /// Credit for the Band facet of the DX Century Club (DXCC) award, run by ARRL.
    ///
    /// - Note: The specification's value is `DXCC_BAND`.
    case dxccBand
    /// Credit for the Mode facet of the DX Century Club (DXCC) award, run by ARRL.
    ///
    /// - Note: The specification's value is `DXCC_MODE`.
    case dxccMode
    /// Credit for the Satellite facet of the DX Century Club (DXCC) award, run by ARRL.
    ///
    /// - Note: The specification's value is `DXCC_SATELLITE`.
    case dxccSatellite
    /// Credit for the Mixed facet of the eAustralia award, run by eQSL.
    ///
    /// - Note: The specification's value is `EAUSTRALIA`.
    case eaustralia
    /// Credit for the Mixed facet of the eCanada award, run by eQSL.
    ///
    /// - Note: The specification's value is `ECANADA`.
    case ecanada
    /// Credit for the State facet of the eCounty award, run by eQSL.
    ///
    /// - Note: The specification's value is `ECOUNTY_STATE`.
    case ecountyState
    /// Credit for the Mixed facet of the eDX award, run by eQSL.
    ///
    /// - Note: The specification's value is `EDX`.
    case edx
    /// Credit for the Mixed facet of the eDX100 award, run by eQSL.
    ///
    /// - Note: The specification's value is `EDX100`.
    case edx100
    /// Credit for the Band facet of the eDX100 award, run by eQSL.
    ///
    /// - Note: The specification's value is `EDX100_BAND`.
    case edx100Band
    /// Credit for the Mode facet of the eDX100 award, run by eQSL.
    ///
    /// - Note: The specification's value is `EDX100_MODE`.
    case edx100Mode
    /// Credit for the Echolink facet of the eEcholink50 award, run by eQSL.
    ///
    /// - Note: The specification's value is `EECHOLINK50`.
    case eecholink50
    /// Credit for the Band facet of the eGrid award, run by eQSL.
    ///
    /// - Note: The specification's value is `EGRID_BAND`.
    case egridBand
    /// Credit for the Satellite facet of the eGrid award, run by eQSL.
    ///
    /// - Note: The specification's value is `EGRID_SATELLITE`.
    case egridSatellite
    /// Credit for the Mixed facet of the ePfx300 award, run by eQSL.
    ///
    /// - Note: The specification's value is `EPFX300`.
    case epfx300
    /// Credit for the Mode facet of the ePfx300 award, run by eQSL.
    ///
    /// - Note: The specification's value is `EPFX300_MODE`.
    case epfx300Mode
    /// Credit for the Mixed facet of the eWAS award, run by eQSL.
    ///
    /// - Note: The specification's value is `EWAS`.
    case ewas
    /// Credit for the Band facet of the eWAS award, run by eQSL.
    ///
    /// - Note: The specification's value is `EWAS_BAND`.
    case ewasBand
    /// Credit for the Mode facet of the eWAS award, run by eQSL.
    ///
    /// - Note: The specification's value is `EWAS_MODE`.
    case ewasMode
    /// Credit for the Satellite facet of the eWAS award, run by eQSL.
    ///
    /// - Note: The specification's value is `EWAS_SATELLITE`.
    case ewasSatellite
    /// Credit for the Mixed facet of the eZ40 award, run by eQSL.
    ///
    /// - Note: The specification's value is `EZ40`.
    case ez40
    /// Credit for the Mode facet of the eZ40 award, run by eQSL.
    ///
    /// - Note: The specification's value is `EZ40_MODE`.
    case ez40Mode
    /// Credit for the Mixed facet of the Fred Fish Memorial Award (FFMA) award, run by ARRL.
    ///
    /// - Note: The specification's value is `FFMA`.
    case ffma
    /// Credit for the Mixed facet of the Islands on the Air (IOTA) award, run by RSGB.
    ///
    /// - Note: The specification's value is `IOTA`.
    case iota
    /// Credit for the Mixed facet of the Islands on the Air (IOTA) award, run by RSGB.
    ///
    /// - Note: The specification's value is `IOTA_BASIC`.
    case iotaBasic
    /// Credit for the Continent facet of the Islands on the Air (IOTA) award, run by RSGB.
    ///
    /// - Note: The specification's value is `IOTA_CONT`.
    case iotaCont
    /// Credit for the Group facet of the Islands on the Air (IOTA) award, run by RSGB.
    ///
    /// - Note: The specification's value is `IOTA_GROUP`.
    case iotaGroup
    /// Credit for the Mixed facet of the Russian Districts Award (RDA) award, run by TAG.
    ///
    /// - Note: The specification's value is `RDA`.
    case rda
    /// Credit for the Mixed facet of the United States of America Counties (USA-CA) award, run by CQ Magazine.
    ///
    /// - Note: The specification's value is `USACA`.
    case usaca
    /// Credit for the Band facet of the VHF/UHF Century Club Program (VUCC) award, run by ARRL.
    ///
    /// - Note: The specification's value is `VUCC_BAND`.
    case vuccBand
    /// Credit for the Satellite facet of the VHF/UHF Century Club Program (VUCC) award, run by ARRL.
    ///
    /// - Note: The specification's value is `VUCC_SATELLITE`.
    case vuccSatellite
    /// Credit for the Mixed facet of the Worked All Britain (WAB) award, run by WAB AG.
    ///
    /// - Note: The specification's value is `WAB`.
    case wab
    /// Credit for the Mixed facet of the Worked All Continents (WAC) award, run by IARU.
    ///
    /// - Note: The specification's value is `WAC`.
    case wac
    /// Credit for the Band facet of the Worked All Continents (WAC) award, run by IARU.
    ///
    /// - Note: The specification's value is `WAC_BAND`.
    case wacBand
    /// Credit for the Mixed facet of the Worked All Europe (WAE) award, run by DARC.
    ///
    /// - Note: The specification's value is `WAE`.
    case wae
    /// Credit for the Band facet of the Worked All Europe (WAE) award, run by DARC.
    ///
    /// - Note: The specification's value is `WAE_BAND`.
    case waeBand
    /// Credit for the Mode facet of the Worked All Europe (WAE) award, run by DARC.
    ///
    /// - Note: The specification's value is `WAE_MODE`.
    case waeMode
    /// Credit for the Mixed facet of the Worked All Italian Provinces (WAIP) award, run by ARI.
    ///
    /// - Note: The specification's value is `WAIP`.
    case waip
    /// Credit for the Band facet of the Worked All Italian Provinces (WAIP) award, run by ARI.
    ///
    /// - Note: The specification's value is `WAIP_BAND`.
    case waipBand
    /// Credit for the Mode facet of the Worked All Italian Provinces (WAIP) award, run by ARI.
    ///
    /// - Note: The specification's value is `WAIP_MODE`.
    case waipMode
    /// Credit for the Mixed facet of the Worked All States (WAS) award, run by ARRL.
    ///
    /// - Note: The specification's value is `WAS`.
    case was
    /// Credit for the Band facet of the Worked All States (WAS) award, run by ARRL.
    ///
    /// - Note: The specification's value is `WAS_BAND`.
    case wasBand
    /// Credit for the EME facet of the Worked All States (WAS) award, run by ARRL.
    ///
    /// - Note: The specification's value is `WAS_EME`.
    case wasEme
    /// Credit for the Mode facet of the Worked All States (WAS) award, run by ARRL.
    ///
    /// - Note: The specification's value is `WAS_MODE`.
    case wasMode
    /// Credit for the Novice facet of the Worked All States (WAS) award, run by ARRL.
    ///
    /// - Note: The specification's value is `WAS_NOVICE`.
    case wasNovice
    /// Credit for the QRP facet of the Worked All States (WAS) award, run by ARRL.
    ///
    /// - Note: The specification's value is `WAS_QRP`.
    case wasQrp
    /// Credit for the Satellite facet of the Worked All States (WAS) award, run by ARRL.
    ///
    /// - Note: The specification's value is `WAS_SATELLITE`.
    case wasSatellite
    /// Credit for the Mixed facet of the Worked ITU Zones (WITUZ) award, run by RSGB.
    ///
    /// - Note: The specification's value is `WITUZ`.
    case wituz
    /// Credit for the Band facet of the Worked ITU Zones (WITUZ) award, run by RSGB.
    ///
    /// - Note: The specification's value is `WITUZ_BAND`.
    case wituzBand

    /// A value that this library does not recognize.
    ///
    /// - Important: This case exists so that unrecognized credits survive a
    ///   parse-and-serialize round trip rather than being discarded.
    case unrecognized(String)

    /// Every credit the specification defines, in specification order,
    /// excluding ``ADICredit.unrecognized(_:)``.
    public static let allMembers: [ADICredit] = [
        .cqdx,
        .cqdxBand,
        .cqdxMode,
        .cqdxMobile,
        .cqdxQrp,
        .cqdxSatellite,
        .cqdxfield,
        .cqdxfieldBand,
        .cqdxfieldMode,
        .cqdxfieldMobile,
        .cqdxfieldQrp,
        .cqdxfieldSatellite,
        .cqwazMixed,
        .cqwazBand,
        .cqwazMode,
        .cqwazSatellite,
        .cqwazEme,
        .cqwazMobile,
        .cqwazQrp,
        .cqwpx,
        .cqwpxBand,
        .cqwpxMode,
        .dxcc,
        .dxccBand,
        .dxccMode,
        .dxccSatellite,
        .eaustralia,
        .ecanada,
        .ecountyState,
        .edx,
        .edx100,
        .edx100Band,
        .edx100Mode,
        .eecholink50,
        .egridBand,
        .egridSatellite,
        .epfx300,
        .epfx300Mode,
        .ewas,
        .ewasBand,
        .ewasMode,
        .ewasSatellite,
        .ez40,
        .ez40Mode,
        .ffma,
        .iota,
        .iotaBasic,
        .iotaCont,
        .iotaGroup,
        .rda,
        .usaca,
        .vuccBand,
        .vuccSatellite,
        .wab,
        .wac,
        .wacBand,
        .wae,
        .waeBand,
        .waeMode,
        .waip,
        .waipBand,
        .waipMode,
        .was,
        .wasBand,
        .wasEme,
        .wasMode,
        .wasNovice,
        .wasQrp,
        .wasSatellite,
        .wituz,
        .wituzBand,
    ]

    /// The values the specification marks as import-only.
    ///
    /// - Note: The specification marks no credit as import-only. The `CREDIT_*`
    ///   fields that carry credits are themselves import-only.
    public static let importOnlyMembers: Set<String> = []

    /// The organization that runs the award program this credit counts toward.
    public var sponsor: String {
        Self.metadataByValue[description]?.sponsor ?? ""
    }

    /// The award program this credit counts toward.
    public var award: String {
        Self.metadataByValue[description]?.award ?? ""
    }

    /// The aspect of a QSO this credit is limited to, such as band or mode.
    ///
    /// - Note: `Mixed` means the credit is not limited to a single facet.
    public var facet: String {
        Self.metadataByValue[description]?.facet ?? ""
    }

    /// The credit, in the canonical form the specification uses.
    public var description: String {
        switch self {
        case .cqdx:
            "CQDX"
        case .cqdxBand:
            "CQDX_BAND"
        case .cqdxMode:
            "CQDX_MODE"
        case .cqdxMobile:
            "CQDX_MOBILE"
        case .cqdxQrp:
            "CQDX_QRP"
        case .cqdxSatellite:
            "CQDX_SATELLITE"
        case .cqdxfield:
            "CQDXFIELD"
        case .cqdxfieldBand:
            "CQDXFIELD_BAND"
        case .cqdxfieldMode:
            "CQDXFIELD_MODE"
        case .cqdxfieldMobile:
            "CQDXFIELD_MOBILE"
        case .cqdxfieldQrp:
            "CQDXFIELD_QRP"
        case .cqdxfieldSatellite:
            "CQDXFIELD_SATELLITE"
        case .cqwazMixed:
            "CQWAZ_MIXED"
        case .cqwazBand:
            "CQWAZ_BAND"
        case .cqwazMode:
            "CQWAZ_MODE"
        case .cqwazSatellite:
            "CQWAZ_SATELLITE"
        case .cqwazEme:
            "CQWAZ_EME"
        case .cqwazMobile:
            "CQWAZ_MOBILE"
        case .cqwazQrp:
            "CQWAZ_QRP"
        case .cqwpx:
            "CQWPX"
        case .cqwpxBand:
            "CQWPX_BAND"
        case .cqwpxMode:
            "CQWPX_MODE"
        case .dxcc:
            "DXCC"
        case .dxccBand:
            "DXCC_BAND"
        case .dxccMode:
            "DXCC_MODE"
        case .dxccSatellite:
            "DXCC_SATELLITE"
        case .eaustralia:
            "EAUSTRALIA"
        case .ecanada:
            "ECANADA"
        case .ecountyState:
            "ECOUNTY_STATE"
        case .edx:
            "EDX"
        case .edx100:
            "EDX100"
        case .edx100Band:
            "EDX100_BAND"
        case .edx100Mode:
            "EDX100_MODE"
        case .eecholink50:
            "EECHOLINK50"
        case .egridBand:
            "EGRID_BAND"
        case .egridSatellite:
            "EGRID_SATELLITE"
        case .epfx300:
            "EPFX300"
        case .epfx300Mode:
            "EPFX300_MODE"
        case .ewas:
            "EWAS"
        case .ewasBand:
            "EWAS_BAND"
        case .ewasMode:
            "EWAS_MODE"
        case .ewasSatellite:
            "EWAS_SATELLITE"
        case .ez40:
            "EZ40"
        case .ez40Mode:
            "EZ40_MODE"
        case .ffma:
            "FFMA"
        case .iota:
            "IOTA"
        case .iotaBasic:
            "IOTA_BASIC"
        case .iotaCont:
            "IOTA_CONT"
        case .iotaGroup:
            "IOTA_GROUP"
        case .rda:
            "RDA"
        case .usaca:
            "USACA"
        case .vuccBand:
            "VUCC_BAND"
        case .vuccSatellite:
            "VUCC_SATELLITE"
        case .wab:
            "WAB"
        case .wac:
            "WAC"
        case .wacBand:
            "WAC_BAND"
        case .wae:
            "WAE"
        case .waeBand:
            "WAE_BAND"
        case .waeMode:
            "WAE_MODE"
        case .waip:
            "WAIP"
        case .waipBand:
            "WAIP_BAND"
        case .waipMode:
            "WAIP_MODE"
        case .was:
            "WAS"
        case .wasBand:
            "WAS_BAND"
        case .wasEme:
            "WAS_EME"
        case .wasMode:
            "WAS_MODE"
        case .wasNovice:
            "WAS_NOVICE"
        case .wasQrp:
            "WAS_QRP"
        case .wasSatellite:
            "WAS_SATELLITE"
        case .wituz:
            "WITUZ"
        case .wituzBand:
            "WITUZ_BAND"
        case let .unrecognized(raw):
            raw
        }
    }

    private static let metadataByValue: [String: (sponsor: String, award: String, facet: String)] = [
        "CQDX": ("CQ Magazine", "DX", "Mixed"),
        "CQDX_BAND": ("CQ Magazine", "DX", "Band"),
        "CQDX_MODE": ("CQ Magazine", "DX", "Mode"),
        "CQDX_MOBILE": ("CQ Magazine", "DX", "Mobile"),
        "CQDX_QRP": ("CQ Magazine", "DX", "QRP"),
        "CQDX_SATELLITE": ("CQ Magazine", "DX", "Satellite"),
        "CQDXFIELD": ("CQ Magazine", "DX Field", "Mixed"),
        "CQDXFIELD_BAND": ("CQ Magazine", "DX Field", "Band"),
        "CQDXFIELD_MODE": ("CQ Magazine", "DX Field", "Mode"),
        "CQDXFIELD_MOBILE": ("CQ Magazine", "DX Field", "Mobile"),
        "CQDXFIELD_QRP": ("CQ Magazine", "DX Field", "QRP"),
        "CQDXFIELD_SATELLITE": ("CQ Magazine", "DX Field", "Satellite"),
        "CQWAZ_MIXED": ("CQ Magazine", "Worked All Zones (WAZ)", "Mixed"),
        "CQWAZ_BAND": ("CQ Magazine", "Worked All Zones (WAZ)", "Band"),
        "CQWAZ_MODE": ("CQ Magazine", "Worked All Zones (WAZ)", "Mode"),
        "CQWAZ_SATELLITE": ("CQ Magazine", "Worked All Zones (WAZ)", "Satellite"),
        "CQWAZ_EME": ("CQ Magazine", "Worked All Zones (WAZ)", "EME"),
        "CQWAZ_MOBILE": ("CQ Magazine", "Worked All Zones (WAZ)", "Mobile"),
        "CQWAZ_QRP": ("CQ Magazine", "Worked All Zones (WAZ)", "QRP"),
        "CQWPX": ("CQ Magazine", "WPX", "Mixed"),
        "CQWPX_BAND": ("CQ Magazine", "WPX", "Band"),
        "CQWPX_MODE": ("CQ Magazine", "WPX", "Mode"),
        "DXCC": ("ARRL", "DX Century Club (DXCC)", "Mixed"),
        "DXCC_BAND": ("ARRL", "DX Century Club (DXCC)", "Band"),
        "DXCC_MODE": ("ARRL", "DX Century Club (DXCC)", "Mode"),
        "DXCC_SATELLITE": ("ARRL", "DX Century Club (DXCC)", "Satellite"),
        "EAUSTRALIA": ("eQSL", "eAustralia", "Mixed"),
        "ECANADA": ("eQSL", "eCanada", "Mixed"),
        "ECOUNTY_STATE": ("eQSL", "eCounty", "State"),
        "EDX": ("eQSL", "eDX", "Mixed"),
        "EDX100": ("eQSL", "eDX100", "Mixed"),
        "EDX100_BAND": ("eQSL", "eDX100", "Band"),
        "EDX100_MODE": ("eQSL", "eDX100", "Mode"),
        "EECHOLINK50": ("eQSL", "eEcholink50", "Echolink"),
        "EGRID_BAND": ("eQSL", "eGrid", "Band"),
        "EGRID_SATELLITE": ("eQSL", "eGrid", "Satellite"),
        "EPFX300": ("eQSL", "ePfx300", "Mixed"),
        "EPFX300_MODE": ("eQSL", "ePfx300", "Mode"),
        "EWAS": ("eQSL", "eWAS", "Mixed"),
        "EWAS_BAND": ("eQSL", "eWAS", "Band"),
        "EWAS_MODE": ("eQSL", "eWAS", "Mode"),
        "EWAS_SATELLITE": ("eQSL", "eWAS", "Satellite"),
        "EZ40": ("eQSL", "eZ40", "Mixed"),
        "EZ40_MODE": ("eQSL", "eZ40", "Mode"),
        "FFMA": ("ARRL", "Fred Fish Memorial Award (FFMA)", "Mixed"),
        "IOTA": ("RSGB", "Islands on the Air (IOTA)", "Mixed"),
        "IOTA_BASIC": ("RSGB", "Islands on the Air (IOTA)", "Mixed"),
        "IOTA_CONT": ("RSGB", "Islands on the Air (IOTA)", "Continent"),
        "IOTA_GROUP": ("RSGB", "Islands on the Air (IOTA)", "Group"),
        "RDA": ("TAG", "Russian Districts Award (RDA)", "Mixed"),
        "USACA": ("CQ Magazine", "United States of America Counties (USA-CA)", "Mixed"),
        "VUCC_BAND": ("ARRL", "VHF/UHF Century Club Program (VUCC)", "Band"),
        "VUCC_SATELLITE": ("ARRL", "VHF/UHF Century Club Program (VUCC)", "Satellite"),
        "WAB": ("WAB AG", "Worked All Britain (WAB)", "Mixed"),
        "WAC": ("IARU", "Worked All Continents (WAC)", "Mixed"),
        "WAC_BAND": ("IARU", "Worked All Continents (WAC)", "Band"),
        "WAE": ("DARC", "Worked All Europe (WAE)", "Mixed"),
        "WAE_BAND": ("DARC", "Worked All Europe (WAE)", "Band"),
        "WAE_MODE": ("DARC", "Worked All Europe (WAE)", "Mode"),
        "WAIP": ("ARI", "Worked All Italian Provinces (WAIP)", "Mixed"),
        "WAIP_BAND": ("ARI", "Worked All Italian Provinces (WAIP)", "Band"),
        "WAIP_MODE": ("ARI", "Worked All Italian Provinces (WAIP)", "Mode"),
        "WAS": ("ARRL", "Worked All States (WAS)", "Mixed"),
        "WAS_BAND": ("ARRL", "Worked All States (WAS)", "Band"),
        "WAS_EME": ("ARRL", "Worked All States (WAS)", "EME"),
        "WAS_MODE": ("ARRL", "Worked All States (WAS)", "Mode"),
        "WAS_NOVICE": ("ARRL", "Worked All States (WAS)", "Novice"),
        "WAS_QRP": ("ARRL", "Worked All States (WAS)", "QRP"),
        "WAS_SATELLITE": ("ARRL", "Worked All States (WAS)", "Satellite"),
        "WITUZ": ("RSGB", "Worked ITU Zones (WITUZ)", "Mixed"),
        "WITUZ_BAND": ("RSGB", "Worked ITU Zones (WITUZ)", "Band"),
    ]

    private static let membersByLowercasedValue: [String: ADICredit] = [
        "cqdx": .cqdx,
        "cqdx_band": .cqdxBand,
        "cqdx_mode": .cqdxMode,
        "cqdx_mobile": .cqdxMobile,
        "cqdx_qrp": .cqdxQrp,
        "cqdx_satellite": .cqdxSatellite,
        "cqdxfield": .cqdxfield,
        "cqdxfield_band": .cqdxfieldBand,
        "cqdxfield_mode": .cqdxfieldMode,
        "cqdxfield_mobile": .cqdxfieldMobile,
        "cqdxfield_qrp": .cqdxfieldQrp,
        "cqdxfield_satellite": .cqdxfieldSatellite,
        "cqwaz_mixed": .cqwazMixed,
        "cqwaz_band": .cqwazBand,
        "cqwaz_mode": .cqwazMode,
        "cqwaz_satellite": .cqwazSatellite,
        "cqwaz_eme": .cqwazEme,
        "cqwaz_mobile": .cqwazMobile,
        "cqwaz_qrp": .cqwazQrp,
        "cqwpx": .cqwpx,
        "cqwpx_band": .cqwpxBand,
        "cqwpx_mode": .cqwpxMode,
        "dxcc": .dxcc,
        "dxcc_band": .dxccBand,
        "dxcc_mode": .dxccMode,
        "dxcc_satellite": .dxccSatellite,
        "eaustralia": .eaustralia,
        "ecanada": .ecanada,
        "ecounty_state": .ecountyState,
        "edx": .edx,
        "edx100": .edx100,
        "edx100_band": .edx100Band,
        "edx100_mode": .edx100Mode,
        "eecholink50": .eecholink50,
        "egrid_band": .egridBand,
        "egrid_satellite": .egridSatellite,
        "epfx300": .epfx300,
        "epfx300_mode": .epfx300Mode,
        "ewas": .ewas,
        "ewas_band": .ewasBand,
        "ewas_mode": .ewasMode,
        "ewas_satellite": .ewasSatellite,
        "ez40": .ez40,
        "ez40_mode": .ez40Mode,
        "ffma": .ffma,
        "iota": .iota,
        "iota_basic": .iotaBasic,
        "iota_cont": .iotaCont,
        "iota_group": .iotaGroup,
        "rda": .rda,
        "usaca": .usaca,
        "vucc_band": .vuccBand,
        "vucc_satellite": .vuccSatellite,
        "wab": .wab,
        "wac": .wac,
        "wac_band": .wacBand,
        "wae": .wae,
        "wae_band": .waeBand,
        "wae_mode": .waeMode,
        "waip": .waip,
        "waip_band": .waipBand,
        "waip_mode": .waipMode,
        "was": .was,
        "was_band": .wasBand,
        "was_eme": .wasEme,
        "was_mode": .wasMode,
        "was_novice": .wasNovice,
        "was_qrp": .wasQrp,
        "was_satellite": .wasSatellite,
        "wituz": .wituz,
        "wituz_band": .wituzBand,
    ]

    /// Creates a value from its textual form.
    ///
    /// - Parameter rawValue: The credit, in any case.
    /// - Returns: The matching member, or `.unrecognized` when `rawValue` names
    ///   no credit the specification defines.
    public init(rawValue: some StringProtocol) {
        guard let member = Self.membersByLowercasedValue[rawValue.lowercased()] else {
            self = .unrecognized(rawValue.description)

            return
        }

        self = member
    }
}
