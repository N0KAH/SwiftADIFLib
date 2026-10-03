/// The ADIF `Contest ID` enumeration.
///
/// - Note: See the specification's section III.B for the authoritative list of
///   contest id values.
public enum ADIContestID: ADIEnumeration {
    ///
    /// PODXS Great Pumpkin Sprint
    case contestID070160mSprint
    ///
    /// PODXS Three Day Weekend
    case contestID0703Day
    ///
    /// PODXS 31 Flavors
    case contestID07031Flavors
    ///
    /// PODXS 40m Firecracker Sprint
    case contestID07040mSprint
    ///
    /// PODXS 80m Jay Hudak Memorial Sprint
    case contestID07080mSprint
    ///
    /// PODXS PSKFest
    case contestID070Pskfest
    ///
    /// PODXS St. Patricks Day
    case contestID070StPatsDay
    ///
    /// PODXS Valentine Sprint
    case contestID070ValentineSprint
    ///
    /// Ten-Meter RTTY Contest (2011 onwards)
    case contestID10Rtty
    ///
    /// Open Season Ten Meter QSO Party
    case contestID1010OpenSeason
    ///
    /// 7th-Area QSO Party
    case contestID7qp
    ///
    /// Alabama QSO Party
    case alQsoParty
    ///
    /// JARL All Asian DX Contest (CW)
    case allAsianDxCw
    ///
    /// JARL All Asian DX Contest (PHONE)
    case allAsianDxPhone
    ///
    /// ANARTS WW RTTY
    case anartsRtty
    ///
    /// Anatolian WW RTTY
    case anatolianRtty
    ///
    /// Asia - Pacific Sprint
    case apSprint
    ///
    /// Arkansas QSO Party
    case arQsoParty
    ///
    /// ARI DX Contest
    case ariDx
    ///
    /// ARI Italian EME Trophy
    case ariEme
    ///
    /// ARI Italian Activity Contest (13cm+)
    case ariIac13cm
    ///
    /// ARI Italian Activity Contest (23cm)
    case ariIac23cm
    ///
    /// ARI Italian Activity Contest (6m)
    case ariIac6m
    ///
    /// ARI Italian Activity Contest (UHF)
    case ariIacUhf
    ///
    /// ARI Italian Activity Contest (VHF)
    case ariIacVhf
    ///
    /// ARRL 10 Meter Contest
    case arrl10
    ///
    /// ARRL 10 GHz and Up Contest
    case arrl10Ghz
    ///
    /// ARRL 160 Meter Contest
    case arrl160
    ///
    /// ARRL 222 MHz and Up Distance Contest
    case arrl222
    ///
    /// ARRL International Digital Contest
    case arrlDigi
    ///
    /// ARRL International DX Contest (CW)
    case arrlDxCw
    ///
    /// ARRL International DX Contest (Phone)
    case arrlDxSsb
    ///
    /// ARRL EME contest
    case arrlEme
    /// The specification's `ARRL-FIELD-DAY` value.
    case arrlFieldDay
    ///
    /// ARRL Rookie Roundup (CW)
    case arrlRrCw
    ///
    /// ARRL Rookie Roundup (RTTY)
    case arrlRrRtty
    ///
    /// ARRL Rookie Roundup (Phone)
    case arrlRrSsb
    ///
    /// ARRL RTTY Round-Up
    case arrlRtty
    ///
    /// ARRL School Club Roundup
    case arrlScr
    ///
    /// ARRL November Sweepstakes (CW)
    case arrlSsCw
    ///
    /// ARRL November Sweepstakes (Phone)
    case arrlSsSsb
    ///
    /// ARRL August UHF Contest
    case arrlUhfAug
    ///
    /// ARRL January VHF Sweepstakes
    case arrlVhfJan
    ///
    /// ARRL June VHF QSO Party
    case arrlVhfJun
    ///
    /// ARRL September VHF QSO Party
    case arrlVhfSep
    ///
    /// Arizona QSO Party
    case azQsoParty
    ///
    /// ORARI Banggai DX Contest
    case banggaiDx
    ///
    /// BARTG Spring RTTY Contest
    case bartgRtty
    ///
    /// BARTG Sprint Contest
    case bartgSprint
    ///
    /// British Columbia QSO Party
    case bcQsoParty
    ///
    /// ORARI Bekasi Merdeka Contest
    case bekasiMerdekaContest
    ///
    /// California QSO Party
    case caQsoParty
    ///
    /// CIS DX Contest
    case cisDx
    ///
    /// Colorado QSO Party
    case coQsoParty
    ///
    /// CQ WW 160 Meter DX Contest (CW)
    case cq160Cw
    ///
    /// CQ WW 160 Meter DX Contest (SSB)
    case cq160Ssb
    ///
    /// CQ-M International DX Contest
    case cqM
    ///
    /// CQ World-Wide VHF Contest
    case cqVhf
    ///
    /// CQ WW WPX Contest (CW)
    case cqWpxCw
    ///
    /// CQ/RJ WW RTTY WPX Contest
    case cqWpxRtty
    ///
    /// CQ WW WPX Contest (SSB)
    case cqWpxSsb
    ///
    /// CQ WW DX Contest (CW)
    case cqWwCw
    ///
    /// CQ/RJ WW RTTY DX Contest
    case cqWwRtty
    ///
    /// CQ WW DX Contest (SSB)
    case cqWwSsb
    ///
    /// Connecticut QSO Party
    case ctQsoParty
    ///
    /// Concurso Verde e Amarelo DX CW Contest
    case cvaDxCw
    ///
    /// Concurso Verde e Amarelo DX CW Contest
    case cvaDxSsb
    ///
    /// CWops CW Open Competition
    case cwopsCwOpen
    ///
    /// CWops Mini-CWT Test
    case cwopsCwt
    ///
    /// DARC 10m Contest
    case darc10
    ///
    /// DARC CW Trainee Contest
    case darcCwa
    ///
    /// DARC FT4 Contest
    case darcFt4
    ///
    /// DARC Hell Contest
    case darcHell
    ///
    /// DARC Microwave Contest
    case darcMicrowave
    ///
    /// DARC Trainee Contest
    case darcTrainee
    ///
    /// DARC UKW Spring Contest
    case darcUkwSpring
    ///
    /// DARC UKW Summer Contest
    case darcUkwFieldDay
    ///
    /// DARC VHF-, UHF-, Microwave Contest (May)
    case darcVhfUhfMicrowave
    ///
    /// WAE DX Contest (CW)
    case darcWaedcCw
    ///
    /// WAE DX Contest (RTTY)
    case darcWaedcRtty
    ///
    /// WAE DX Contest (SSB)
    case darcWaedcSsb
    ///
    /// DARC Worked All Germany
    case darcWag
    ///
    /// Delaware QSO Party
    case deQsoParty
    ///
    /// DL-DX RTTY Contest
    case dlDxRtty
    ///
    /// DMC RTTY Contest
    case dmcRtty
    ///
    /// Concurso Nacional de Telegrafía
    case eaCncw
    ///
    /// Municipios Españoles
    case eaDme
    ///
    /// His Majesty The King of Spain CW Contest (2022 and later)
    case eaMajestadCw
    ///
    /// His Majesty The King of Spain SSB Contest (2022 and later)
    case eaMajestadSsb
    /// The specification's `EA-PSK63` value.
    case eaPsk63
    ///
    /// Unión de Radioaficionados Españoles RTTY Contest
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case eaRtty
    ///
    /// Su Majestad El Rey de España - CW (2021 and earlier)
    case eaSmreCw
    ///
    /// Su Majestad El Rey de España - SSB (2021 and earlier)
    case eaSmreSsb
    ///
    /// Atlántico V-UHF
    case eaVhfAtlantic
    ///
    /// Combinado de V-UHF
    case eaVhfCom
    ///
    /// Costa del Sol V-UHF
    case eaVhfCostaSol
    ///
    /// Nacional VHF
    case eaVhfEa
    ///
    /// Segovia EA1RCS V-UHF
    case eaVhfEa1rcs
    ///
    /// QSL V-UHF & 50MHz
    case eaVhfQsl
    ///
    /// Sant Sadurni V-UHF
    case eaVhfSadurni
    ///
    /// Unión de Radioaficionados Españoles RTTY Contest
    case eaWwRtty
    ///
    /// DARC Easter Contest
    case easter
    ///
    /// PSK63 QSO Party
    case epcPsk63
    /// The specification's `EU Sprint` value.
    case euSprint
    ///
    /// EU HF Championship
    case euHf
    ///
    /// EU PSK DX Contest
    case euPskDx
    ///
    /// European CW Association 160m CW Party
    case eucw160m
    ///
    /// FISTS Fall Sprint
    case fallSprint
    ///
    /// Florida QSO Party
    case flQsoParty
    ///
    /// Georgia QSO Party
    case gaQsoParty
    ///
    /// Hungarian DX Contest
    case haDx
    ///
    /// Helvetia Contest
    case helvetia
    ///
    /// Hawaiian QSO Party
    case hiQsoParty
    ///
    /// IARC Holyland Contest
    case holyland
    ///
    /// Iowa QSO Party
    case iaQsoParty
    ///
    /// DARC IARU Region 1 Field Day
    case iaruFieldDay
    ///
    /// IARU HF World Championship
    case iaruHf
    ///
    /// ICWC Medium Speed Test
    case icwcMst
    ///
    /// Idaho QSO Party
    case idQsoParty
    ///
    /// Illinois QSO Party
    case ilQsoParty
    ///
    /// Indiana QSO Party
    case inQsoParty
    /// The specification's `JARTS-WW-RTTY` value.
    case jartsWwRtty
    ///
    /// Japan International DX Contest (CW)
    case jidxCw
    ///
    /// Japan International DX Contest (SSB)
    case jidxSsb
    ///
    /// Mongolian RTTY DX Contest
    case jtDxRtty
    ///
    /// K1USN Slow Speed Open
    case k1usnSso
    ///
    /// K1USN Slow Speed Test
    case k1usnSst
    ///
    /// Kansas QSO Party
    case ksQsoParty
    ///
    /// Kentucky QSO Party
    case kyQsoParty
    ///
    /// Louisiana QSO Party
    case laQsoParty
    ///
    /// DRCG Long Distance Contest (RTTY)
    case ldcRtty
    ///
    /// LZ DX Contest
    case lzDx
    ///
    /// Maritimes QSO Party
    case marQsoParty
    ///
    /// Maryland QSO Party
    case mdQsoParty
    ///
    /// Maine QSO Party
    case meQsoParty
    ///
    /// Michigan QSO Party
    case miQsoParty
    ///
    /// Mid-Atlantic QSO Party
    case midatlanticQsoParty
    ///
    /// Minnesota QSO Party
    case mnQsoParty
    ///
    /// Missouri QSO Party
    case moQsoParty
    ///
    /// Mississippi QSO Party
    case msQsoParty
    ///
    /// Montana QSO Party
    case mtQsoParty
    ///
    /// North America Sprint (CW)
    case naSprintCw
    ///
    /// North America Sprint (RTTY)
    case naSprintRtty
    ///
    /// North America Sprint (Phone)
    case naSprintSsb
    ///
    /// North America QSO Party (CW)
    case naqpCw
    ///
    /// North America QSO Party (RTTY)
    case naqpRtty
    ///
    /// North America QSO Party (Phone)
    case naqpSsb
    ///
    /// International Naval Contest (INC)
    case naval
    ///
    /// North Carolina QSO Party
    case ncQsoParty
    ///
    /// North Dakota QSO Party
    case ndQsoParty
    ///
    /// Nebraska QSO Party
    case neQsoParty
    ///
    /// New England QSO Party
    case neqp
    ///
    /// New Hampshire QSO Party
    case nhQsoParty
    ///
    /// New Jersey QSO Party
    case njQsoParty
    ///
    /// New Mexico QSO Party
    case nmQsoParty
    ///
    /// NRAU-Baltic Contest (CW)
    case nrauBalticCw
    ///
    /// NRAU-Baltic Contest (SSB)
    case nrauBalticSsb
    ///
    /// Nevada QSO Party
    case nvQsoParty
    ///
    /// New York QSO Party
    case nyQsoParty
    ///
    /// Oceania DX Contest (CW)
    case oceaniaDxCw
    ///
    /// Oceania DX Contest (SSB)
    case oceaniaDxSsb
    ///
    /// Ohio QSO Party
    case ohQsoParty
    ///
    /// Czech Radio Club OK DX Contest
    case okDxRtty
    ///
    /// Czech Radio Club OK-OM DX Contest
    case okOmDx
    ///
    /// Oklahoma QSO Party
    case okQsoParty
    ///
    /// Old Man International Sideband Society QSO Party
    case omissQsoParty
    ///
    /// Ontario QSO Party
    case onQsoParty
    ///
    /// Oregon QSO Party
    case orQsoParty
    ///
    /// ORARI DX Contest
    case orariDx
    ///
    /// Pennsylvania QSO Party
    case paQsoParty
    ///
    /// Dutch PACC Contest
    case pacc
    ///
    /// PCCPro CW Contest
    case pcc
    ///
    /// MDXA PSK DeathMatch (2005-2010)
    case pskDeathmatch
    ///
    /// Quebec QSO Party
    case qcQsoParty
    ///
    /// Canadian Amateur Radio Society Contest
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case rac
    ///
    /// RAC Canada Day Contest
    case racCanadaDay
    ///
    /// RAC Canada Winter Contest
    case racCanadaWinter
    ///
    /// Russian District Award Contest
    case rdac
    ///
    /// Russian DX Contest
    case rdxc
    ///
    /// Reseau des Emetteurs Francais 160m Contest
    case ref160m
    ///
    /// Reseau des Emetteurs Francais Contest (CW)
    case refCw
    ///
    /// Reseau des Emetteurs Francais Contest (SSB)
    case refSsb
    ///
    /// Rede dos Emissores Portugueses Portugal Day HF Contest
    case repPortugalDayHf
    ///
    /// Rhode Island QSO Party
    case riQsoParty
    ///
    /// 1.8MHz Contest
    case rsgb160
    ///
    /// 21/28 MHz Contest (CW)
    case rsgb2128Cw
    ///
    /// 21/28 MHz Contest (SSB)
    case rsgb2128Ssb
    ///
    /// 80m Club Championships
    case rsgb80mCc
    ///
    /// Affiliated Societies Team Contest (CW)
    case rsgbAfsCw
    ///
    /// Affiliated Societies Team Contest (SSB)
    case rsgbAfsSsb
    ///
    /// Club Calls
    case rsgbClubCalls
    ///
    /// Commonwealth Contest
    case rsgbCommonwealth
    ///
    /// IOTA Contest
    case rsgbIota
    ///
    /// Low Power Field Day
    case rsgbLowPower
    ///
    /// National Field Day
    case rsgbNfd
    ///
    /// RoPoCo
    case rsgbRopoco
    ///
    /// SSB Field Day
    case rsgbSsbFd
    ///
    /// Russian Radio RTTY Worldwide Contest
    case russianRtty
    ///
    /// Scandinavian Activity Contest (CW)
    case sacCw
    ///
    /// Scandinavian Activity Contest (SSB)
    case sacSsb
    ///
    /// SARTG WW RTTY
    case sartgRtty
    ///
    /// South Carolina QSO Party
    case scQsoParty
    ///
    /// SCC RTTY Championship
    case sccRtty
    ///
    /// South Dakota QSO Party
    case sdQsoParty
    ///
    /// DARC RTTY Short Contest
    case shortRY
    ///
    /// SSA Portabeltest
    case smpAug
    ///
    /// SSA Portabeltest
    case smpMay
    ///
    /// PRC SPDX Contest (RTTY)
    case spDxRtty
    ///
    /// SPAR Winter Field Day(2016 and earlier)
    case sparWinterFd
    ///
    /// SP DX Contest
    case spdxcontest
    ///
    /// FISTS Spring Sprint
    case springSprint
    ///
    /// Scottish-Russian Marathon
    case srMarathon
    ///
    /// Stew Perry Topband Distance Challenge
    case stewPerry
    ///
    /// FISTS Summer Sprint
    case summerSprint
    ///
    /// TARA Grid Dip PSK-RTTY Shindig
    case taraGridDip
    ///
    /// TARA RTTY Mêlée
    case taraRtty
    ///
    /// TARA Rumble PSK Contest
    case taraRumble
    ///
    /// TARA Skirmish Digital Prefix Contest
    case taraSkirmish
    ///
    /// Ten-Meter RTTY Contest (before 2011)
    case tenRtty
    ///
    /// The Makrothen Contest
    case tmcRtty
    ///
    /// Tennessee QSO Party
    case tnQsoParty
    ///
    /// Texas QSO Party
    case txQsoParty
    ///
    /// UBA Contest (CW)
    case ubaDxCw
    ///
    /// UBA Contest (SSB)
    case ubaDxSsb
    ///
    /// European PSK Club BPSK63 Contest
    case ukDxBpsk63
    ///
    /// UK DX RTTY Contest
    case ukDxRtty
    ///
    /// Open Ukraine RTTY Championship
    case ukrChampRtty
    /// The specification's `UKRAINIAN DX` value.
    case ukrainianDx
    /// The specification's `UKSMG-6M-MARATHON` value.
    case uksmg6mMarathon
    ///
    /// UKSMG Summer Es Contest
    case uksmgSummerEs
    ///
    /// Ukrainian DX Contest
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case ureDx
    ///
    /// Mobile Amateur Awards Club
    case usCountiesQso
    ///
    /// Utah QSO Party
    case utQsoParty
    ///
    /// Virginia QSO Party
    case vaQsoParty
    ///
    /// RCV Venezuelan Independence Day Contest
    case venezIndDay
    /// The specification's `VIRGINIA QSO PARTY` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case virginiaQsoParty
    ///
    /// Alessandro Volta RTTY DX Contest
    case voltaRtty
    ///
    /// Vermont QSO Party
    case vtQsoParty
    ///
    /// Washington QSO Party
    case waQsoParty
    ///
    /// Winter Field Day (2017 and later)
    case wfd
    ///
    /// Wisconsin QSO Party
    case wiQsoParty
    ///
    /// WIA Harry Angel Memorial 80m Sprint
    case wiaHarryAngel
    ///
    /// WIA John Moyle Memorial Field Day
    case wiaJmmfd
    ///
    /// WIA Oceania DX (OCDX) Contest
    case wiaOcdx
    ///
    /// WIA Remembrance Day
    case wiaRemembrance
    ///
    /// WIA Ross Hull Memorial VHF/UHF Contest
    case wiaRossHull
    ///
    /// WIA Trans Tasman Low Bands Challenge
    case wiaTransTasman
    ///
    /// WIA VHF UHF Field Days
    case wiaVhfUhfFd
    /// The specification's `WIA-VK SHIRES` value.
    case wiaVkShires
    ///
    /// FISTS Winter Sprint
    case winterSprint
    ///
    /// West Virginia QSO Party
    case wvQsoParty
    ///
    /// World Wide Digi DX Contest
    case wwDigi
    ///
    /// Wyoming QSO Party
    case wyQsoParty
    ///
    /// Mexico International Contest (RTTY)
    case xeIntlRtty
    ///
    /// YODX HF contest
    case yohfdx
    ///
    /// YU DX Contest
    case yudxc

