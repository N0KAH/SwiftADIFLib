/// The ADIF `Mode` enumeration.
///
/// - Note: See the specification's section III.B for the authoritative list of
///   mode values.
public enum ADIMode: ADIEnumeration {
    /// The specification's `AM` value.
    case am
    ///
    /// Amateur Radio Digital Open Protocol
    case ardop
    /// The specification's `ATV` value.
    case atv
    ///
    /// Submodes: CHIP64, CHIP128
    case chip
    /// The specification's `CLO` value.
    case clo
    /// The specification's `CONTESTI` value.
    case contesti
    ///
    /// Submodes: PCW
    case cw
    ///
    /// Submodes: C4FM, DMR, DSTAR, FREEDV, M17
    case digitalvoice
    ///
    /// Submodes: DOM-M, DOM4, DOM5, DOM8, DOM11, DOM16, DOM22, DOM44, DOM88,
    /// DOMINOEX, DOMINOF
    case domino
    ///
    /// Submodes: FREEDATA, VARA HF, VARA SATELLITE, VARA FM 1200, VARA FM 9600
    case dynamicValue
    /// The specification's `FAX` value.
    case fax
    /// The specification's `FM` value.
    case fm
    /// The specification's `FSK441` value.
    case fsk441
    ///
    /// Submodes: SCAMP_FAST, SCAMP_SLOW, SCAMP_VSLOW
    ///
    /// Frequency shift keying
    case fsk
    ///
    /// Franke-Taylor design, 8-FSK modulation
    case ft8
    ///
    /// Submodes: FMHELL, FSKH105, FSKH245, FSKHELL, HELL80, HELLX5, HELLX9, HFSK,
    /// PSKHELL, SLOWHELL
    case hell
    ///
    /// Submodes: ISCAT-A, ISCAT-B
    case iscat
    ///
    /// Submodes: JT4A, JT4B, JT4C, JT4D, JT4E, JT4F, JT4G
    case jt4
    /// The specification's `JT6M` value.
    case jt6m
    ///
    /// Submodes: JT9-1, JT9-2, JT9-5, JT9-10, JT9-30, JT9A, JT9B, JT9C, JT9D, JT9E,
    /// JT9E FAST, JT9F, JT9F FAST, JT9G, JT9G FAST, JT9H, JT9H FAST
    case jt9
    /// The specification's `JT44` value.
    case jt44
    ///
    /// Submodes: JT65A, JT65B, JT65B2, JT65C, JT65C2
    case jt65
    ///
    /// Submodes: FSQCALL, FST4, FST4W, FT2, FT4, JS8, JTMS, MFSK4, MFSK8, MFSK11,
    /// MFSK16, MFSK22, MFSK31, MFSK32, MFSK64, MFSK64L, MFSK128 MFSK128L, Q65
    case mfsk
    /// The specification's `MSK144` value.
    case msk144
    ///
    /// Submodes: SCAMP_OO, SCAMP_OO_SLW
    ///
    /// Single modulated tone
    case mtone
    /// The specification's `MT63` value.
    case mt63
    ///
    /// Submodes: RIBBIT_PIX, RIBBIT_SMS
    ///
    /// Orthogonal Frequency-Division Multiplexing including COFDM
    case ofdm
    ///
    /// Submodes: OLIVIA 4/125, OLIVIA 4/250, OLIVIA 8/250, OLIVIA 8/500, OLIVIA
    /// 16/500, OLIVIA 16/1000, OLIVIA 32/1000
    case olivia
    ///
    /// Submodes: OPERA-BEACON, OPERA-QSO
    case opera
    ///
    /// Submodes: PAC2, PAC3, PAC4
    case pac
    ///
    /// Submodes: PAX2
    case pax
    /// The specification's `PKT` value.
    case pkt
    ///
    /// Submodes: 8PSK125, 8PSK125F, 8PSK125FL, 8PSK250, 8PSK250F, 8PSK250FL,
    /// 8PSK500, 8PSK500F, 8PSK1000, 8PSK1000F, 8PSK1200F, FSK31, PSK10, PSK31,
    /// PSK63, PSK63F, PSK63RC4, PSK63RC5, PSK63RC10, PSK63RC20, PSK63RC32, PSK125,
    /// PSK125C12, PSK125R, PSK125RC10, PSK125RC12, PSK125RC16, PSK125RC4,
    /// PSK125RC5, PSK250, PSK250C6, PSK250R, PSK250RC2, PSK250RC3, PSK250RC5,
    /// PSK250RC6, PSK250RC7, PSK500, PSK500C2, PSK500C4, PSK500R, PSK500RC2,
    /// PSK500RC3, PSK500RC4, PSK800C2, PSK800RC2, PSK1000, PSK1000C2, PSK1000R,
    /// PSK1000RC2, PSKAM10, PSKAM31, PSKAM50, PSKFEC31, QPSK31, QPSK63, QPSK125,
    /// QPSK250, QPSK500, SIM31
    case psk
    /// The specification's `PSK2K` value.
    case psk2k
    /// The specification's `Q15` value.
    case q15
    ///
    /// Submodes: QRA64A, QRA64B, QRA64C, QRA64D, QRA64E
    case qra64
    ///
    /// Submodes: ROS-EME, ROS-HF, ROS-MF
    case ros
    ///
    /// Submodes: ASCI
    case rtty
    /// The specification's `RTTYM` value.
    case rttym
    ///
    /// Submodes: LSB, USB
    case ssb
    /// The specification's `SSTV` value.
    case sstv
    ///
    /// Tonal 10 digital mode with focus on sensitivity, band capacity and
    /// resistance to the HF Doppler frequency spread
    case t10
    ///
    /// Submodes: THOR-M, THOR4, THOR5, THOR8, THOR11, THOR16, THOR22, THOR25X4,
    /// THOR50X1, THOR50X2, THOR100
    case thor
    ///
    /// Submodes: THRBX, THRBX1, THRBX2, THRBX4, THROB1, THROB2, THROB4
    case thrb
    ///
    /// Submodes: AMTORFEC, GTOR, NAVTEX, SITORB
    case tor
    /// The specification's `V4` value.
    case v4
    /// The specification's `VOI` value.
    case voi
    /// The specification's `WINMOR` value.
    case winmor
    /// The specification's `WSPR` value.
    case wspr
    /// The specification's `AMTORFEC` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case amtorfec
    /// The specification's `ASCI` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case asci
    ///
    /// C4FM 4-level FSK Technology Imported QSOs with <MODE:4>C4FM> must be
    /// exported as: <MODE:12>DIGITALVOICE <SUBMODE:4>C4FM
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case c4fm
    /// The specification's `CHIP64` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case chip64
    /// The specification's `CHIP128` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case chip128
    /// The specification's `DOMINOF` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case dominof
    ///
    /// Digital Smart Technologies for Amateur Radio Imported QSOs with
    /// <MODE:5>DSTAR must be exported as: <MODE:12>DIGITALVOICE <SUBMODE:5>DSTAR
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case dstar
    /// The specification's `FMHELL` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case fmhell
    /// The specification's `FSK31` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case fsk31
    /// The specification's `GTOR` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case gtor
    /// The specification's `HELL80` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case hell80
    /// The specification's `HFSK` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case hfsk
    /// The specification's `JT4A` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case jt4a
    /// The specification's `JT4B` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case jt4b
    /// The specification's `JT4C` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case jt4c
    /// The specification's `JT4D` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case jt4d
    /// The specification's `JT4E` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case jt4e
    /// The specification's `JT4F` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case jt4f
    /// The specification's `JT4G` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case jt4g
    /// The specification's `JT65A` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case jt65a
    /// The specification's `JT65B` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case jt65b
    /// The specification's `JT65C` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case jt65c
    /// The specification's `MFSK8` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case mfsk8
    /// The specification's `MFSK16` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case mfsk16
    /// The specification's `PAC2` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case pac2
    /// The specification's `PAC3` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case pac3
    /// The specification's `PAX2` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case pax2
    /// The specification's `PCW` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case pcw
    /// The specification's `PSK10` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case psk10
    /// The specification's `PSK31` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case psk31
    /// The specification's `PSK63` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case psk63
    /// The specification's `PSK63F` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case psk63f
    /// The specification's `PSK125` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case psk125
    /// The specification's `PSKAM10` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case pskam10
    /// The specification's `PSKAM31` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case pskam31
    /// The specification's `PSKAM50` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case pskam50
    /// The specification's `PSKFEC31` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case pskfec31
    /// The specification's `PSKHELL` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case pskhell
    /// The specification's `QPSK31` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case qpsk31
    /// The specification's `QPSK63` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case qpsk63
    /// The specification's `QPSK125` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case qpsk125
    /// The specification's `THRBX` value.
    ///
    /// - Note: The specification marks this value as import-only, meaning it
    ///   conveys something read from a file rather than something a logging
    ///   station creates.
    case thrbx

