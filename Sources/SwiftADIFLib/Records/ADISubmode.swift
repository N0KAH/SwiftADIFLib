/// The ADIF `Submode` enumeration.
///
/// - Note: See the specification's section III.B for the authoritative list of
///   submode values.
public enum ADISubmode: ADIEnumeration {
    ///
    /// Mode: PSK
    case submode8psk125
    ///
    /// Mode: PSK
    case submode8psk125f
    ///
    /// Mode: PSK
    case submode8psk125fl
    ///
    /// Mode: PSK
    case submode8psk250
    ///
    /// Mode: PSK
    case submode8psk250f
    ///
    /// Mode: PSK
    case submode8psk250fl
    ///
    /// Mode: PSK
    case submode8psk500
    ///
    /// Mode: PSK
    case submode8psk500f
    ///
    /// Mode: PSK
    case submode8psk1000
    ///
    /// Mode: PSK
    case submode8psk1000f
    ///
    /// Mode: PSK
    case submode8psk1200f
    ///
    /// Mode: TOR
    case amtorfec
    ///
    /// Mode: RTTY
    case asci
    ///
    /// Mode: DIGITALVOICE
    ///
    /// C4FM 4-level FSK See the Propagation_Mode enumeration section for examples
    /// of representing C4FM voice transmissions.
    case c4fm
    ///
    /// Mode: CHIP
    case chip64
    ///
    /// Mode: CHIP
    case chip128
    ///
    /// Mode: DIGITALVOICE
    ///
    /// Digital Mobile Radio See the Propagation_Mode enumeration section for
    /// examples of representing DMR voice transmissions.
    case dmr
    ///
    /// Mode: DOMINO
    case domM
    ///
    /// Mode: DOMINO
    case dom4
    ///
    /// Mode: DOMINO
    case dom5
    ///
    /// Mode: DOMINO
    case dom8
    ///
    /// Mode: DOMINO
    case dom11
    ///
    /// Mode: DOMINO
    case dom16
    ///
    /// Mode: DOMINO
    case dom22
    ///
    /// Mode: DOMINO
    case dom44
    ///
    /// Mode: DOMINO
    case dom88
    ///
    /// Mode: DOMINO
    case dominoex
    ///
    /// Mode: DOMINO
    case dominof
    ///
    /// Mode: DIGITALVOICE
    ///
    /// Digital Smart Technologies for Amateur Radio See the Propagation_Mode
    /// enumeration section for examples of representing DSTAR voice transmissions.
    case dstar
    ///
    /// Mode: HELL
    case fmhell
    ///
    /// Mode: DYNAMIC
    ///
    /// Data communications leveraging Codec2 HF modems
    case freedata
    ///
    /// Mode: DIGITALVOICE
    ///
    /// Digital voice mode for HF radio implemented with open source
    case freedv
    ///
    /// Mode: PSK
    case fsk31
    ///
    /// Mode: HELL
    case fskh105
    ///
    /// Mode: HELL
    case fskh245
    ///
    /// Mode: HELL
    case fskhell
    ///
    /// Mode: MFSK
    ///
    /// FSQCall protocol used with FSQ (Fast Simple QSO) transmission mode
    case fsqcall
    ///
    /// Mode: MFSK
    ///
    /// This is a digital mode supported by the WSJT-X software
    case fst4
    ///
    /// Mode: MFSK
    ///
    /// This is a digital mode supported by the WSJT-X software that is for
    /// quasi-beacon transmissions of WSPR-style messages
    case fst4w
    ///
    /// Mode: MFSK
    case ft2
    ///
    /// Mode: MFSK
    ///
    /// FT4 is a digital mode designed specifically for radio contesting
    case ft4
    ///
    /// Mode: TOR
    case gtor
    ///
    /// Mode: HELL
    case hell80
    ///
    /// Mode: HELL
    case hellx5
    ///
    /// Mode: HELL
    case hellx9
    ///
    /// Mode: HELL
    case hfsk
    ///
    /// Mode: ISCAT
    case iscatA
    ///
    /// Mode: ISCAT
    case iscatB
    ///
    /// Mode: MFSK
    ///
    /// Jordan Sherer designed 8-FSK modulation
    case js8
    ///
    /// Mode: JT4
    case jt4a
    ///
    /// Mode: JT4
    case jt4b
    ///
    /// Mode: JT4
    case jt4c
    ///
    /// Mode: JT4
    case jt4d
    ///
    /// Mode: JT4
    case jt4e
    ///
    /// Mode: JT4
    case jt4f
    ///
    /// Mode: JT4
    case jt4g
    ///
    /// Mode: JT9
    case jt91
    ///
    /// Mode: JT9
    case jt92
    ///
    /// Mode: JT9
    case jt95
    ///
    /// Mode: JT9
    case jt910
    ///
    /// Mode: JT9
    case jt930
    ///
    /// Mode: JT9
    case jt9a
    ///
    /// Mode: JT9
    case jt9b
    ///
    /// Mode: JT9
    case jt9c
    ///
    /// Mode: JT9
    case jt9d
    ///
    /// Mode: JT9
    case jt9e
    ///
    /// Mode: JT9
    case jt9eFast
    ///
    /// Mode: JT9
    case jt9f
    ///
    /// Mode: JT9
    case jt9fFast
    ///
    /// Mode: JT9
    case jt9g
    ///
    /// Mode: JT9
    case jt9gFast
    ///
    /// Mode: JT9
    case jt9h
    ///
    /// Mode: JT9
    case jt9hFast
    ///
    /// Mode: JT65
    case jt65a
    ///
    /// Mode: JT65
    case jt65b
    ///
    /// Mode: JT65
    case jt65b2
    ///
    /// Mode: JT65
    case jt65c
    ///
    /// Mode: JT65
    case jt65c2
    ///
    /// Mode: MFSK
    case jtms
    ///
    /// Mode: SSB
    ///
    /// Amplitude modulated voice telephony, lower-sideband, suppressed-carrier
    case lsb
    ///
    /// Mode: DIGITALVOICE
    ///
    /// Digital radio protocol using the Codec 2 voice encoder
    case m17
    ///
    /// Mode: MFSK
    case mfsk4
    ///
    /// Mode: MFSK
    case mfsk8
    ///
    /// Mode: MFSK
    case mfsk11
    ///
    /// Mode: MFSK
    case mfsk16
    ///
    /// Mode: MFSK
    case mfsk22
    ///
    /// Mode: MFSK
    case mfsk31
    ///
    /// Mode: MFSK
    case mfsk32
    ///
    /// Mode: MFSK
    case mfsk64
    ///
    /// Mode: MFSK
    case mfsk64l
    ///
    /// Mode: MFSK
    case mfsk128
    ///
    /// Mode: MFSK
    case mfsk128l
    ///
    /// Mode: TOR
    case navtex
    ///
    /// Mode: OLIVIA
    case olivia4125
    ///
    /// Mode: OLIVIA
    case olivia4250
    ///
    /// Mode: OLIVIA
    case olivia8250
    ///
    /// Mode: OLIVIA
    case olivia8500
    ///
    /// Mode: OLIVIA
    case olivia16500
    ///
    /// Mode: OLIVIA
    case olivia161000
    ///
    /// Mode: OLIVIA
    case olivia321000
    ///
    /// Mode: OPERA
    case operaBeacon
    ///
    /// Mode: OPERA
    case operaQso
    ///
    /// Mode: PAC
    case pac2
    ///
    /// Mode: PAC
    case pac3
    ///
    /// Mode: PAC
    case pac4
    ///
    /// Mode: PAX
    case pax2
    ///
    /// Mode: CW
    ///
    /// Coherent CW
    case pcw
    ///
    /// Mode: PSK
    case psk10
    ///
    /// Mode: PSK
    case psk31
    ///
    /// Mode: PSK
    case psk63
    ///
    /// Mode: PSK
    case psk63f
    ///
    /// Mode: PSK
    case psk63rc10
    ///
    /// Mode: PSK
    case psk63rc20
    ///
    /// Mode: PSK
    case psk63rc32
    ///
    /// Mode: PSK
    case psk63rc4
    ///
    /// Mode: PSK
    case psk63rc5
    ///
    /// Mode: PSK
    case psk125
    ///
    /// Mode: PSK
    case psk125rc10
    ///
    /// Mode: PSK
    case psk125rc12
    ///
    /// Mode: PSK
    case psk125rc16
    ///
    /// Mode: PSK
    case psk125rc4
    ///
    /// Mode: PSK
    case psk125rc5
    ///
    /// Mode: PSK
    case psk250
    ///
    /// Mode: PSK
    case psk250rc2
    ///
    /// Mode: PSK
    case psk250rc3
    ///
    /// Mode: PSK
    case psk250rc5
    ///
    /// Mode: PSK
    case psk250rc6
    ///
    /// Mode: PSK
    case psk250rc7
    ///
    /// Mode: PSK
    case psk500
    ///
    /// Mode: PSK
    case psk500rc2
    ///
    /// Mode: PSK
    case psk500rc3
    ///
    /// Mode: PSK
    case psk500rc4
    ///
    /// Mode: PSK
    case psk800rc2
    ///
    /// Mode: PSK
    case psk1000
    ///
    /// Mode: PSK
    case psk1000rc2
    ///
    /// Mode: PSK
    case pskam10
    ///
    /// Mode: PSK
    case pskam31
    ///
    /// Mode: PSK
    case pskam50
    ///
    /// Mode: PSK
    case pskfec31
    ///
    /// Mode: HELL
    case pskhell
    ///
    /// Mode: PSK
    case qpsk31
    ///
    /// Mode: MFSK
    case q65
    ///
    /// Mode: PSK
    case qpsk63
    ///
    /// Mode: PSK
    case qpsk125
    ///
    /// Mode: PSK
    case qpsk250
    ///
    /// Mode: PSK
    case qpsk500
    ///
    /// Mode: QRA64
    case qra64a
    ///
    /// Mode: QRA64
    case qra64b
    ///
    /// Mode: QRA64
    case qra64c
    ///
    /// Mode: QRA64
    case qra64d
    ///
    /// Mode: QRA64
    case qra64e
    ///
    /// Mode: OFDM
    ///
    /// Images transmitted using Ribbit
    case ribbitPix
    ///
    /// Mode: OFDM
    ///
    /// Short text messages transmitted using Ribbit
    case ribbitSms
    ///
    /// Mode: ROS
    case rosEme
    ///
    /// Mode: ROS
    case rosHf
    ///
    /// Mode: ROS
    case rosMf
    ///
    /// Mode: FSK
    ///
    /// SCAMP fast FSK
    case scampFast
    ///
    /// Mode: MTONE
    ///
    /// SCAMP single modulated tone on/off keying
    case scampOo
    ///
    /// Mode: MTONE
    ///
    /// SCAMP single modulated tone on/off slow keying
    case scampOoSlw
    ///
    /// Mode: FSK
    ///
    /// SCAMP slow FSK
    case scampSlow
    ///
    /// Mode: FSK
    ///
    /// SCAMP very slow FSK
    case scampVslow
    ///
    /// Mode: PSK
    case sim31
    ///
    /// Mode: TOR
    case sitorb
    ///
    /// Mode: HELL
    case slowhell
    ///
    /// Mode: THOR
    case thorM
    ///
    /// Mode: THOR
    case thor4
    ///
    /// Mode: THOR
    case thor5
    ///
    /// Mode: THOR
    case thor8
    ///
    /// Mode: THOR
    case thor11
    ///
    /// Mode: THOR
    case thor16
    ///
    /// Mode: THOR
    case thor22
    ///
    /// Mode: THOR
    case thor25x4
    ///
    /// Mode: THOR
    case thor50x1
    ///
    /// Mode: THOR
    case thor50x2
    ///
    /// Mode: THOR
    case thor100
    ///
    /// Mode: THRB
    case thrbx
    ///
    /// Mode: THRB
    case thrbx1
    ///
    /// Mode: THRB
    case thrbx2
    ///
    /// Mode: THRB
    case thrbx4
    ///
    /// Mode: THRB
    case throb1
    ///
    /// Mode: THRB
    case throb2
    ///
    /// Mode: THRB
    case throb4
    ///
    /// Mode: SSB
    ///
    /// Amplitude modulated voice telephony, upper-sideband, suppressed-carrier
    case usb
    ///
    /// Mode: DYNAMIC
    ///
    /// Channel adaptive high-speed modem for HF
    case varaHf
    ///
    /// Mode: DYNAMIC
    ///
    /// Channel adaptive high-speed modem for satellite operations
    case varaSatellite
    ///
    /// Mode: DYNAMIC
    ///
    /// Channel adaptive high-speed modem for FM transceivers
    case varaFm1200
    ///
    /// Mode: DYNAMIC
    ///
    /// Channel adaptive high-speed modem for FM transceivers
    case varaFm9600