    /// A value that this library does not recognize.
    ///
    /// - Important: This case exists so that unrecognized values survive a
    ///   parse-and-serialize round trip rather than being discarded.
    case unrecognized(String)

    /// Every value the specification defines for this enumeration, in
    /// specification order, excluding ``ADIContestID.unrecognized(_:)``.
    public static let allMembers: [ADIContestID] = [
        .contestID070160mSprint,
        .contestID0703Day,
        .contestID07031Flavors,
        .contestID07040mSprint,
        .contestID07080mSprint,
        .contestID070Pskfest,
        .contestID070StPatsDay,
        .contestID070ValentineSprint,
        .contestID10Rtty,
        .contestID1010OpenSeason,
        .contestID7qp,
        .alQsoParty,
        .allAsianDxCw,
        .allAsianDxPhone,
        .anartsRtty,
        .anatolianRtty,
        .apSprint,
        .arQsoParty,
        .ariDx,
        .ariEme,
        .ariIac13cm,
        .ariIac23cm,
        .ariIac6m,
        .ariIacUhf,
        .ariIacVhf,
        .arrl10,
        .arrl10Ghz,
        .arrl160,
        .arrl222,
        .arrlDigi,
        .arrlDxCw,
        .arrlDxSsb,
        .arrlEme,
        .arrlFieldDay,
        .arrlRrCw,
        .arrlRrRtty,
        .arrlRrSsb,
        .arrlRtty,
        .arrlScr,
        .arrlSsCw,
        .arrlSsSsb,
        .arrlUhfAug,
        .arrlVhfJan,
        .arrlVhfJun,
        .arrlVhfSep,
        .azQsoParty,
        .banggaiDx,
        .bartgRtty,
        .bartgSprint,
        .bcQsoParty,
        .bekasiMerdekaContest,
        .caQsoParty,
        .cisDx,
        .coQsoParty,
        .cq160Cw,
        .cq160Ssb,
        .cqM,
        .cqVhf,
        .cqWpxCw,
        .cqWpxRtty,
        .cqWpxSsb,
        .cqWwCw,
        .cqWwRtty,
        .cqWwSsb,
        .ctQsoParty,
        .cvaDxCw,
        .cvaDxSsb,
        .cwopsCwOpen,
        .cwopsCwt,
        .darc10,
        .darcCwa,
        .darcFt4,
        .darcHell,
        .darcMicrowave,
        .darcTrainee,
        .darcUkwSpring,
        .darcUkwFieldDay,
        .darcVhfUhfMicrowave,
        .darcWaedcCw,
        .darcWaedcRtty,
        .darcWaedcSsb,
        .darcWag,
        .deQsoParty,
        .dlDxRtty,
        .dmcRtty,
        .eaCncw,
        .eaDme,
        .eaMajestadCw,
        .eaMajestadSsb,
        .eaPsk63,
        .eaRtty,
        .eaSmreCw,
        .eaSmreSsb,
        .eaVhfAtlantic,
        .eaVhfCom,
        .eaVhfCostaSol,
        .eaVhfEa,
        .eaVhfEa1rcs,
        .eaVhfQsl,
        .eaVhfSadurni,
        .eaWwRtty,
        .easter,
        .epcPsk63,
        .euSprint,
        .euHf,
        .euPskDx,
        .eucw160m,
        .fallSprint,
        .flQsoParty,
        .gaQsoParty,
        .haDx,
        .helvetia,
        .hiQsoParty,
        .holyland,
        .iaQsoParty,
        .iaruFieldDay,
        .iaruHf,
        .icwcMst,
        .idQsoParty,
        .ilQsoParty,
        .inQsoParty,
        .jartsWwRtty,
        .jidxCw,
        .jidxSsb,
        .jtDxRtty,
        .k1usnSso,
        .k1usnSst,
        .ksQsoParty,
        .kyQsoParty,
        .laQsoParty,
        .ldcRtty,
        .lzDx,
        .marQsoParty,
        .mdQsoParty,
        .meQsoParty,
        .miQsoParty,
        .midatlanticQsoParty,
        .mnQsoParty,
        .moQsoParty,
        .msQsoParty,
        .mtQsoParty,
        .naSprintCw,
        .naSprintRtty,
        .naSprintSsb,
        .naqpCw,
        .naqpRtty,
        .naqpSsb,
        .naval,
        .ncQsoParty,
        .ndQsoParty,
        .neQsoParty,
        .neqp,
        .nhQsoParty,
        .njQsoParty,
        .nmQsoParty,
        .nrauBalticCw,
        .nrauBalticSsb,
        .nvQsoParty,
        .nyQsoParty,
        .oceaniaDxCw,
        .oceaniaDxSsb,
        .ohQsoParty,
        .okDxRtty,
        .okOmDx,
        .okQsoParty,
        .omissQsoParty,
        .onQsoParty,
        .orQsoParty,
        .orariDx,
        .paQsoParty,
        .pacc,
        .pcc,
        .pskDeathmatch,
        .qcQsoParty,
        .rac,
        .racCanadaDay,
        .racCanadaWinter,
        .rdac,
        .rdxc,
        .ref160m,
        .refCw,
        .refSsb,
        .repPortugalDayHf,
        .riQsoParty,
        .rsgb160,
        .rsgb2128Cw,
        .rsgb2128Ssb,
        .rsgb80mCc,
        .rsgbAfsCw,
        .rsgbAfsSsb,
        .rsgbClubCalls,
        .rsgbCommonwealth,
        .rsgbIota,
        .rsgbLowPower,
        .rsgbNfd,
        .rsgbRopoco,
        .rsgbSsbFd,
        .russianRtty,
        .sacCw,
        .sacSsb,
        .sartgRtty,
        .scQsoParty,
        .sccRtty,
        .sdQsoParty,
        .shortRY,
        .smpAug,
        .smpMay,
        .spDxRtty,
        .sparWinterFd,
        .spdxcontest,
        .springSprint,
        .srMarathon,
        .stewPerry,
        .summerSprint,
        .taraGridDip,
        .taraRtty,
        .taraRumble,
        .taraSkirmish,
        .tenRtty,
        .tmcRtty,
        .tnQsoParty,
        .txQsoParty,
        .ubaDxCw,
        .ubaDxSsb,
        .ukDxBpsk63,
        .ukDxRtty,
        .ukrChampRtty,
        .ukrainianDx,
        .uksmg6mMarathon,
        .uksmgSummerEs,
        .ureDx,
        .usCountiesQso,
        .utQsoParty,
        .vaQsoParty,
        .venezIndDay,
        .virginiaQsoParty,
        .voltaRtty,
        .vtQsoParty,
        .waQsoParty,
        .wfd,
        .wiQsoParty,
        .wiaHarryAngel,
        .wiaJmmfd,
        .wiaOcdx,
        .wiaRemembrance,
        .wiaRossHull,
        .wiaTransTasman,
        .wiaVhfUhfFd,
        .wiaVkShires,
        .winterSprint,
        .wvQsoParty,
        .wwDigi,
        .wyQsoParty,
        .xeIntlRtty,
        .yohfdx,
        .yudxc,
    ]