    /// A value that this library does not recognize.
    ///
    /// - Important: This case exists so that unrecognized values survive a
    ///   parse-and-serialize round trip rather than being discarded.
    case unrecognized(String)

    /// Every value the specification defines for this enumeration, in
    /// specification order, excluding ``ADIMode.unrecognized(_:)``.
    public static let allMembers: [ADIMode] = [
        .am,
        .ardop,
        .atv,
        .chip,
        .clo,
        .contesti,
        .cw,
        .digitalvoice,
        .domino,
        .dynamicValue,
        .fax,
        .fm,
        .fsk441,
        .fsk,
        .ft8,
        .hell,
        .iscat,
        .jt4,
        .jt6m,
        .jt9,
        .jt44,
        .jt65,
        .mfsk,
        .msk144,
        .mtone,
        .mt63,
        .ofdm,
        .olivia,
        .opera,
        .pac,
        .pax,
        .pkt,
        .psk,
        .psk2k,
        .q15,
        .qra64,
        .ros,
        .rtty,
        .rttym,
        .ssb,
        .sstv,
        .t10,
        .thor,
        .thrb,
        .tor,
        .v4,
        .voi,
        .winmor,
        .wspr,
        .amtorfec,
        .asci,
        .c4fm,
        .chip64,
        .chip128,
        .dominof,
        .dstar,
        .fmhell,
        .fsk31,
        .gtor,
        .hell80,
        .hfsk,
        .jt4a,
        .jt4b,
        .jt4c,
        .jt4d,
        .jt4e,
        .jt4f,
        .jt4g,
        .jt65a,
        .jt65b,
        .jt65c,
        .mfsk8,
        .mfsk16,
        .pac2,
        .pac3,
        .pax2,
        .pcw,
        .psk10,
        .psk31,
        .psk63,
        .psk63f,
        .psk125,
        .pskam10,
        .pskam31,
        .pskam50,
        .pskfec31,
        .pskhell,
        .qpsk31,
        .qpsk63,
        .qpsk125,
        .thrbx,
    ]