    /// A value that this library does not recognize.
    ///
    /// - Important: This case exists so that unrecognized values survive a
    ///   parse-and-serialize round trip rather than being discarded.
    case unrecognized(String)

    /// Every value the specification defines for this enumeration, in
    /// specification order, excluding ``ADISubmode.unrecognized(_:)``.
    public static let allMembers: [ADISubmode] = [
        .submode8psk125,
        .submode8psk125f,
        .submode8psk125fl,
        .submode8psk250,
        .submode8psk250f,
        .submode8psk250fl,
        .submode8psk500,
        .submode8psk500f,
        .submode8psk1000,
        .submode8psk1000f,
        .submode8psk1200f,
        .amtorfec,
        .asci,
        .c4fm,
        .chip64,
        .chip128,
        .dmr,
        .domM,
        .dom4,
        .dom5,
        .dom8,
        .dom11,
        .dom16,
        .dom22,
        .dom44,
        .dom88,
        .dominoex,
        .dominof,
        .dstar,
        .fmhell,
        .freedata,
        .freedv,
        .fsk31,
        .fskh105,
        .fskh245,
        .fskhell,
        .fsqcall,
        .fst4,
        .fst4w,
        .ft2,
        .ft4,
        .gtor,
        .hell80,
        .hellx5,
        .hellx9,
        .hfsk,
        .iscatA,
        .iscatB,
        .js8,
        .jt4a,
        .jt4b,
        .jt4c,
        .jt4d,
        .jt4e,
        .jt4f,
        .jt4g,
        .jt91,
        .jt92,
        .jt95,
        .jt910,
        .jt930,
        .jt9a,
        .jt9b,
        .jt9c,
        .jt9d,
        .jt9e,
        .jt9eFast,
        .jt9f,
        .jt9fFast,
        .jt9g,
        .jt9gFast,
        .jt9h,
        .jt9hFast,
        .jt65a,
        .jt65b,
        .jt65b2,
        .jt65c,
        .jt65c2,
        .jtms,
        .lsb,
        .m17,
        .mfsk4,
        .mfsk8,
        .mfsk11,
        .mfsk16,
        .mfsk22,
        .mfsk31,
        .mfsk32,
        .mfsk64,
        .mfsk64l,
        .mfsk128,
        .mfsk128l,
        .navtex,
        .olivia4125,
        .olivia4250,
        .olivia8250,
        .olivia8500,
        .olivia16500,
        .olivia161000,
        .olivia321000,
        .operaBeacon,
        .operaQso,
        .pac2,
        .pac3,
        .pac4,
        .pax2,
        .pcw,
        .psk10,
        .psk31,
        .psk63,
        .psk63f,
        .psk63rc10,
        .psk63rc20,
        .psk63rc32,
        .psk63rc4,
        .psk63rc5,
        .psk125,
        .psk125rc10,
        .psk125rc12,
        .psk125rc16,
        .psk125rc4,
        .psk125rc5,
        .psk250,
        .psk250rc2,
        .psk250rc3,
        .psk250rc5,
        .psk250rc6,
        .psk250rc7,
        .psk500,
        .psk500rc2,
        .psk500rc3,
        .psk500rc4,
        .psk800rc2,
        .psk1000,
        .psk1000rc2,
        .pskam10,
        .pskam31,
        .pskam50,
        .pskfec31,
        .pskhell,
        .qpsk31,
        .q65,
        .qpsk63,
        .qpsk125,
        .qpsk250,
        .qpsk500,
        .qra64a,
        .qra64b,
        .qra64c,
        .qra64d,
        .qra64e,
        .ribbitPix,
        .ribbitSms,
        .rosEme,
        .rosHf,
        .rosMf,
        .scampFast,
        .scampOo,
        .scampOoSlw,
        .scampSlow,
        .scampVslow,
        .sim31,
        .sitorb,
        .slowhell,
        .thorM,
        .thor4,
        .thor5,
        .thor8,
        .thor11,
        .thor16,
        .thor22,
        .thor25x4,
        .thor50x1,
        .thor50x2,
        .thor100,
        .thrbx,
        .thrbx1,
        .thrbx2,
        .thrbx4,
        .throb1,
        .throb2,
        .throb4,
        .usb,
        .varaHf,
        .varaSatellite,
        .varaFm1200,
        .varaFm9600,
    ]