    /// The values the specification marks as import-only.
    ///
    /// - Note: Empty for enumerations that define no import-only values.
    public static let importOnlyMembers: Set<String> = [
        "EA-RTTY",
        "RAC",
        "URE-DX",
        "VIRGINIA QSO PARTY",
    ]

    /// The value in the canonical form the specification uses.
    public var description: String {
        switch self {
        case .contestID070160mSprint:
            "070-160M-SPRINT"
        case .contestID0703Day:
            "070-3-DAY"
        case .contestID07031Flavors:
            "070-31-FLAVORS"
        case .contestID07040mSprint:
            "070-40M-SPRINT"
        case .contestID07080mSprint:
            "070-80M-SPRINT"
        case .contestID070Pskfest:
            "070-PSKFEST"
        case .contestID070StPatsDay:
            "070-ST-PATS-DAY"
        case .contestID070ValentineSprint:
            "070-VALENTINE-SPRINT"
        case .contestID10Rtty:
            "10-RTTY"
        case .contestID1010OpenSeason:
            "1010-OPEN-SEASON"
        case .contestID7qp:
            "7QP"
        case .alQsoParty:
            "AL-QSO-PARTY"
        case .allAsianDxCw:
            "ALL-ASIAN-DX-CW"
        case .allAsianDxPhone:
            "ALL-ASIAN-DX-PHONE"
        case .anartsRtty:
            "ANARTS-RTTY"
        case .anatolianRtty:
            "ANATOLIAN-RTTY"
        case .apSprint:
            "AP-SPRINT"
        case .arQsoParty:
            "AR-QSO-PARTY"
        case .ariDx:
            "ARI-DX"
        case .ariEme:
            "ARI-EME"
        case .ariIac13cm:
            "ARI-IAC-13CM"
        case .ariIac23cm:
            "ARI-IAC-23CM"
        case .ariIac6m:
            "ARI-IAC-6M"
        case .ariIacUhf:
            "ARI-IAC-UHF"
        case .ariIacVhf:
            "ARI-IAC-VHF"
        case .arrl10:
            "ARRL-10"
        case .arrl10Ghz:
            "ARRL-10-GHZ"
        case .arrl160:
            "ARRL-160"
        case .arrl222:
            "ARRL-222"
        case .arrlDigi:
            "ARRL-DIGI"
        case .arrlDxCw:
            "ARRL-DX-CW"
        case .arrlDxSsb:
            "ARRL-DX-SSB"
        case .arrlEme:
            "ARRL-EME"
        case .arrlFieldDay:
            "ARRL-FIELD-DAY"
        case .arrlRrCw:
            "ARRL-RR-CW"
        case .arrlRrRtty:
            "ARRL-RR-RTTY"
        case .arrlRrSsb:
            "ARRL-RR-SSB"
        case .arrlRtty:
            "ARRL-RTTY"
        case .arrlScr:
            "ARRL-SCR"
        case .arrlSsCw:
            "ARRL-SS-CW"
        case .arrlSsSsb:
            "ARRL-SS-SSB"
        case .arrlUhfAug:
            "ARRL-UHF-AUG"
        case .arrlVhfJan:
            "ARRL-VHF-JAN"
        case .arrlVhfJun:
            "ARRL-VHF-JUN"
        case .arrlVhfSep:
            "ARRL-VHF-SEP"
        case .azQsoParty:
            "AZ-QSO-PARTY"
        case .banggaiDx:
            "BANGGAI-DX"
        case .bartgRtty:
            "BARTG-RTTY"
        case .bartgSprint:
            "BARTG-SPRINT"
        case .bcQsoParty:
            "BC-QSO-PARTY"
        case .bekasiMerdekaContest:
            "BEKASI-MERDEKA-CONTEST"
        case .caQsoParty:
            "CA-QSO-PARTY"
        case .cisDx:
            "CIS-DX"
        case .coQsoParty:
            "CO-QSO-PARTY"
        case .cq160Cw:
            "CQ-160-CW"
        case .cq160Ssb:
            "CQ-160-SSB"
        case .cqM:
            "CQ-M"
        case .cqVhf:
            "CQ-VHF"
        case .cqWpxCw:
            "CQ-WPX-CW"
        case .cqWpxRtty:
            "CQ-WPX-RTTY"
        case .cqWpxSsb:
            "CQ-WPX-SSB"
        case .cqWwCw:
            "CQ-WW-CW"
        case .cqWwRtty:
            "CQ-WW-RTTY"
        case .cqWwSsb:
            "CQ-WW-SSB"
        case .ctQsoParty:
            "CT-QSO-PARTY"
        case .cvaDxCw:
            "CVA-DX-CW"
        case .cvaDxSsb:
            "CVA-DX-SSB"
        case .cwopsCwOpen:
            "CWOPS-CW-OPEN"
        case .cwopsCwt:
            "CWOPS-CWT"
        case .darc10:
            "DARC-10"
        case .darcCwa:
            "DARC-CWA"
        case .darcFt4:
            "DARC-FT4"
        case .darcHell:
            "DARC-HELL"
        case .darcMicrowave:
            "DARC-MICROWAVE"
        case .darcTrainee:
            "DARC-TRAINEE"
        case .darcUkwSpring:
            "DARC-UKW-SPRING"
        case .darcUkwFieldDay:
            "DARC-UKW-FIELD-DAY"
        case .darcVhfUhfMicrowave:
            "DARC-VHF-UHF-MICROWAVE"
        case .darcWaedcCw:
            "DARC-WAEDC-CW"
        case .darcWaedcRtty:
            "DARC-WAEDC-RTTY"
        case .darcWaedcSsb:
            "DARC-WAEDC-SSB"
        case .darcWag:
            "DARC-WAG"
        case .deQsoParty:
            "DE-QSO-PARTY"
        case .dlDxRtty:
            "DL-DX-RTTY"
        case .dmcRtty:
            "DMC-RTTY"
        case .eaCncw:
            "EA-CNCW"
        case .eaDme:
            "EA-DME"
        case .eaMajestadCw:
            "EA-MAJESTAD-CW"
        case .eaMajestadSsb:
            "EA-MAJESTAD-SSB"
        case .eaPsk63:
            "EA-PSK63"
        case .eaRtty:
            "EA-RTTY"
        case .eaSmreCw:
            "EA-SMRE-CW"
        case .eaSmreSsb:
            "EA-SMRE-SSB"
        case .eaVhfAtlantic:
            "EA-VHF-ATLANTIC"
        case .eaVhfCom:
            "EA-VHF-COM"
        case .eaVhfCostaSol:
            "EA-VHF-COSTA-SOL"
        case .eaVhfEa:
            "EA-VHF-EA"
        case .eaVhfEa1rcs:
            "EA-VHF-EA1RCS"
        case .eaVhfQsl:
            "EA-VHF-QSL"
        case .eaVhfSadurni:
            "EA-VHF-SADURNI"
        case .eaWwRtty:
            "EA-WW-RTTY"
        case .easter:
            "EASTER"
        case .epcPsk63:
            "EPC-PSK63"
        case .euSprint:
            "EU Sprint"
        case .euHf:
            "EU-HF"
        case .euPskDx:
            "EU-PSK-DX"
        case .eucw160m:
            "EUCW160M"
        case .fallSprint:
            "FALL SPRINT"
        case .flQsoParty:
            "FL-QSO-PARTY"
        case .gaQsoParty:
            "GA-QSO-PARTY"
        case .haDx:
            "HA-DX"
        case .helvetia:
            "HELVETIA"
        case .hiQsoParty:
            "HI-QSO-PARTY"
        case .holyland:
            "HOLYLAND"
        case .iaQsoParty:
            "IA-QSO-PARTY"
        case .iaruFieldDay:
            "IARU-FIELD-DAY"
        case .iaruHf:
            "IARU-HF"
        case .icwcMst:
            "ICWC-MST"
        case .idQsoParty:
            "ID-QSO-PARTY"
        case .ilQsoParty:
            "IL QSO Party"
        case .inQsoParty:
            "IN-QSO-PARTY"
        case .jartsWwRtty:
            "JARTS-WW-RTTY"
        case .jidxCw:
            "JIDX-CW"
        case .jidxSsb:
            "JIDX-SSB"
        case .jtDxRtty:
            "JT-DX-RTTY"
        case .k1usnSso:
            "K1USN-SSO"
        case .k1usnSst:
            "K1USN-SST"
        case .ksQsoParty:
            "KS-QSO-PARTY"
        case .kyQsoParty:
            "KY-QSO-PARTY"
        case .laQsoParty:
            "LA-QSO-PARTY"
        case .ldcRtty:
            "LDC-RTTY"
        case .lzDx:
            "LZ DX"
        case .marQsoParty:
            "MAR-QSO-PARTY"
        case .mdQsoParty:
            "MD-QSO-PARTY"
        case .meQsoParty:
            "ME-QSO-PARTY"
        case .miQsoParty:
            "MI-QSO-PARTY"
        case .midatlanticQsoParty:
            "MIDATLANTIC-QSO-PARTY"
        case .mnQsoParty:
            "MN-QSO-PARTY"
        case .moQsoParty:
            "MO-QSO-PARTY"
        case .msQsoParty:
            "MS-QSO-PARTY"
        case .mtQsoParty:
            "MT-QSO-PARTY"
        case .naSprintCw:
            "NA-SPRINT-CW"
        case .naSprintRtty:
            "NA-SPRINT-RTTY"
        case .naSprintSsb:
            "NA-SPRINT-SSB"
        case .naqpCw:
            "NAQP-CW"
        case .naqpRtty:
            "NAQP-RTTY"
        case .naqpSsb:
            "NAQP-SSB"
        case .naval:
            "NAVAL"
        case .ncQsoParty:
            "NC-QSO-PARTY"
        case .ndQsoParty:
            "ND-QSO-PARTY"
        case .neQsoParty:
            "NE-QSO-PARTY"
        case .neqp:
            "NEQP"
        case .nhQsoParty:
            "NH-QSO-PARTY"
        case .njQsoParty:
            "NJ-QSO-PARTY"
        case .nmQsoParty:
            "NM-QSO-PARTY"
        case .nrauBalticCw:
            "NRAU-BALTIC-CW"
        case .nrauBalticSsb:
            "NRAU-BALTIC-SSB"
        case .nvQsoParty:
            "NV-QSO-PARTY"
        case .nyQsoParty:
            "NY-QSO-PARTY"
        case .oceaniaDxCw:
            "OCEANIA-DX-CW"
        case .oceaniaDxSsb:
            "OCEANIA-DX-SSB"
        case .ohQsoParty:
            "OH-QSO-PARTY"
        case .okDxRtty:
            "OK-DX-RTTY"
        case .okOmDx:
            "OK-OM-DX"
        case .okQsoParty:
            "OK-QSO-PARTY"
        case .omissQsoParty:
            "OMISS-QSO-PARTY"
        case .onQsoParty:
            "ON-QSO-PARTY"
        case .orQsoParty:
            "OR-QSO-PARTY"
        case .orariDx:
            "ORARI-DX"
        case .paQsoParty:
            "PA-QSO-PARTY"
        case .pacc:
            "PACC"
        case .pcc:
            "PCC"
        case .pskDeathmatch:
            "PSK-DEATHMATCH"
        case .qcQsoParty:
            "QC-QSO-PARTY"
        case .rac:
            "RAC"
        case .racCanadaDay:
            "RAC-CANADA-DAY"
        case .racCanadaWinter:
            "RAC-CANADA-WINTER"
        case .rdac:
            "RDAC"
        case .rdxc:
            "RDXC"
        case .ref160m:
            "REF-160M"
        case .refCw:
            "REF-CW"
        case .refSsb:
            "REF-SSB"
        case .repPortugalDayHf:
            "REP-PORTUGAL-DAY-HF"
        case .riQsoParty:
            "RI-QSO-PARTY"
        case .rsgb160:
            "RSGB-160"
        case .rsgb2128Cw:
            "RSGB-21/28-CW"
        case .rsgb2128Ssb:
            "RSGB-21/28-SSB"
        case .rsgb80mCc:
            "RSGB-80M-CC"
        case .rsgbAfsCw:
            "RSGB-AFS-CW"
        case .rsgbAfsSsb:
            "RSGB-AFS-SSB"
        case .rsgbClubCalls:
            "RSGB-CLUB-CALLS"
        case .rsgbCommonwealth:
            "RSGB-COMMONWEALTH"
        case .rsgbIota:
            "RSGB-IOTA"
        case .rsgbLowPower:
            "RSGB-LOW-POWER"
        case .rsgbNfd:
            "RSGB-NFD"
        case .rsgbRopoco:
            "RSGB-ROPOCO"
        case .rsgbSsbFd:
            "RSGB-SSB-FD"
        case .russianRtty:
            "RUSSIAN-RTTY"
        case .sacCw:
            "SAC-CW"
        case .sacSsb:
            "SAC-SSB"
        case .sartgRtty:
            "SARTG-RTTY"
        case .scQsoParty:
            "SC-QSO-PARTY"
        case .sccRtty:
            "SCC-RTTY"
        case .sdQsoParty:
            "SD-QSO-PARTY"
        case .shortRY:
            "ShortRY"
        case .smpAug:
            "SMP-AUG"
        case .smpMay:
            "SMP-MAY"
        case .spDxRtty:
            "SP-DX-RTTY"
        case .sparWinterFd:
            "SPAR-WINTER-FD"
        case .spdxcontest:
            "SPDXContest"
        case .springSprint:
            "SPRING SPRINT"
        case .srMarathon:
            "SR-MARATHON"
        case .stewPerry:
            "STEW-PERRY"
        case .summerSprint:
            "SUMMER SPRINT"
        case .taraGridDip:
            "TARA-GRID-DIP"
        case .taraRtty:
            "TARA-RTTY"
        case .taraRumble:
            "TARA-RUMBLE"
        case .taraSkirmish:
            "TARA-SKIRMISH"
        case .tenRtty:
            "TEN-RTTY"
        case .tmcRtty:
            "TMC-RTTY"
        case .tnQsoParty:
            "TN-QSO-PARTY"
        case .txQsoParty:
            "TX-QSO-PARTY"
        case .ubaDxCw:
            "UBA-DX-CW"
        case .ubaDxSsb:
            "UBA-DX-SSB"
        case .ukDxBpsk63:
            "UK-DX-BPSK63"
        case .ukDxRtty:
            "UK-DX-RTTY"
        case .ukrChampRtty:
            "UKR-CHAMP-RTTY"
        case .ukrainianDx:
            "UKRAINIAN DX"
        case .uksmg6mMarathon:
            "UKSMG-6M-MARATHON"
        case .uksmgSummerEs:
            "UKSMG-SUMMER-ES"
        case .ureDx:
            "URE-DX"
        case .usCountiesQso:
            "US-COUNTIES-QSO"
        case .utQsoParty:
            "UT-QSO-PARTY"
        case .vaQsoParty:
            "VA-QSO-PARTY"
        case .venezIndDay:
            "VENEZ-IND-DAY"
        case .virginiaQsoParty:
            "VIRGINIA QSO PARTY"
        case .voltaRtty:
            "VOLTA-RTTY"
        case .vtQsoParty:
            "VT-QSO-PARTY"
        case .waQsoParty:
            "WA-QSO-PARTY"
        case .wfd:
            "WFD"
        case .wiQsoParty:
            "WI-QSO-PARTY"
        case .wiaHarryAngel:
            "WIA-HARRY ANGEL"
        case .wiaJmmfd:
            "WIA-JMMFD"
        case .wiaOcdx:
            "WIA-OCDX"
        case .wiaRemembrance:
            "WIA-REMEMBRANCE"
        case .wiaRossHull:
            "WIA-ROSS HULL"
        case .wiaTransTasman:
            "WIA-TRANS TASMAN"
        case .wiaVhfUhfFd:
            "WIA-VHF/UHF FD"
        case .wiaVkShires:
            "WIA-VK SHIRES"
        case .winterSprint:
            "WINTER SPRINT"
        case .wvQsoParty:
            "WV-QSO-PARTY"
        case .wwDigi:
            "WW-DIGI"
        case .wyQsoParty:
            "WY-QSO-PARTY"
        case .xeIntlRtty:
            "XE-INTL-RTTY"
        case .yohfdx:
            "YOHFDX"
        case .yudxc:
            "YUDXC"
        case let .unrecognized(raw):
            raw
        }
    }