    /// The values the specification marks as import-only.
    ///
    /// - Note: Empty for enumerations that define no import-only values.
    public static let importOnlyMembers: Set<String> = [
        "AMTORFEC",
        "ASCI",
        "C4FM",
        "CHIP64",
        "CHIP128",
        "DOMINOF",
        "DSTAR",
        "FMHELL",
        "FSK31",
        "GTOR",
        "HELL80",
        "HFSK",
        "JT4A",
        "JT4B",
        "JT4C",
        "JT4D",
        "JT4E",
        "JT4F",
        "JT4G",
        "JT65A",
        "JT65B",
        "JT65C",
        "MFSK8",
        "MFSK16",
        "PAC2",
        "PAC3",
        "PAX2",
        "PCW",
        "PSK10",
        "PSK31",
        "PSK63",
        "PSK63F",
        "PSK125",
        "PSKAM10",
        "PSKAM31",
        "PSKAM50",
        "PSKFEC31",
        "PSKHELL",
        "QPSK31",
        "QPSK63",
        "QPSK125",
        "THRBX",
    ]

    /// The value in the canonical form the specification uses.
    public var description: String {
        switch self {
        case .am:
            "AM"
        case .ardop:
            "ARDOP"
        case .atv:
            "ATV"
        case .chip:
            "CHIP"
        case .clo:
            "CLO"
        case .contesti:
            "CONTESTI"
        case .cw:
            "CW"
        case .digitalvoice:
            "DIGITALVOICE"
        case .domino:
            "DOMINO"
        case .dynamicValue:
            "DYNAMIC"
        case .fax:
            "FAX"
        case .fm:
            "FM"
        case .fsk441:
            "FSK441"
        case .fsk:
            "FSK"
        case .ft8:
            "FT8"
        case .hell:
            "HELL"
        case .iscat:
            "ISCAT"
        case .jt4:
            "JT4"
        case .jt6m:
            "JT6M"
        case .jt9:
            "JT9"
        case .jt44:
            "JT44"
        case .jt65:
            "JT65"
        case .mfsk:
            "MFSK"
        case .msk144:
            "MSK144"
        case .mtone:
            "MTONE"
        case .mt63:
            "MT63"
        case .ofdm:
            "OFDM"
        case .olivia:
            "OLIVIA"
        case .opera:
            "OPERA"
        case .pac:
            "PAC"
        case .pax:
            "PAX"
        case .pkt:
            "PKT"
        case .psk:
            "PSK"
        case .psk2k:
            "PSK2K"
        case .q15:
            "Q15"
        case .qra64:
            "QRA64"
        case .ros:
            "ROS"
        case .rtty:
            "RTTY"
        case .rttym:
            "RTTYM"
        case .ssb:
            "SSB"
        case .sstv:
            "SSTV"
        case .t10:
            "T10"
        case .thor:
            "THOR"
        case .thrb:
            "THRB"
        case .tor:
            "TOR"
        case .v4:
            "V4"
        case .voi:
            "VOI"
        case .winmor:
            "WINMOR"
        case .wspr:
            "WSPR"
        case .amtorfec:
            "AMTORFEC"
        case .asci:
            "ASCI"
        case .c4fm:
            "C4FM"
        case .chip64:
            "CHIP64"
        case .chip128:
            "CHIP128"
        case .dominof:
            "DOMINOF"
        case .dstar:
            "DSTAR"
        case .fmhell:
            "FMHELL"
        case .fsk31:
            "FSK31"
        case .gtor:
            "GTOR"
        case .hell80:
            "HELL80"
        case .hfsk:
            "HFSK"
        case .jt4a:
            "JT4A"
        case .jt4b:
            "JT4B"
        case .jt4c:
            "JT4C"
        case .jt4d:
            "JT4D"
        case .jt4e:
            "JT4E"
        case .jt4f:
            "JT4F"
        case .jt4g:
            "JT4G"
        case .jt65a:
            "JT65A"
        case .jt65b:
            "JT65B"
        case .jt65c:
            "JT65C"
        case .mfsk8:
            "MFSK8"
        case .mfsk16:
            "MFSK16"
        case .pac2:
            "PAC2"
        case .pac3:
            "PAC3"
        case .pax2:
            "PAX2"
        case .pcw:
            "PCW"
        case .psk10:
            "PSK10"
        case .psk31:
            "PSK31"
        case .psk63:
            "PSK63"
        case .psk63f:
            "PSK63F"
        case .psk125:
            "PSK125"
        case .pskam10:
            "PSKAM10"
        case .pskam31:
            "PSKAM31"
        case .pskam50:
            "PSKAM50"
        case .pskfec31:
            "PSKFEC31"
        case .pskhell:
            "PSKHELL"
        case .qpsk31:
            "QPSK31"
        case .qpsk63:
            "QPSK63"
        case .qpsk125:
            "QPSK125"
        case .thrbx:
            "THRBX"
        case let .unrecognized(raw):
            raw
        }
    }