    /// The values the specification marks as import-only.
    ///
    /// - Note: Empty for enumerations that define no import-only values.
    public static let importOnlyMembers: Set<String> = []

    /// The value in the canonical form the specification uses.
    public var description: String {
        switch self {
        case .submode8psk125:
            "8PSK125"
        case .submode8psk125f:
            "8PSK125F"
        case .submode8psk125fl:
            "8PSK125FL"
        case .submode8psk250:
            "8PSK250"
        case .submode8psk250f:
            "8PSK250F"
        case .submode8psk250fl:
            "8PSK250FL"
        case .submode8psk500:
            "8PSK500"
        case .submode8psk500f:
            "8PSK500F"
        case .submode8psk1000:
            "8PSK1000"
        case .submode8psk1000f:
            "8PSK1000F"
        case .submode8psk1200f:
            "8PSK1200F"
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
        case .dmr:
            "DMR"
        case .domM:
            "DOM-M"
        case .dom4:
            "DOM4"
        case .dom5:
            "DOM5"
        case .dom8:
            "DOM8"
        case .dom11:
            "DOM11"
        case .dom16:
            "DOM16"
        case .dom22:
            "DOM22"
        case .dom44:
            "DOM44"
        case .dom88:
            "DOM88"
        case .dominoex:
            "DOMINOEX"
        case .dominof:
            "DOMINOF"
        case .dstar:
            "DSTAR"
        case .fmhell:
            "FMHELL"
        case .freedata:
            "FREEDATA"
        case .freedv:
            "FREEDV"
        case .fsk31:
            "FSK31"
        case .fskh105:
            "FSKH105"
        case .fskh245:
            "FSKH245"
        case .fskhell:
            "FSKHELL"
        case .fsqcall:
            "FSQCALL"
        case .fst4:
            "FST4"
        case .fst4w:
            "FST4W"
        case .ft2:
            "FT2"
        case .ft4:
            "FT4"
        case .gtor:
            "GTOR"
        case .hell80:
            "HELL80"
        case .hellx5:
            "HELLX5"
        case .hellx9:
            "HELLX9"
        case .hfsk:
            "HFSK"
        case .iscatA:
            "ISCAT-A"
        case .iscatB:
            "ISCAT-B"
        case .js8:
            "JS8"
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
        case .jt91:
            "JT9-1"
        case .jt92:
            "JT9-2"
        case .jt95:
            "JT9-5"
        case .jt910:
            "JT9-10"
        case .jt930:
            "JT9-30"
        case .jt9a:
            "JT9A"
        case .jt9b:
            "JT9B"
        case .jt9c:
            "JT9C"
        case .jt9d:
            "JT9D"
        case .jt9e:
            "JT9E"
        case .jt9eFast:
            "JT9E FAST"
        case .jt9f:
            "JT9F"
        case .jt9fFast:
            "JT9F FAST"
        case .jt9g:
            "JT9G"
        case .jt9gFast:
            "JT9G FAST"
        case .jt9h:
            "JT9H"
        case .jt9hFast:
            "JT9H FAST"
        case .jt65a:
            "JT65A"
        case .jt65b:
            "JT65B"
        case .jt65b2:
            "JT65B2"
        case .jt65c:
            "JT65C"
        case .jt65c2:
            "JT65C2"
        case .jtms:
            "JTMS"
        case .lsb:
            "LSB"
        case .m17:
            "M17"
        case .mfsk4:
            "MFSK4"
        case .mfsk8:
            "MFSK8"
        case .mfsk11:
            "MFSK11"
        case .mfsk16:
            "MFSK16"
        case .mfsk22:
            "MFSK22"
        case .mfsk31:
            "MFSK31"
        case .mfsk32:
            "MFSK32"
        case .mfsk64:
            "MFSK64"
        case .mfsk64l:
            "MFSK64L"
        case .mfsk128:
            "MFSK128"
        case .mfsk128l:
            "MFSK128L"
        case .navtex:
            "NAVTEX"
        case .olivia4125:
            "OLIVIA 4/125"
        case .olivia4250:
            "OLIVIA 4/250"
        case .olivia8250:
            "OLIVIA 8/250"
        case .olivia8500:
            "OLIVIA 8/500"
        case .olivia16500:
            "OLIVIA 16/500"
        case .olivia161000:
            "OLIVIA 16/1000"
        case .olivia321000:
            "OLIVIA 32/1000"
        case .operaBeacon:
            "OPERA-BEACON"
        case .operaQso:
            "OPERA-QSO"
        case .pac2:
            "PAC2"
        case .pac3:
            "PAC3"
        case .pac4:
            "PAC4"
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
        case .psk63rc10:
            "PSK63RC10"
        case .psk63rc20:
            "PSK63RC20"
        case .psk63rc32:
            "PSK63RC32"
        case .psk63rc4:
            "PSK63RC4"
        case .psk63rc5:
            "PSK63RC5"
        case .psk125:
            "PSK125"
        case .psk125rc10:
            "PSK125RC10"
        case .psk125rc12:
            "PSK125RC12"
        case .psk125rc16:
            "PSK125RC16"
        case .psk125rc4:
            "PSK125RC4"
        case .psk125rc5:
            "PSK125RC5"
        case .psk250:
            "PSK250"
        case .psk250rc2:
            "PSK250RC2"
        case .psk250rc3:
            "PSK250RC3"
        case .psk250rc5:
            "PSK250RC5"
        case .psk250rc6:
            "PSK250RC6"
        case .psk250rc7:
            "PSK250RC7"
        case .psk500:
            "PSK500"
        case .psk500rc2:
            "PSK500RC2"
        case .psk500rc3:
            "PSK500RC3"
        case .psk500rc4:
            "PSK500RC4"
        case .psk800rc2:
            "PSK800RC2"
        case .psk1000:
            "PSK1000"
        case .psk1000rc2:
            "PSK1000RC2"
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
        case .q65:
            "Q65"
        case .qpsk63:
            "QPSK63"
        case .qpsk125:
            "QPSK125"
        case .qpsk250:
            "QPSK250"
        case .qpsk500:
            "QPSK500"
        case .qra64a:
            "QRA64A"
        case .qra64b:
            "QRA64B"
        case .qra64c:
            "QRA64C"
        case .qra64d:
            "QRA64D"
        case .qra64e:
            "QRA64E"
        case .ribbitPix:
            "RIBBIT_PIX"
        case .ribbitSms:
            "RIBBIT_SMS"
        case .rosEme:
            "ROS-EME"
        case .rosHf:
            "ROS-HF"
        case .rosMf:
            "ROS-MF"
        case .scampFast:
            "SCAMP_FAST"
        case .scampOo:
            "SCAMP_OO"
        case .scampOoSlw:
            "SCAMP_OO_SLW"
        case .scampSlow:
            "SCAMP_SLOW"
        case .scampVslow:
            "SCAMP_VSLOW"
        case .sim31:
            "SIM31"
        case .sitorb:
            "SITORB"
        case .slowhell:
            "SLOWHELL"
        case .thorM:
            "THOR-M"
        case .thor4:
            "THOR4"
        case .thor5:
            "THOR5"
        case .thor8:
            "THOR8"
        case .thor11:
            "THOR11"
        case .thor16:
            "THOR16"
        case .thor22:
            "THOR22"
        case .thor25x4:
            "THOR25X4"
        case .thor50x1:
            "THOR50X1"
        case .thor50x2:
            "THOR50X2"
        case .thor100:
            "THOR100"
        case .thrbx:
            "THRBX"
        case .thrbx1:
            "THRBX1"
        case .thrbx2:
            "THRBX2"
        case .thrbx4:
            "THRBX4"
        case .throb1:
            "THROB1"
        case .throb2:
            "THROB2"
        case .throb4:
            "THROB4"
        case .usb:
            "USB"
        case .varaHf:
            "VARA HF"
        case .varaSatellite:
            "VARA SATELLITE"
        case .varaFm1200:
            "VARA FM 1200"
        case .varaFm9600:
            "VARA FM 9600"
        case let .unrecognized(raw):
            raw
        }
    }