    private static let membersByLowercasedValue: [String: ADIContestID] = [
        "070-160m-sprint": .contestID070160mSprint,
        "070-3-day": .contestID0703Day,
        "070-31-flavors": .contestID07031Flavors,
        "070-40m-sprint": .contestID07040mSprint,
        "070-80m-sprint": .contestID07080mSprint,
        "070-pskfest": .contestID070Pskfest,
        "070-st-pats-day": .contestID070StPatsDay,
        "070-valentine-sprint": .contestID070ValentineSprint,
        "10-rtty": .contestID10Rtty,
        "1010-open-season": .contestID1010OpenSeason,
        "7qp": .contestID7qp,
        "al-qso-party": .alQsoParty,
        "all-asian-dx-cw": .allAsianDxCw,
        "all-asian-dx-phone": .allAsianDxPhone,
        "anarts-rtty": .anartsRtty,
        "anatolian-rtty": .anatolianRtty,
        "ap-sprint": .apSprint,
        "ar-qso-party": .arQsoParty,
        "ari-dx": .ariDx,
        "ari-eme": .ariEme,
        "ari-iac-13cm": .ariIac13cm,
        "ari-iac-23cm": .ariIac23cm,
        "ari-iac-6m": .ariIac6m,
        "ari-iac-uhf": .ariIacUhf,
        "ari-iac-vhf": .ariIacVhf,
        "arrl-10": .arrl10,
        "arrl-10-ghz": .arrl10Ghz,
        "arrl-160": .arrl160,
        "arrl-222": .arrl222,
        "arrl-digi": .arrlDigi,
        "arrl-dx-cw": .arrlDxCw,
        "arrl-dx-ssb": .arrlDxSsb,
        "arrl-eme": .arrlEme,
        "arrl-field-day": .arrlFieldDay,
        "arrl-rr-cw": .arrlRrCw,
        "arrl-rr-rtty": .arrlRrRtty,
        "arrl-rr-ssb": .arrlRrSsb,
        "arrl-rtty": .arrlRtty,
        "arrl-scr": .arrlScr,
        "arrl-ss-cw": .arrlSsCw,
        "arrl-ss-ssb": .arrlSsSsb,
        "arrl-uhf-aug": .arrlUhfAug,
        "arrl-vhf-jan": .arrlVhfJan,
        "arrl-vhf-jun": .arrlVhfJun,
        "arrl-vhf-sep": .arrlVhfSep,
        "az-qso-party": .azQsoParty,
        "banggai-dx": .banggaiDx,
        "bartg-rtty": .bartgRtty,
        "bartg-sprint": .bartgSprint,
        "bc-qso-party": .bcQsoParty,
        "bekasi-merdeka-contest": .bekasiMerdekaContest,
        "ca-qso-party": .caQsoParty,
        "cis-dx": .cisDx,
        "co-qso-party": .coQsoParty,
        "cq-160-cw": .cq160Cw,
        "cq-160-ssb": .cq160Ssb,
        "cq-m": .cqM,
        "cq-vhf": .cqVhf,
        "cq-wpx-cw": .cqWpxCw,
        "cq-wpx-rtty": .cqWpxRtty,
        "cq-wpx-ssb": .cqWpxSsb,
        "cq-ww-cw": .cqWwCw,
        "cq-ww-rtty": .cqWwRtty,
        "cq-ww-ssb": .cqWwSsb,
        "ct-qso-party": .ctQsoParty,
        "cva-dx-cw": .cvaDxCw,
        "cva-dx-ssb": .cvaDxSsb,
        "cwops-cw-open": .cwopsCwOpen,
        "cwops-cwt": .cwopsCwt,
        "darc-10": .darc10,
        "darc-cwa": .darcCwa,
        "darc-ft4": .darcFt4,
        "darc-hell": .darcHell,
        "darc-microwave": .darcMicrowave,
        "darc-trainee": .darcTrainee,
        "darc-ukw-spring": .darcUkwSpring,
        "darc-ukw-field-day": .darcUkwFieldDay,
        "darc-vhf-uhf-microwave": .darcVhfUhfMicrowave,
        "darc-waedc-cw": .darcWaedcCw,
        "darc-waedc-rtty": .darcWaedcRtty,
        "darc-waedc-ssb": .darcWaedcSsb,
        "darc-wag": .darcWag,
        "de-qso-party": .deQsoParty,
        "dl-dx-rtty": .dlDxRtty,
        "dmc-rtty": .dmcRtty,
        "ea-cncw": .eaCncw,
        "ea-dme": .eaDme,
        "ea-majestad-cw": .eaMajestadCw,
        "ea-majestad-ssb": .eaMajestadSsb,
        "ea-psk63": .eaPsk63,
        "ea-rtty": .eaRtty,
        "ea-smre-cw": .eaSmreCw,
        "ea-smre-ssb": .eaSmreSsb,
        "ea-vhf-atlantic": .eaVhfAtlantic,
        "ea-vhf-com": .eaVhfCom,
        "ea-vhf-costa-sol": .eaVhfCostaSol,
        "ea-vhf-ea": .eaVhfEa,
        "ea-vhf-ea1rcs": .eaVhfEa1rcs,
        "ea-vhf-qsl": .eaVhfQsl,
        "ea-vhf-sadurni": .eaVhfSadurni,
        "ea-ww-rtty": .eaWwRtty,
        "easter": .easter,
        "epc-psk63": .epcPsk63,
        "eu sprint": .euSprint,
        "eu-hf": .euHf,
        "eu-psk-dx": .euPskDx,
        "eucw160m": .eucw160m,
        "fall sprint": .fallSprint,
        "fl-qso-party": .flQsoParty,
        "ga-qso-party": .gaQsoParty,
        "ha-dx": .haDx,
        "helvetia": .helvetia,
        "hi-qso-party": .hiQsoParty,
        "holyland": .holyland,
        "ia-qso-party": .iaQsoParty,
        "iaru-field-day": .iaruFieldDay,
        "iaru-hf": .iaruHf,
        "icwc-mst": .icwcMst,
        "id-qso-party": .idQsoParty,
        "il qso party": .ilQsoParty,
        "in-qso-party": .inQsoParty,
        "jarts-ww-rtty": .jartsWwRtty,
        "jidx-cw": .jidxCw,
        "jidx-ssb": .jidxSsb,
        "jt-dx-rtty": .jtDxRtty,
        "k1usn-sso": .k1usnSso,
        "k1usn-sst": .k1usnSst,
        "ks-qso-party": .ksQsoParty,
        "ky-qso-party": .kyQsoParty,
        "la-qso-party": .laQsoParty,
        "ldc-rtty": .ldcRtty,
        "lz dx": .lzDx,
        "mar-qso-party": .marQsoParty,
        "md-qso-party": .mdQsoParty,
        "me-qso-party": .meQsoParty,
        "mi-qso-party": .miQsoParty,
        "midatlantic-qso-party": .midatlanticQsoParty,
        "mn-qso-party": .mnQsoParty,
        "mo-qso-party": .moQsoParty,
        "ms-qso-party": .msQsoParty,
        "mt-qso-party": .mtQsoParty,
        "na-sprint-cw": .naSprintCw,
        "na-sprint-rtty": .naSprintRtty,
        "na-sprint-ssb": .naSprintSsb,
        "naqp-cw": .naqpCw,
        "naqp-rtty": .naqpRtty,
        "naqp-ssb": .naqpSsb,
        "naval": .naval,
        "nc-qso-party": .ncQsoParty,
        "nd-qso-party": .ndQsoParty,
        "ne-qso-party": .neQsoParty,
        "neqp": .neqp,
        "nh-qso-party": .nhQsoParty,
        "nj-qso-party": .njQsoParty,
        "nm-qso-party": .nmQsoParty,
        "nrau-baltic-cw": .nrauBalticCw,
        "nrau-baltic-ssb": .nrauBalticSsb,
        "nv-qso-party": .nvQsoParty,
        "ny-qso-party": .nyQsoParty,
        "oceania-dx-cw": .oceaniaDxCw,
        "oceania-dx-ssb": .oceaniaDxSsb,
        "oh-qso-party": .ohQsoParty,
        "ok-dx-rtty": .okDxRtty,
        "ok-om-dx": .okOmDx,
        "ok-qso-party": .okQsoParty,
        "omiss-qso-party": .omissQsoParty,
        "on-qso-party": .onQsoParty,
        "or-qso-party": .orQsoParty,
        "orari-dx": .orariDx,
        "pa-qso-party": .paQsoParty,
        "pacc": .pacc,
        "pcc": .pcc,
        "psk-deathmatch": .pskDeathmatch,
        "qc-qso-party": .qcQsoParty,
        "rac": .rac,
        "rac-canada-day": .racCanadaDay,
        "rac-canada-winter": .racCanadaWinter,
        "rdac": .rdac,
        "rdxc": .rdxc,
        "ref-160m": .ref160m,
        "ref-cw": .refCw,
        "ref-ssb": .refSsb,
        "rep-portugal-day-hf": .repPortugalDayHf,
        "ri-qso-party": .riQsoParty,
        "rsgb-160": .rsgb160,
        "rsgb-21/28-cw": .rsgb2128Cw,
        "rsgb-21/28-ssb": .rsgb2128Ssb,
        "rsgb-80m-cc": .rsgb80mCc,
        "rsgb-afs-cw": .rsgbAfsCw,
        "rsgb-afs-ssb": .rsgbAfsSsb,
        "rsgb-club-calls": .rsgbClubCalls,
        "rsgb-commonwealth": .rsgbCommonwealth,
        "rsgb-iota": .rsgbIota,
        "rsgb-low-power": .rsgbLowPower,
        "rsgb-nfd": .rsgbNfd,
        "rsgb-ropoco": .rsgbRopoco,
        "rsgb-ssb-fd": .rsgbSsbFd,
        "russian-rtty": .russianRtty,
        "sac-cw": .sacCw,
        "sac-ssb": .sacSsb,
        "sartg-rtty": .sartgRtty,
        "sc-qso-party": .scQsoParty,
        "scc-rtty": .sccRtty,
        "sd-qso-party": .sdQsoParty,
        "shortry": .shortRY,
        "smp-aug": .smpAug,
        "smp-may": .smpMay,
        "sp-dx-rtty": .spDxRtty,
        "spar-winter-fd": .sparWinterFd,
        "spdxcontest": .spdxcontest,
        "spring sprint": .springSprint,
        "sr-marathon": .srMarathon,
        "stew-perry": .stewPerry,
        "summer sprint": .summerSprint,
        "tara-grid-dip": .taraGridDip,
        "tara-rtty": .taraRtty,
        "tara-rumble": .taraRumble,
        "tara-skirmish": .taraSkirmish,
        "ten-rtty": .tenRtty,
        "tmc-rtty": .tmcRtty,
        "tn-qso-party": .tnQsoParty,
        "tx-qso-party": .txQsoParty,
        "uba-dx-cw": .ubaDxCw,
        "uba-dx-ssb": .ubaDxSsb,
        "uk-dx-bpsk63": .ukDxBpsk63,
        "uk-dx-rtty": .ukDxRtty,
        "ukr-champ-rtty": .ukrChampRtty,
        "ukrainian dx": .ukrainianDx,
        "uksmg-6m-marathon": .uksmg6mMarathon,
        "uksmg-summer-es": .uksmgSummerEs,
        "ure-dx": .ureDx,
        "us-counties-qso": .usCountiesQso,
        "ut-qso-party": .utQsoParty,
        "va-qso-party": .vaQsoParty,
        "venez-ind-day": .venezIndDay,
        "virginia qso party": .virginiaQsoParty,
        "volta-rtty": .voltaRtty,
        "vt-qso-party": .vtQsoParty,
        "wa-qso-party": .waQsoParty,
        "wfd": .wfd,
        "wi-qso-party": .wiQsoParty,
        "wia-harry angel": .wiaHarryAngel,
        "wia-jmmfd": .wiaJmmfd,
        "wia-ocdx": .wiaOcdx,
        "wia-remembrance": .wiaRemembrance,
        "wia-ross hull": .wiaRossHull,
        "wia-trans tasman": .wiaTransTasman,
        "wia-vhf/uhf fd": .wiaVhfUhfFd,
        "wia-vk shires": .wiaVkShires,
        "winter sprint": .winterSprint,
        "wv-qso-party": .wvQsoParty,
        "ww-digi": .wwDigi,
        "wy-qso-party": .wyQsoParty,
        "xe-intl-rtty": .xeIntlRtty,
        "yohfdx": .yohfdx,
        "yudxc": .yudxc,
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