    private static let membersByLowercasedValue: [String: ADIMode] = [
        "am": .am,
        "ardop": .ardop,
        "atv": .atv,
        "chip": .chip,
        "clo": .clo,
        "contesti": .contesti,
        "cw": .cw,
        "digitalvoice": .digitalvoice,
        "domino": .domino,
        "dynamic": .dynamicValue,
        "fax": .fax,
        "fm": .fm,
        "fsk441": .fsk441,
        "fsk": .fsk,
        "ft8": .ft8,
        "hell": .hell,
        "iscat": .iscat,
        "jt4": .jt4,
        "jt6m": .jt6m,
        "jt9": .jt9,
        "jt44": .jt44,
        "jt65": .jt65,
        "mfsk": .mfsk,
        "msk144": .msk144,
        "mtone": .mtone,
        "mt63": .mt63,
        "ofdm": .ofdm,
        "olivia": .olivia,
        "opera": .opera,
        "pac": .pac,
        "pax": .pax,
        "pkt": .pkt,
        "psk": .psk,
        "psk2k": .psk2k,
        "q15": .q15,
        "qra64": .qra64,
        "ros": .ros,
        "rtty": .rtty,
        "rttym": .rttym,
        "ssb": .ssb,
        "sstv": .sstv,
        "t10": .t10,
        "thor": .thor,
        "thrb": .thrb,
        "tor": .tor,
        "v4": .v4,
        "voi": .voi,
        "winmor": .winmor,
        "wspr": .wspr,
        "amtorfec": .amtorfec,
        "asci": .asci,
        "c4fm": .c4fm,
        "chip64": .chip64,
        "chip128": .chip128,
        "dominof": .dominof,
        "dstar": .dstar,
        "fmhell": .fmhell,
        "fsk31": .fsk31,
        "gtor": .gtor,
        "hell80": .hell80,
        "hfsk": .hfsk,
        "jt4a": .jt4a,
        "jt4b": .jt4b,
        "jt4c": .jt4c,
        "jt4d": .jt4d,
        "jt4e": .jt4e,
        "jt4f": .jt4f,
        "jt4g": .jt4g,
        "jt65a": .jt65a,
        "jt65b": .jt65b,
        "jt65c": .jt65c,
        "mfsk8": .mfsk8,
        "mfsk16": .mfsk16,
        "pac2": .pac2,
        "pac3": .pac3,
        "pax2": .pax2,
        "pcw": .pcw,
        "psk10": .psk10,
        "psk31": .psk31,
        "psk63": .psk63,
        "psk63f": .psk63f,
        "psk125": .psk125,
        "pskam10": .pskam10,
        "pskam31": .pskam31,
        "pskam50": .pskam50,
        "pskfec31": .pskfec31,
        "pskhell": .pskhell,
        "qpsk31": .qpsk31,
        "qpsk63": .qpsk63,
        "qpsk125": .qpsk125,
        "thrbx": .thrbx,
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