    private static let membersByLowercasedValue: [String: ADISubmode] = [
        "8psk125": .submode8psk125,
        "8psk125f": .submode8psk125f,
        "8psk125fl": .submode8psk125fl,
        "8psk250": .submode8psk250,
        "8psk250f": .submode8psk250f,
        "8psk250fl": .submode8psk250fl,
        "8psk500": .submode8psk500,
        "8psk500f": .submode8psk500f,
        "8psk1000": .submode8psk1000,
        "8psk1000f": .submode8psk1000f,
        "8psk1200f": .submode8psk1200f,
        "amtorfec": .amtorfec,
        "asci": .asci,
        "c4fm": .c4fm,
        "chip64": .chip64,
        "chip128": .chip128,
        "dmr": .dmr,
        "dom-m": .domM,
        "dom4": .dom4,
        "dom5": .dom5,
        "dom8": .dom8,
        "dom11": .dom11,
        "dom16": .dom16,
        "dom22": .dom22,
        "dom44": .dom44,
        "dom88": .dom88,
        "dominoex": .dominoex,
        "dominof": .dominof,
        "dstar": .dstar,
        "fmhell": .fmhell,
        "freedata": .freedata,
        "freedv": .freedv,
        "fsk31": .fsk31,
        "fskh105": .fskh105,
        "fskh245": .fskh245,
        "fskhell": .fskhell,
        "fsqcall": .fsqcall,
        "fst4": .fst4,
        "fst4w": .fst4w,
        "ft2": .ft2,
        "ft4": .ft4,
        "gtor": .gtor,
        "hell80": .hell80,
        "hellx5": .hellx5,
        "hellx9": .hellx9,
        "hfsk": .hfsk,
        "iscat-a": .iscatA,
        "iscat-b": .iscatB,
        "js8": .js8,
        "jt4a": .jt4a,
        "jt4b": .jt4b,
        "jt4c": .jt4c,
        "jt4d": .jt4d,
        "jt4e": .jt4e,
        "jt4f": .jt4f,
        "jt4g": .jt4g,
        "jt9-1": .jt91,
        "jt9-2": .jt92,
        "jt9-5": .jt95,
        "jt9-10": .jt910,
        "jt9-30": .jt930,
        "jt9a": .jt9a,
        "jt9b": .jt9b,
        "jt9c": .jt9c,
        "jt9d": .jt9d,
        "jt9e": .jt9e,
        "jt9e fast": .jt9eFast,
        "jt9f": .jt9f,
        "jt9f fast": .jt9fFast,
        "jt9g": .jt9g,
        "jt9g fast": .jt9gFast,
        "jt9h": .jt9h,
        "jt9h fast": .jt9hFast,
        "jt65a": .jt65a,
        "jt65b": .jt65b,
        "jt65b2": .jt65b2,
        "jt65c": .jt65c,
        "jt65c2": .jt65c2,
        "jtms": .jtms,
        "lsb": .lsb,
        "m17": .m17,
        "mfsk4": .mfsk4,
        "mfsk8": .mfsk8,
        "mfsk11": .mfsk11,
        "mfsk16": .mfsk16,
        "mfsk22": .mfsk22,
        "mfsk31": .mfsk31,
        "mfsk32": .mfsk32,
        "mfsk64": .mfsk64,
        "mfsk64l": .mfsk64l,
        "mfsk128": .mfsk128,
        "mfsk128l": .mfsk128l,
        "navtex": .navtex,
        "olivia 4/125": .olivia4125,
        "olivia 4/250": .olivia4250,
        "olivia 8/250": .olivia8250,
        "olivia 8/500": .olivia8500,
        "olivia 16/500": .olivia16500,
        "olivia 16/1000": .olivia161000,
        "olivia 32/1000": .olivia321000,
        "opera-beacon": .operaBeacon,
        "opera-qso": .operaQso,
        "pac2": .pac2,
        "pac3": .pac3,
        "pac4": .pac4,
        "pax2": .pax2,
        "pcw": .pcw,
        "psk10": .psk10,
        "psk31": .psk31,
        "psk63": .psk63,
        "psk63f": .psk63f,
        "psk63rc10": .psk63rc10,
        "psk63rc20": .psk63rc20,
        "psk63rc32": .psk63rc32,
        "psk63rc4": .psk63rc4,
        "psk63rc5": .psk63rc5,
        "psk125": .psk125,
        "psk125rc10": .psk125rc10,
        "psk125rc12": .psk125rc12,
        "psk125rc16": .psk125rc16,
        "psk125rc4": .psk125rc4,
        "psk125rc5": .psk125rc5,
        "psk250": .psk250,
        "psk250rc2": .psk250rc2,
        "psk250rc3": .psk250rc3,
        "psk250rc5": .psk250rc5,
        "psk250rc6": .psk250rc6,
        "psk250rc7": .psk250rc7,
        "psk500": .psk500,
        "psk500rc2": .psk500rc2,
        "psk500rc3": .psk500rc3,
        "psk500rc4": .psk500rc4,
        "psk800rc2": .psk800rc2,
        "psk1000": .psk1000,
        "psk1000rc2": .psk1000rc2,
        "pskam10": .pskam10,
        "pskam31": .pskam31,
        "pskam50": .pskam50,
        "pskfec31": .pskfec31,
        "pskhell": .pskhell,
        "qpsk31": .qpsk31,
        "q65": .q65,
        "qpsk63": .qpsk63,
        "qpsk125": .qpsk125,
        "qpsk250": .qpsk250,
        "qpsk500": .qpsk500,
        "qra64a": .qra64a,
        "qra64b": .qra64b,
        "qra64c": .qra64c,
        "qra64d": .qra64d,
        "qra64e": .qra64e,
        "ribbit_pix": .ribbitPix,
        "ribbit_sms": .ribbitSms,
        "ros-eme": .rosEme,
        "ros-hf": .rosHf,
        "ros-mf": .rosMf,
        "scamp_fast": .scampFast,
        "scamp_oo": .scampOo,
        "scamp_oo_slw": .scampOoSlw,
        "scamp_slow": .scampSlow,
        "scamp_vslow": .scampVslow,
        "sim31": .sim31,
        "sitorb": .sitorb,
        "slowhell": .slowhell,
        "thor-m": .thorM,
        "thor4": .thor4,
        "thor5": .thor5,
        "thor8": .thor8,
        "thor11": .thor11,
        "thor16": .thor16,
        "thor22": .thor22,
        "thor25x4": .thor25x4,
        "thor50x1": .thor50x1,
        "thor50x2": .thor50x2,
        "thor100": .thor100,
        "thrbx": .thrbx,
        "thrbx1": .thrbx1,
        "thrbx2": .thrbx2,
        "thrbx4": .thrbx4,
        "throb1": .throb1,
        "throb2": .throb2,
        "throb4": .throb4,
        "usb": .usb,
        "vara hf": .varaHf,
        "vara satellite": .varaSatellite,
        "vara fm 1200": .varaFm1200,
        "vara fm 9600": .varaFm9600,
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
