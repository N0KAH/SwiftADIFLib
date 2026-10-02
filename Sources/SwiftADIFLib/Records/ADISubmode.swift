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
    ///
    /// Mode: String
    ///
    /// Identifies the version of ADIF used in this file in the format X.Y.Z where ●
    /// X is an integer designating the ADIF epoch. ● Y is an integer between 0 and
    /// 9 designating the major version. ● Z is an integer between 0 and 9
    /// designating the minor version.
    case adifVer
    ///
    /// Mode: String
    ///
    /// Identifies the UTC date and time that the file was created in the format of
    /// 15 characters YYYYMMDD HHMMSS where YYYYMMDD is a Date data type. HHMMSS is
    /// a 6 character Time data type.
    case createdTimestamp
    ///
    /// Mode: String
    ///
    /// Identifies the name of the logger, converter, or utility that created or
    /// processed this ADIF content. To help avoid name clashes, the ADIF PROGRAMID
    /// Register provides a voluntary list of PROGRAMID values.
    case programid
    ///
    /// Mode: String
    ///
    /// Identifies the version of the logger, converter, or utility that created or
    /// processed this ADIF file.
    case programversion
    ///
    /// Mode: String
    ///
    /// Specifies the name and optional enumeration or range of the nth user-defined
    /// field, where n is a positive integer. The name of a user-defined field may
    /// not ● be an ADIF Field name. ● contain ○ a comma. ○ a colon. ○ an
    /// open-angle-bracket or close-angle-bracket character. ○ an open-curly-bracket
    /// or close-curly-bracket character. ● begin or end with a space character.
    case userdefn
    ///
    /// Mode: MultilineString
    ///
    /// the contacted station's complete mailing address: full name, street address,
    /// city, postal code, and country
    case address
    ///
    /// Mode: IntlMultilineString
    ///
    /// the contacted station's complete mailing address: full name, street address,
    /// city, postal code, and country
    case addressIntl
    ///
    /// Mode: Number
    ///
    /// the contacted station's operator's age in years in the range 0 to 120
    /// (inclusive)
    case age
    ///
    /// Mode: Number
    ///
    /// the height of the contacted station in meters relative to Mean Sea Level
    /// (MSL). For example 1.5 km is <ALTITUDE:4>1500 and 10.5 m is <ALTITUDE:4>10.5
    case altitude
    ///
    /// Mode: Number
    ///
    /// the logging station's antenna azimuth, in degrees with a value between 0 to
    /// 360 (inclusive). Values outside this range are import-only and must be
    /// normalized for export (e.g. 370 is exported as 10). True north is 0 degrees
    /// with values increasing in a clockwise direction.
    case antAz
    ///
    /// Mode: Number
    ///
    /// the logging station's antenna elevation, in degrees with a value between -90
    /// to 90 (inclusive). Values outside this range are import-only and must be
    /// normalized for export (e.g. 100 is exported as 80). The horizon is 0 degrees
    /// with values increasing as the angle moves in an upward direction.
    case antEl
    ///
    /// Mode: Enumeration
    ///
    /// the signal path
    case antPath
    ///
    /// Mode: Enumeration
    ///
    /// ARRL Section
    ///
    /// the contacted station's ARRL section
    case arrlSect
    ///
    /// Mode: SponsoredAwardList
    ///
    /// Sponsored Award
    ///
    /// the list of awards submitted to a sponsor. note that this field might not be
    /// used in a QSO record. It might be used to convey information about a user's
    /// "Award Account" between an award sponsor and the user. For example, AA6YQ
    /// might submit a request for awards by sending the following: <CALL:5>AA6YQ
    /// <AWARD_SUBMITTED:64>ADIF_CENTURY_BASIC,ADIF_CENTURY_SILVER,ADIF_SPECTRUM_100-160m
    case awardSubmitted
    ///
    /// Mode: SponsoredAwardList
    ///
    /// Sponsored Award
    ///
    /// the list of awards granted by a sponsor. note that this field might not be
    /// used in a QSO record. It might be used to convey information about a user's
    /// "Award Account" between an award sponsor and the user. For example, in
    /// response to a request "send me a list of the awards granted to AA6YQ", this
    /// might be received: <CALL:5>AA6YQ
    /// <AWARD_GRANTED:64>ADIF_CENTURY_BASIC,ADIF_CENTURY_SILVER,ADIF_SPECTRUM_100-160m
    case awardGranted
    ///
    /// Mode: Number
    ///
    /// the geomagnetic A index at the time of the QSO in the range 0 to 400
    /// (inclusive)
    case aIndex
    ///
    /// Mode: Enumeration
    ///
    /// QSO Band
    case band
    ///
    /// Mode: Enumeration
    ///
    /// Band
    ///
    /// in a split frequency QSO, the logging station's receiving band
    case bandRx
    ///
    /// Mode: String
    ///
    /// the contacted station's callsign
    case call
    ///
    /// Mode: String
    ///
    /// contest check (e.g. for ARRL Sweepstakes)
    case check
    ///
    /// Mode: String
    ///
    /// contest class (e.g. for ARRL Field Day)
    case classValue
    ///
    /// Mode: Date
    ///
    /// the date the QSO was last uploaded to the Club Log online service
    case clublogQsoUploadDate
    ///
    /// Mode: Enumeration
    ///
    /// QSO Upload Status
    ///
    /// the upload status of the QSO on the Club Log online service
    case clublogQsoUploadStatus
    ///
    /// Mode: Enumeration
    ///
    /// (Secondary Administrative Subdivision, function of DXCC field's value)
    ///
    /// the contacted station's Secondary Administrative Subdivision (e.g. US
    /// county, JA Gun), in the specified format
    case cnty
    ///
    /// Mode: SecondaryAdministrativeSubdivisionListAlt
    ///
    /// a semicolon (;) delimited, unordered list of Secondary Administrative
    /// Subdivision Alt codes for the contacted station See the Data Type for
    /// details.
    case cntyAlt
    ///
    /// Mode: String
    ///
    /// comment field for QSO for a message to be incorporated in a paper or
    /// electronic QSL for the contacted station's operator, use the QSLMSG field
    /// recommended use: information of interest to the contacted station's operator
    case comment
    ///
    /// Mode: IntlString
    ///
    /// comment field for QSO for a message to be incorporated in a paper or
    /// electronic QSL for the contacted station's operator, use the QSLMSG_INTL
    /// field recommended use: information of interest to the contacted station's
    /// operator
    case commentIntl
    ///
    /// Mode: Enumeration
    ///
    /// Continent
    ///
    /// the contacted station's Continent
    case cont
    ///
    /// Mode: String
    ///
    /// the callsign of the individual operating the contacted station
    case contactedOp
    ///
    /// Mode: String
    ///
    /// QSO Contest Identifier use enumeration values for interoperability
    case contestId
    ///
    /// Mode: String
    ///
    /// the contacted station's DXCC entity name
    case country
    ///
    /// Mode: IntlString
    ///
    /// the contacted station's DXCC entity name
    case countryIntl
    ///
    /// Mode: PositiveInteger
    ///
    /// the contacted station's CQ Zone in the range 1 to 40 (inclusive)
    case cqz
    ///
    /// Mode: CreditList AwardList (import-only)
    ///
    /// Credit Award (import-only)
    ///
    /// the list of credits sought for this QSO Use of data type AwardList and
    /// enumeration Award are import-only
    case creditSubmitted
    ///
    /// Mode: CreditList AwardList (import-only)
    ///
    /// Credit Award (import-only)
    ///
    /// the list of credits granted to this QSO Use of data type AwardList and
    /// enumeration Award are import-only
    case creditGranted
    ///
    /// Mode: Enumeration
    ///
    /// (DOKs and Special DOKs listed on the DARC website)
    ///
    /// the contacted station's DARC DOK (District Location Code) A DOK comprises
    /// letters and numbers, e.g. <DARC_DOK:3>A01 Note that DARC provides two
    /// different lists - one for DOKs and one for Special DOKs.
    case darcDok
    ///
    /// Mode: Date
    ///
    /// date QSL received from DCL (only valid if DCL_QSL_RCVD is Y, I, or V)(V
    /// import-only)
    case dclQslrdate
    ///
    /// Mode: Date
    ///
    /// date QSL sent to DCL (only valid if DCL_QSL_SENT is Y, Q, or I)
    case dclQslsdate
    ///
    /// Mode: Enumeration
    ///
    /// QSL Rcvd
    ///
    /// DCL QSL received status Default Value: N
    case dclQslRcvd
    ///
    /// Mode: Enumeration
    ///
    /// QSL Sent
    ///
    /// DCL QSL sent status Default Value: N
    case dclQslSent
    ///
    /// Mode: Number
    ///
    /// the distance between the logging station and the contacted station in
    /// kilometers via the specified signal path with a value greater than or equal
    /// to 0
    case distance
    ///
    /// Mode: Enumeration
    ///
    /// DXCC Entity Code
    ///
    /// the contacted station's DXCC Entity Code <DXCC:1>0 means that the contacted
    /// station is known not to be within a DXCC entity.
    case dxcc
    ///
    /// Mode: String
    ///
    /// the contacted station's email address
    case email
    ///
    /// Mode: String
    ///
    /// the contacted station's owner's callsign
    case eqCall
    ///
    /// Mode: Enumeration
    ///
    /// indicates whether the QSO is known to be "Authenticity Guaranteed" by eQSL
    /// Default value: U
    case eqslAg
    ///
    /// Mode: Date
    ///
    /// date QSL received from eQSL.cc (only valid if EQSL_QSL_RCVD is Y, I, or V)(V
    /// import-only)
    case eqslQslrdate
    ///
    /// Mode: Date
    ///
    /// date QSL sent to eQSL.cc (only valid if EQSL_QSL_SENT is Y, Q, or I)
    case eqslQslsdate
    ///
    /// Mode: Enumeration
    ///
    /// QSL Rcvd
    ///
    /// eQSL.cc QSL received status instead of V (import-only) use
    /// <CREDIT_GRANTED:42>CQWAZ:eqsl,CQWAZ_BAND:eqsl,CQWAZ_MODE:eqsl Default Value:
    /// N
    case eqslQslRcvd
    ///
    /// Mode: Enumeration
    ///
    /// QSL Sent
    ///
    /// eQSL.cc QSL sent status Default Value: N
    case eqslQslSent
    ///
    /// Mode: PositiveInteger
    ///
    /// the contacted station's FISTS CW Club member number with a value greater
    /// than 0.
    case fists
    ///
    /// Mode: PositiveInteger
    ///
    /// the contacted station's FISTS CW Club Century Certificate (CC) number with a
    /// value greater than 0.
    case fistsCc
    ///
    /// Mode: Boolean
    ///
    /// new EME "initial"
    case forceInit
    ///
    /// Mode: Number
    ///
    /// QSO frequency in Megahertz
    case freq
    ///
    /// Mode: Number
    ///
    /// in a split frequency QSO, the logging station's receiving frequency in
    /// Megahertz
    case freqRx
    ///
    /// Mode: GridSquare
    ///
    /// the contacted station's 2-character, 4-character, 6-character, or
    /// 8-character Maidenhead Grid Square For 10 or 12 character locators, store
    /// the first 8 characters in GRIDSQUARE and the additional 2 or 4 characters in
    /// the GRIDSQUARE_EXT field
    case gridsquare
    ///
    /// Mode: GridSquareExt
    ///
    /// for a contacted station's 10-character Maidenhead locator, supplements the
    /// GRIDSQUARE field by containing characters 9 and 10. For a contacted
    /// station's 12-character Maidenhead locator, supplements the GRIDSQUARE field
    /// by containing characters 9, 10, 11 and 12. Characters 9 and 10 are
    /// case-insensitive ASCII letters in the range A-X. Characters 11 and 12 are
    /// Digits in the range 0 to 9. On export, the field length must be 2 or 4. On
    /// import, if the field length is greater than 4, the additional characters
    /// must be ignored. Example of exporting the 10-character locator FN01MH42BQ:
    /// <GRIDSQUARE:8>FN01MH42 <GRIDSQUARE_EXT:2>BQ
    case gridsquareExt
    ///
    /// Mode: String
    ///
    /// import-only: use OPERATOR instead
    case guestOp
    ///
    /// Mode: Date
    ///
    /// the date the QSO was last uploaded to the HAMLOG.EU online service
    case hamlogeuQsoUploadDate
    ///
    /// Mode: Enumeration
    ///
    /// QSO Upload Status
    ///
    /// the upload status of the QSO on the HAMLOG.EU online service
    case hamlogeuQsoUploadStatus
    ///
    /// Mode: Date
    ///
    /// the date the QSO was last uploaded to the HamQTH.com online service
    case hamqthQsoUploadDate
    ///
    /// Mode: Enumeration
    ///
    /// QSO Upload Status
    ///
    /// the upload status of the QSO on the HamQTH.com online service
    case hamqthQsoUploadStatus
    ///
    /// Mode: Date
    ///
    /// the date the QSO was last uploaded to the HRDLog.net online service
    case hrdlogQsoUploadDate
    ///
    /// Mode: Enumeration
    ///
    /// QSO Upload Status
    ///
    /// the upload status of the QSO on the HRDLog.net online service
    case hrdlogQsoUploadStatus
    ///
    /// Mode: IOTARefNo
    ///
    /// the contacted station's IOTA designator, in format CC-XXX, where CC is a
    /// member of the Continent enumeration XXX is the island group designator,
    /// where 1 <= XXX <= 999 [use leading zeroes]
    case iota
    ///
    /// Mode: PositiveInteger
    ///
    /// the contacted station's IOTA Island Identifier, an 8-digit integer in the
    /// range 1 to 99999999 [leading zeroes optional]
    case iotaIslandId
    ///
    /// Mode: PositiveInteger
    ///
    /// the contacted station's ITU zone in the range 1 to 90 (inclusive)
    case ituz
    ///
    /// Mode: Integer
    ///
    /// the geomagnetic K index at the time of the QSO in the range 0 to 9
    /// (inclusive)
    case kIndex
    ///
    /// Mode: Location
    ///
    /// the contacted station's latitude
    case lat
    ///
    /// Mode: Location
    ///
    /// the contacted station's longitude
    case lon
    ///
    /// Mode: Date
    ///
    /// date QSL received from ARRL Logbook of the World (only valid if
    /// LOTW_QSL_RCVD is Y, I, or V)(V import-only)
    case lotwQslrdate
    ///
    /// Mode: Date
    ///
    /// date QSL sent to ARRL Logbook of the World (only valid if LOTW_QSL_SENT is
    /// Y, Q, or I)
    case lotwQslsdate
    ///
    /// Mode: Enumeration
    ///
    /// QSL Rcvd
    ///
    /// ARRL Logbook of the World QSL received status instead of V (import-only) use
    /// <CREDIT_GRANTED:39>DXCC:lotw,DXCC_BAND:lotw,DXCC_MODE:lotw Default Value: N
    case lotwQslRcvd
    ///
    /// Mode: Enumeration
    ///
    /// QSL Sent
    ///
    /// ARRL Logbook of the World QSL sent status Default Value: N
    case lotwQslSent
    ///
    /// Mode: Number
    ///
    /// maximum length of meteor scatter bursts heard by the logging station, in
    /// seconds with a value greater than or equal to 0
    case maxBursts
    ///
    /// Mode: Enumeration
    ///
    /// QSO Mode
    case mode
    ///
    /// Mode: String
    ///
    /// details of the contacted station's Morse key (e.g. make, model, etc).
    /// Example: <MORSE_KEY_INFO:16>Begali Sculpture
    case morseKeyInfo
    ///
    /// Mode: Enumeration
    ///
    /// the contacted station's Morse key type (e.g. straight key, bug, etc).
    /// Example for a dual-lever paddle: <MORSE_KEY_TYPE:2>DP
    case morseKeyType
    ///
    /// Mode: String
    ///
    /// For Meteor Scatter QSOs, the name of the meteor shower in progress
    case msShower
    ///
    /// Mode: Number
    ///
    /// the height of the logging station in meters relative to Mean Sea Level
    /// (MSL). For example 1.5 km is <MY_ALTITUDE:4>1500 and 10.5 m is
    /// <MY_ALTITUDE:4>10.5
    case myAltitude
    ///
    /// Mode: String
    ///
    /// the logging station's antenna
    case myAntenna
    ///
    /// Mode: IntlString
    ///
    /// the logging station's antenna
    case myAntennaIntl
    ///
    /// Mode: Enumeration
    ///
    /// ARRL Section
    ///
    /// the logging station's ARRL section
    case myArrlSect
    ///
    /// Mode: String
    ///
    /// the logging station's city
    case myCity
    ///
    /// Mode: IntlString
    ///
    /// the logging station's city
    case myCityIntl
    ///
    /// Mode: Enumeration
    ///
    /// (Secondary Administrative Subdivision, function of MY_DXCC field's value)
    ///
    /// the logging station's Secondary Administrative Subdivision (e.g. US county,
    /// JA Gun), in the specified format
    case myCnty
    ///
    /// Mode: SecondaryAdministrativeSubdivisionListAlt
    ///
    /// a semicolon (;) delimited, unordered list of Secondary Administrative
    /// Subdivision Alt codes for the logging station See the Data Type for details.
    case myCntyAlt
    ///
    /// Mode: String
    ///
    /// Country
    ///
    /// the logging station's DXCC entity name
    case myCountry
    ///
    /// Mode: IntlString
    ///
    /// Country
    ///
    /// the logging station's DXCC entity name
    case myCountryIntl
    ///
    /// Mode: PositiveInteger
    ///
    /// the logging station's CQ Zone in the range 1 to 40 (inclusive)
    case myCqZone
    ///
    /// Mode: Enumeration
    ///
    /// (DOKs and Special DOKs listed on the DARC website)
    ///
    /// the logging station's DARC DOK (District Location Code) A DOK comprises
    /// letters and numbers, e.g. <MY_DARC_DOK:3>A01 Note that DARC provides two
    /// different lists - one for DOKs and one for Special DOKs.
    case myDarcDok
    ///
    /// Mode: Enumeration
    ///
    /// DXCC Entity Code
    ///
    /// the logging station's DXCC Entity Code <MY_DXCC:1>0 means that the logging
    /// station is known not to be within a DXCC entity.
    case myDxcc
    ///
    /// Mode: PositiveInteger
    ///
    /// the logging station's FISTS CW Club member number with a value greater than
    /// 0.
    case myFists
    ///
    /// Mode: GridSquare
    ///
    /// the logging station's 2-character, 4-character, 6-character, or 8-character
    /// Maidenhead Grid Square For 10 or 12 character locators, store the first 8
    /// characters in MY_GRIDSQUARE and the additional 2 or 4 characters in the
    /// MY_GRIDSQUARE_EXT field
    case myGridsquare
    ///
    /// Mode: GridSquareExt
    ///
    /// for a logging station's 10-character Maidenhead locator, supplements the
    /// MY_GRIDSQUARE field by containing characters 9 and 10. For a logging
    /// station's 12-character Maidenhead locator, supplements the MY_GRIDSQUARE
    /// field by containing characters 9, 10, 11 and 12. Characters 9 and 10 are
    /// case-insensitive ASCII letters in the range A-X. Characters 11 and 12 are
    /// Digits in the range 0 to 9. On export, the field length must be 2 or 4. On
    /// import, if the field length is greater than 4, the additional characters
    /// must be ignored. Example of exporting the 10-character locator FN01MH42BQ:
    /// <MY_GRIDSQUARE:8>FN01MH42 <MY_GRIDSQUARE_EXT:2>BQ
    case myGridsquareExt
    ///
    /// Mode: IOTARefNo
    ///
    /// the logging station's IOTA designator, in format CC-XXX, where CC is a
    /// member of the Continent enumeration XXX is the island group designator,
    /// where 1 <= XXX <= 999 [use leading zeroes]
    case myIota
    ///
    /// Mode: PositiveInteger
    ///
    /// the logging station's IOTA Island Identifier, an 8-digit integer in the
    /// range 1 to 99999999 [leading zeroes optional]
    case myIotaIslandId
    ///
    /// Mode: PositiveInteger
    ///
    /// the logging station's ITU zone in the range 1 to 90 (inclusive)
    case myItuZone
    ///
    /// Mode: Location
    ///
    /// the logging station's latitude
    case myLat
    ///
    /// Mode: Location
    ///
    /// the logging station's longitude
    case myLon
    ///
    /// Mode: String
    ///
    /// details of the logging station's Morse key (e.g. make, model, etc). Example:
    /// <MY_MORSE_KEY_INFO:16>Begali Sculpture
    case myMorseKeyInfo
    ///
    /// Mode: Enumeration
    ///
    /// Morse Key Type
    ///
    /// the logging station's Morse key type (e.g. straight key, bug, etc). Example
    /// for a dual-lever paddle: <MORSE_KEY_TYPE:2>DP
    case myMorseKeyType
    ///
    /// Mode: String
    ///
    /// the logging operator's name
    case myName
    ///
    /// Mode: IntlString
    ///
    /// the logging operator's name
    case myNameIntl
    ///
    /// Mode: String
    ///
    /// the logging station's postal code
    case myPostalCode
    ///
    /// Mode: IntlString
    ///
    /// the logging station's postal code
    case myPostalCodeIntl
    ///
    /// Mode: POTARefList
    ///
    /// a comma-delimited list of one or more of the logging station's POTA (Parks
    /// on the Air) reference(s). Examples: <MY_POTA_REF:6>K-0059
    /// <MY_POTA_REF:7>K-10000
    /// <MY_POTA_REF:40>K-0817,K-4566,K-4576,K-4573,K-4578@US-WY
    case myPotaRef
    ///
    /// Mode: String
    ///
    /// description of the logging station's equipment
    case myRig
    ///
    /// Mode: IntlString
    ///
    /// description of the logging station's equipment
    case myRigIntl
    ///
    /// Mode: String
    ///
    /// special interest activity or event
    case mySig
    ///
    /// Mode: IntlString
    ///
    /// special interest activity or event
    case mySigIntl
    ///
    /// Mode: String
    ///
    /// special interest activity or event information
    case mySigInfo
    ///
    /// Mode: IntlString
    ///
    /// special interest activity or event information
    case mySigInfoIntl
    ///
    /// Mode: SOTARef
    ///
    /// the logging station's International SOTA Reference.
    case mySotaRef
    ///
    /// Mode: Enumeration
    ///
    /// (Primary Administrative Subdivision, function of MY_DXCC field's value)
    ///
    /// the code for the logging station's Primary Administrative Subdivision (e.g.
    /// US State, JA Island, VE Province)
    case myState
    ///
    /// Mode: String
    ///
    /// the logging station's street
    case myStreet
    ///
    /// Mode: IntlString
    ///
    /// the logging station's street
    case myStreetIntl
    ///
    /// Mode: SecondarySubdivisionList
    ///
    /// two US counties in the case where the logging station is located on a border
    /// between two counties, representing counties that the contacted station may
    /// claim for the CQ Magazine USA-CA award program. E.g.
    /// MA,Franklin:MA,Hampshire
    case myUsacaCounties
    ///
    /// Mode: GridSquareList
    ///
    /// two or four adjacent Maidenhead grid locators, each four or six characters
    /// long, representing the logging station's grid squares that the contacted
    /// station may claim for the ARRL VUCC award program. E.g. EM98,FM08,EM97,FM07
    case myVuccGrids
    ///
    /// Mode: WWFFRef
    ///
    /// the logging station's WWFF (World Wildlife Flora & Fauna) reference
    case myWwffRef
    ///
    /// Mode: String
    ///
    /// the contacted station's operator's name
    case name
    ///
    /// Mode: IntlString
    ///
    /// the contacted station's operator's name
    case nameIntl
    ///
    /// Mode: MultilineString
    ///
    /// QSO notes recommended use: information of interest to the logging station's
    /// operator
    case notes
    ///
    /// Mode: IntlMultilineString
    ///
    /// QSO notes recommended use: information of interest to the logging station's
    /// operator
    case notesIntl
    ///
    /// Mode: Integer
    ///
    /// the number of meteor scatter bursts heard by the logging station with a
    /// value greater than or equal to 0
    case nrBursts
    ///
    /// Mode: Integer
    ///
    /// the number of meteor scatter pings heard by the logging station with a value
    /// greater than or equal to 0
    case nrPings
    ///
    /// Mode: String
    ///
    /// the logging operator's callsign if STATION_CALLSIGN is absent, OPERATOR
    /// shall be treated as both the logging station's callsign and the logging
    /// operator's callsign
    case operatorValue
    ///
    /// Mode: String
    ///
    /// the callsign of the owner of the station used to log the contact (the
    /// callsign of the OPERATOR's host) if OWNER_CALLSIGN is absent,
    /// STATION_CALLSIGN shall be treated as both the logging station's callsign and
    /// the callsign of the owner of the station
    case ownerCallsign
    ///
    /// Mode: String
    ///
    /// the contacted station's WPX prefix
    case pfx
    ///
    /// Mode: POTARefList
    ///
    /// a comma-delimited list of one or more of the contacted station's POTA (Parks
    /// on the Air) reference(s). Examples: <POTA_REF:6>K-5033
    /// <POTA_REF:13>VE-5082@CA-AB
    /// <POTA_REF:40>K-0817,K-4566,K-4576,K-4573,K-4578@US-WY
    case potaRef
    ///
    /// Mode: String
    ///
    /// contest precedence (e.g. for ARRL Sweepstakes)
    case precedenceValue
    ///
    /// Mode: Enumeration
    ///
    /// Propagation Mode
    ///
    /// QSO propagation mode
    case propMode
    ///
    /// Mode: String
    ///
    /// public encryption key
    case publicKey
    ///
    /// Mode: Date
    ///
    /// date QSO downloaded from QRZ.COM logbook
    case qrzcomQsoDownloadDate
    ///
    /// Mode: Enumeration
    ///
    /// QSO Download Status
    ///
    /// QRZ.COM logbook QSO download status
    case qrzcomQsoDownloadStatus
    ///
    /// Mode: Date
    ///
    /// the date the QSO was last uploaded to the QRZ.COM online service
    case qrzcomQsoUploadDate
    ///
    /// Mode: Enumeration
    ///
    /// QSO Upload Status
    ///
    /// the upload status of the QSO on the QRZ.COM online service
    case qrzcomQsoUploadStatus
    ///
    /// Mode: MultilineString
    ///
    /// a message for the contacted station's operator to be incorporated in a paper
    /// or electronic QSL
    case qslmsg
    ///
    /// Mode: IntlMultilineString
    ///
    /// a message for the contacted station's operator to be incorporated in a paper
    /// or electronic QSL
    case qslmsgIntl
    ///
    /// Mode: MultilineString
    ///
    /// a message addressed to the logging station's operator incorporated in a
    /// paper or electronic QSL
    case qslmsgRcvd
    ///
    /// Mode: Date
    ///
    /// QSL received date (only valid if QSL_RCVD is Y, I, or V)(V import-only)
    case qslrdate
    ///
    /// Mode: Date
    ///
    /// QSL sent date (only valid if QSL_SENT is Y, Q, or I)
    case qslsdate
    ///
    /// Mode: Enumeration
    ///
    /// QSL received status instead of V (import-only) use
    /// <CREDIT_GRANTED:39>DXCC:card,DXCC_BAND:card,DXCC_MODE:card Default Value: N
    case qslRcvd
    ///
    /// Mode: Enumeration
    ///
    /// QSL Via
    ///
    /// if QSL_RCVD is set to 'Y' or 'V', the means by which the QSL was received by
    /// the logging station; otherwise, the means by which the logging station
    /// requested or intends to request that the QSL be conveyed. (Note: 'V' is
    /// import-only) use of M (manager) is import-only
    case qslRcvdVia
    ///
    /// Mode: Enumeration
    ///
    /// QSL sent status Default Value: N
    case qslSent
    ///
    /// Mode: Enumeration
    ///
    /// QSL Via
    ///
    /// if QSL_SENT is set to 'Y', the means by which the QSL was sent by the
    /// logging station; otherwise, the means by which the logging station intends
    /// to convey the QSL use of M (manager) is import-only
    case qslSentVia
    ///
    /// Mode: String
    ///
    /// the contacted station's QSL route
    case qslVia
    ///
    /// Mode: Enumeration
    ///
    /// indicates whether the QSO was complete from the perspective of the logging
    /// station Y - yes N - no NIL - not heard ? - uncertain
    case qsoComplete
    ///
    /// Mode: Date
    ///
    /// date on which the QSO started
    case qsoDate
    ///
    /// Mode: Date
    ///
    /// date on which the QSO ended
    case qsoDateOff
    ///
    /// Mode: Boolean
    ///
    /// indicates whether the QSO was random or scheduled
    case qsoRandom
    ///
    /// Mode: String
    ///
    /// the contacted station's city
    case qth
    ///
    /// Mode: IntlString
    ///
    /// the contacted station's city
    case qthIntl
    ///
    /// Mode: Enumeration
    ///
    /// the contacted station's WAE or CQ entity contained within a DXCC entity. the
    /// value None indicates that the WAE or CQ entity is the DXCC entity in the
    /// DXCC field. nothing can be inferred from the absence of the REGION field
    case region
    ///
    /// Mode: MultilineString
    ///
    /// description of the contacted station's equipment
    case rig
    ///
    /// Mode: IntlMultilineString
    ///
    /// description of the contacted station's equipment
    case rigIntl
    ///
    /// Mode: String
    ///
    /// signal report from the contacted station
    case rstRcvd
    ///
    /// Mode: String
    ///
    /// signal report sent to the contacted station
    case rstSent
    ///
    /// Mode: Number
    ///
    /// the contacted station's transmitter power in Watts with a value greater than
    /// or equal to 0
    case rxPwr
    ///
    /// Mode: String
    ///
    /// satellite mode - a code representing the satellite's uplink band and
    /// downlink band
    case satMode
    ///
    /// Mode: String
    ///
    /// name of satellite
    case satName
    ///
    /// Mode: Integer
    ///
    /// the solar flux at the time of the QSO in the range 0 to 300 (inclusive).
    case sfi
    ///
    /// Mode: String
    ///
    /// the name of the contacted station's special activity or interest group
    case sig
    ///
    /// Mode: IntlString
    ///
    /// the name of the contacted station's special activity or interest group
    case sigIntl
    ///
    /// Mode: String
    ///
    /// information associated with the contacted station's activity or interest
    /// group
    case sigInfo
    ///
    /// Mode: IntlString
    ///
    /// information associated with the contacted station's activity or interest
    /// group
    case sigInfoIntl
    ///
    /// Mode: Boolean
    ///
    /// 'Y' indicates that the contacted station's operator is now a Silent Key.
    case silentKey
    ///
    /// Mode: String
    ///
    /// the contacted station's Straight Key Century Club (SKCC) member information
    case skcc
    ///
    /// Mode: SOTARef
    ///
    /// the contacted station's International SOTA Reference.
    case sotaRef
    ///
    /// Mode: Integer
    ///
    /// contest QSO received serial number with a value greater than or equal to 0
    case srx
    ///
    /// Mode: String
    ///
    /// contest QSO received information use Cabrillo format to convey contest
    /// information for which ADIF fields are not specified in the event of a
    /// conflict between information in a dedicated contest field and this field,
    /// information in the dedicated contest field shall prevail
    case srxString
    ///
    /// Mode: Enumeration
    ///
    /// (Primary Administrative Subdivision, function of DXCC field's value)
    ///
    /// the code for the contacted station's Primary Administrative Subdivision
    /// (e.g. US State, JA Island, VE Province)
    case state
    ///
    /// Mode: String
    ///
    /// the logging station's callsign (the callsign used over the air) if
    /// STATION_CALLSIGN is absent, OPERATOR shall be treated as both the logging
    /// station's callsign and the logging operator's callsign
    case stationCallsign
    ///
    /// Mode: Integer
    ///
    /// contest QSO transmitted serial number with a value greater than or equal to
    /// 0
    case stx
    ///
    /// Mode: String
    ///
    /// contest QSO transmitted information use Cabrillo format to convey contest
    /// information for which ADIF fields are not specified in the event of a
    /// conflict between information in a dedicated contest field and this field,
    /// information in the dedicated contest field shall prevail
    case stxString
    ///
    /// Mode: String
    ///
    /// Submode (function of MODE field's value)
    ///
    /// QSO Submode use enumeration values for interoperability
    case submode
    ///
    /// Mode: Boolean
    ///
    /// indicates that the QSO information pertains to an SWL report
    case swl
    ///
    /// Mode: PositiveInteger
    ///
    /// Ten-Ten number with a value greater than 0
    case tenTen
    ///
    /// Mode: Time
    ///
    /// HHMM or HHMMSS in UTC in the absence of <QSO_DATE_OFF>, the QSO duration is
    /// less than 24 hours. For example, the following is a QSO starting at 14 July
    /// 2020 23:55 and finishing at 15 July 2020 01:00: <QSO_DATE:8>20200714
    /// <TIME_ON:4>2355 <TIME_OFF:4>0100
    case timeOff
    ///
    /// Mode: Time
    ///
    /// HHMM or HHMMSS in UTC
    case timeOn
    ///
    /// Mode: Number
    ///
    /// the logging station's power in Watts with a value greater than or equal to 0
    case txPwr
    ///
    /// Mode: PositiveInteger
    ///
    /// the contacted station's UKSMG member number with a value greater than 0
    case uksmg
    ///
    /// Mode: SecondarySubdivisionList
    ///
    /// two US counties in the case where the contacted station is located on a
    /// border between two counties, representing counties credited to the QSO for
    /// the CQ Magazine USA-CA award program. E.g. MA,Franklin:MA,Hampshire
    case usacaCounties
    ///
    /// Mode: String
    ///
    /// import-only: use STATE instead
    case veProv
    ///
    /// Mode: GridSquareList
    ///
    /// two or four adjacent Maidenhead grid locators, each four or six characters
    /// long, representing the contacted station's grid squares credited to the QSO
    /// for the ARRL VUCC award program. E.g. EM98,FM08,EM97,FM07
    case vuccGrids
    ///
    /// Mode: String
    ///
    /// the contacted station's URL
    case web
    ///
    /// Mode: WWFFRef
    ///
    /// the contacted station's WWFF (World Wildlife Flora & Fauna) reference
    case wwffRef

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
        .adifVer,
        .createdTimestamp,
        .programid,
        .programversion,
        .userdefn,
        .address,
        .addressIntl,
        .age,
        .altitude,
        .antAz,
        .antEl,
        .antPath,
        .arrlSect,
        .awardSubmitted,
        .awardGranted,
        .aIndex,
        .band,
        .bandRx,
        .call,
        .check,
        .classValue,
        .clublogQsoUploadDate,
        .clublogQsoUploadStatus,
        .cnty,
        .cntyAlt,
        .comment,
        .commentIntl,
        .cont,
        .contactedOp,
        .contestId,
        .country,
        .countryIntl,
        .cqz,
        .creditSubmitted,
        .creditGranted,
        .darcDok,
        .dclQslrdate,
        .dclQslsdate,
        .dclQslRcvd,
        .dclQslSent,
        .distance,
        .dxcc,
        .email,
        .eqCall,
        .eqslAg,
        .eqslQslrdate,
        .eqslQslsdate,
        .eqslQslRcvd,
        .eqslQslSent,
        .fists,
        .fistsCc,
        .forceInit,
        .freq,
        .freqRx,
        .gridsquare,
        .gridsquareExt,
        .guestOp,
        .hamlogeuQsoUploadDate,
        .hamlogeuQsoUploadStatus,
        .hamqthQsoUploadDate,
        .hamqthQsoUploadStatus,
        .hrdlogQsoUploadDate,
        .hrdlogQsoUploadStatus,
        .iota,
        .iotaIslandId,
        .ituz,
        .kIndex,
        .lat,
        .lon,
        .lotwQslrdate,
        .lotwQslsdate,
        .lotwQslRcvd,
        .lotwQslSent,
        .maxBursts,
        .mode,
        .morseKeyInfo,
        .morseKeyType,
        .msShower,
        .myAltitude,
        .myAntenna,
        .myAntennaIntl,
        .myArrlSect,
        .myCity,
        .myCityIntl,
        .myCnty,
        .myCntyAlt,
        .myCountry,
        .myCountryIntl,
        .myCqZone,
        .myDarcDok,
        .myDxcc,
        .myFists,
        .myGridsquare,
        .myGridsquareExt,
        .myIota,
        .myIotaIslandId,
        .myItuZone,
        .myLat,
        .myLon,
        .myMorseKeyInfo,
        .myMorseKeyType,
        .myName,
        .myNameIntl,
        .myPostalCode,
        .myPostalCodeIntl,
        .myPotaRef,
        .myRig,
        .myRigIntl,
        .mySig,
        .mySigIntl,
        .mySigInfo,
        .mySigInfoIntl,
        .mySotaRef,
        .myState,
        .myStreet,
        .myStreetIntl,
        .myUsacaCounties,
        .myVuccGrids,
        .myWwffRef,
        .name,
        .nameIntl,
        .notes,
        .notesIntl,
        .nrBursts,
        .nrPings,
        .operatorValue,
        .ownerCallsign,
        .pfx,
        .potaRef,
        .precedenceValue,
        .propMode,
        .publicKey,
        .qrzcomQsoDownloadDate,
        .qrzcomQsoDownloadStatus,
        .qrzcomQsoUploadDate,
        .qrzcomQsoUploadStatus,
        .qslmsg,
        .qslmsgIntl,
        .qslmsgRcvd,
        .qslrdate,
        .qslsdate,
        .qslRcvd,
        .qslRcvdVia,
        .qslSent,
        .qslSentVia,
        .qslVia,
        .qsoComplete,
        .qsoDate,
        .qsoDateOff,
        .qsoRandom,
        .qth,
        .qthIntl,
        .region,
        .rig,
        .rigIntl,
        .rstRcvd,
        .rstSent,
        .rxPwr,
        .satMode,
        .satName,
        .sfi,
        .sig,
        .sigIntl,
        .sigInfo,
        .sigInfoIntl,
        .silentKey,
        .skcc,
        .sotaRef,
        .srx,
        .srxString,
        .state,
        .stationCallsign,
        .stx,
        .stxString,
        .submode,
        .swl,
        .tenTen,
        .timeOff,
        .timeOn,
        .txPwr,
        .uksmg,
        .usacaCounties,
        .veProv,
        .vuccGrids,
        .web,
        .wwffRef,
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
        case .adifVer:
            "ADIF_VER"
        case .createdTimestamp:
            "CREATED_TIMESTAMP"
        case .programid:
            "PROGRAMID"
        case .programversion:
            "PROGRAMVERSION"
        case .userdefn:
            "USERDEFn"
        case .address:
            "ADDRESS"
        case .addressIntl:
            "ADDRESS_INTL"
        case .age:
            "AGE"
        case .altitude:
            "ALTITUDE"
        case .antAz:
            "ANT_AZ"
        case .antEl:
            "ANT_EL"
        case .antPath:
            "ANT_PATH"
        case .arrlSect:
            "ARRL_SECT"
        case .awardSubmitted:
            "AWARD_SUBMITTED"
        case .awardGranted:
            "AWARD_GRANTED"
        case .aIndex:
            "A_INDEX"
        case .band:
            "BAND"
        case .bandRx:
            "BAND_RX"
        case .call:
            "CALL"
        case .check:
            "CHECK"
        case .classValue:
            "CLASS"
        case .clublogQsoUploadDate:
            "CLUBLOG_QSO_UPLOAD_DATE"
        case .clublogQsoUploadStatus:
            "CLUBLOG_QSO_UPLOAD_STATUS"
        case .cnty:
            "CNTY"
        case .cntyAlt:
            "CNTY_ALT"
        case .comment:
            "COMMENT"
        case .commentIntl:
            "COMMENT_INTL"
        case .cont:
            "CONT"
        case .contactedOp:
            "CONTACTED_OP"
        case .contestId:
            "CONTEST_ID"
        case .country:
            "COUNTRY"
        case .countryIntl:
            "COUNTRY_INTL"
        case .cqz:
            "CQZ"
        case .creditSubmitted:
            "CREDIT_SUBMITTED"
        case .creditGranted:
            "CREDIT_GRANTED"
        case .darcDok:
            "DARC_DOK"
        case .dclQslrdate:
            "DCL_QSLRDATE"
        case .dclQslsdate:
            "DCL_QSLSDATE"
        case .dclQslRcvd:
            "DCL_QSL_RCVD"
        case .dclQslSent:
            "DCL_QSL_SENT"
        case .distance:
            "DISTANCE"
        case .dxcc:
            "DXCC"
        case .email:
            "EMAIL"
        case .eqCall:
            "EQ_CALL"
        case .eqslAg:
            "EQSL_AG"
        case .eqslQslrdate:
            "EQSL_QSLRDATE"
        case .eqslQslsdate:
            "EQSL_QSLSDATE"
        case .eqslQslRcvd:
            "EQSL_QSL_RCVD"
        case .eqslQslSent:
            "EQSL_QSL_SENT"
        case .fists:
            "FISTS"
        case .fistsCc:
            "FISTS_CC"
        case .forceInit:
            "FORCE_INIT"
        case .freq:
            "FREQ"
        case .freqRx:
            "FREQ_RX"
        case .gridsquare:
            "GRIDSQUARE"
        case .gridsquareExt:
            "GRIDSQUARE_EXT"
        case .guestOp:
            "GUEST_OP"
        case .hamlogeuQsoUploadDate:
            "HAMLOGEU_QSO_UPLOAD_DATE"
        case .hamlogeuQsoUploadStatus:
            "HAMLOGEU_QSO_UPLOAD_STATUS"
        case .hamqthQsoUploadDate:
            "HAMQTH_QSO_UPLOAD_DATE"
        case .hamqthQsoUploadStatus:
            "HAMQTH_QSO_UPLOAD_STATUS"
        case .hrdlogQsoUploadDate:
            "HRDLOG_QSO_UPLOAD_DATE"
        case .hrdlogQsoUploadStatus:
            "HRDLOG_QSO_UPLOAD_STATUS"
        case .iota:
            "IOTA"
        case .iotaIslandId:
            "IOTA_ISLAND_ID"
        case .ituz:
            "ITUZ"
        case .kIndex:
            "K_INDEX"
        case .lat:
            "LAT"
        case .lon:
            "LON"
        case .lotwQslrdate:
            "LOTW_QSLRDATE"
        case .lotwQslsdate:
            "LOTW_QSLSDATE"
        case .lotwQslRcvd:
            "LOTW_QSL_RCVD"
        case .lotwQslSent:
            "LOTW_QSL_SENT"
        case .maxBursts:
            "MAX_BURSTS"
        case .mode:
            "MODE"
        case .morseKeyInfo:
            "MORSE_KEY_INFO"
        case .morseKeyType:
            "MORSE_KEY_TYPE"
        case .msShower:
            "MS_SHOWER"
        case .myAltitude:
            "MY_ALTITUDE"
        case .myAntenna:
            "MY_ANTENNA"
        case .myAntennaIntl:
            "MY_ANTENNA_INTL"
        case .myArrlSect:
            "MY_ARRL_SECT"
        case .myCity:
            "MY_CITY"
        case .myCityIntl:
            "MY_CITY_INTL"
        case .myCnty:
            "MY_CNTY"
        case .myCntyAlt:
            "MY_CNTY_ALT"
        case .myCountry:
            "MY_COUNTRY"
        case .myCountryIntl:
            "MY_COUNTRY_INTL"
        case .myCqZone:
            "MY_CQ_ZONE"
        case .myDarcDok:
            "MY_DARC_DOK"
        case .myDxcc:
            "MY_DXCC"
        case .myFists:
            "MY_FISTS"
        case .myGridsquare:
            "MY_GRIDSQUARE"
        case .myGridsquareExt:
            "MY_GRIDSQUARE_EXT"
        case .myIota:
            "MY_IOTA"
        case .myIotaIslandId:
            "MY_IOTA_ISLAND_ID"
        case .myItuZone:
            "MY_ITU_ZONE"
        case .myLat:
            "MY_LAT"
        case .myLon:
            "MY_LON"
        case .myMorseKeyInfo:
            "MY_MORSE_KEY_INFO"
        case .myMorseKeyType:
            "MY_MORSE_KEY_TYPE"
        case .myName:
            "MY_NAME"
        case .myNameIntl:
            "MY_NAME_INTL"
        case .myPostalCode:
            "MY_POSTAL_CODE"
        case .myPostalCodeIntl:
            "MY_POSTAL_CODE_INTL"
        case .myPotaRef:
            "MY_POTA_REF"
        case .myRig:
            "MY_RIG"
        case .myRigIntl:
            "MY_RIG_INTL"
        case .mySig:
            "MY_SIG"
        case .mySigIntl:
            "MY_SIG_INTL"
        case .mySigInfo:
            "MY_SIG_INFO"
        case .mySigInfoIntl:
            "MY_SIG_INFO_INTL"
        case .mySotaRef:
            "MY_SOTA_REF"
        case .myState:
            "MY_STATE"
        case .myStreet:
            "MY_STREET"
        case .myStreetIntl:
            "MY_STREET_INTL"
        case .myUsacaCounties:
            "MY_USACA_COUNTIES"
        case .myVuccGrids:
            "MY_VUCC_GRIDS"
        case .myWwffRef:
            "MY_WWFF_REF"
        case .name:
            "NAME"
        case .nameIntl:
            "NAME_INTL"
        case .notes:
            "NOTES"
        case .notesIntl:
            "NOTES_INTL"
        case .nrBursts:
            "NR_BURSTS"
        case .nrPings:
            "NR_PINGS"
        case .operatorValue:
            "OPERATOR"
        case .ownerCallsign:
            "OWNER_CALLSIGN"
        case .pfx:
            "PFX"
        case .potaRef:
            "POTA_REF"
        case .precedenceValue:
            "PRECEDENCE"
        case .propMode:
            "PROP_MODE"
        case .publicKey:
            "PUBLIC_KEY"
        case .qrzcomQsoDownloadDate:
            "QRZCOM_QSO_DOWNLOAD_DATE"
        case .qrzcomQsoDownloadStatus:
            "QRZCOM_QSO_DOWNLOAD_STATUS"
        case .qrzcomQsoUploadDate:
            "QRZCOM_QSO_UPLOAD_DATE"
        case .qrzcomQsoUploadStatus:
            "QRZCOM_QSO_UPLOAD_STATUS"
        case .qslmsg:
            "QSLMSG"
        case .qslmsgIntl:
            "QSLMSG_INTL"
        case .qslmsgRcvd:
            "QSLMSG_RCVD"
        case .qslrdate:
            "QSLRDATE"
        case .qslsdate:
            "QSLSDATE"
        case .qslRcvd:
            "QSL_RCVD"
        case .qslRcvdVia:
            "QSL_RCVD_VIA"
        case .qslSent:
            "QSL_SENT"
        case .qslSentVia:
            "QSL_SENT_VIA"
        case .qslVia:
            "QSL_VIA"
        case .qsoComplete:
            "QSO_COMPLETE"
        case .qsoDate:
            "QSO_DATE"
        case .qsoDateOff:
            "QSO_DATE_OFF"
        case .qsoRandom:
            "QSO_RANDOM"
        case .qth:
            "QTH"
        case .qthIntl:
            "QTH_INTL"
        case .region:
            "REGION"
        case .rig:
            "RIG"
        case .rigIntl:
            "RIG_INTL"
        case .rstRcvd:
            "RST_RCVD"
        case .rstSent:
            "RST_SENT"
        case .rxPwr:
            "RX_PWR"
        case .satMode:
            "SAT_MODE"
        case .satName:
            "SAT_NAME"
        case .sfi:
            "SFI"
        case .sig:
            "SIG"
        case .sigIntl:
            "SIG_INTL"
        case .sigInfo:
            "SIG_INFO"
        case .sigInfoIntl:
            "SIG_INFO_INTL"
        case .silentKey:
            "SILENT_KEY"
        case .skcc:
            "SKCC"
        case .sotaRef:
            "SOTA_REF"
        case .srx:
            "SRX"
        case .srxString:
            "SRX_STRING"
        case .state:
            "STATE"
        case .stationCallsign:
            "STATION_CALLSIGN"
        case .stx:
            "STX"
        case .stxString:
            "STX_STRING"
        case .submode:
            "SUBMODE"
        case .swl:
            "SWL"
        case .tenTen:
            "TEN_TEN"
        case .timeOff:
            "TIME_OFF"
        case .timeOn:
            "TIME_ON"
        case .txPwr:
            "TX_PWR"
        case .uksmg:
            "UKSMG"
        case .usacaCounties:
            "USACA_COUNTIES"
        case .veProv:
            "VE_PROV"
        case .vuccGrids:
            "VUCC_GRIDS"
        case .web:
            "WEB"
        case .wwffRef:
            "WWFF_REF"
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
        "adif_ver": .adifVer,
        "created_timestamp": .createdTimestamp,
        "programid": .programid,
        "programversion": .programversion,
        "userdefn": .userdefn,
        "address": .address,
        "address_intl": .addressIntl,
        "age": .age,
        "altitude": .altitude,
        "ant_az": .antAz,
        "ant_el": .antEl,
        "ant_path": .antPath,
        "arrl_sect": .arrlSect,
        "award_submitted": .awardSubmitted,
        "award_granted": .awardGranted,
        "a_index": .aIndex,
        "band": .band,
        "band_rx": .bandRx,
        "call": .call,
        "check": .check,
        "class": .classValue,
        "clublog_qso_upload_date": .clublogQsoUploadDate,
        "clublog_qso_upload_status": .clublogQsoUploadStatus,
        "cnty": .cnty,
        "cnty_alt": .cntyAlt,
        "comment": .comment,
        "comment_intl": .commentIntl,
        "cont": .cont,
        "contacted_op": .contactedOp,
        "contest_id": .contestId,
        "country": .country,
        "country_intl": .countryIntl,
        "cqz": .cqz,
        "credit_submitted": .creditSubmitted,
        "credit_granted": .creditGranted,
        "darc_dok": .darcDok,
        "dcl_qslrdate": .dclQslrdate,
        "dcl_qslsdate": .dclQslsdate,
        "dcl_qsl_rcvd": .dclQslRcvd,
        "dcl_qsl_sent": .dclQslSent,
        "distance": .distance,
        "dxcc": .dxcc,
        "email": .email,
        "eq_call": .eqCall,
        "eqsl_ag": .eqslAg,
        "eqsl_qslrdate": .eqslQslrdate,
        "eqsl_qslsdate": .eqslQslsdate,
        "eqsl_qsl_rcvd": .eqslQslRcvd,
        "eqsl_qsl_sent": .eqslQslSent,
        "fists": .fists,
        "fists_cc": .fistsCc,
        "force_init": .forceInit,
        "freq": .freq,
        "freq_rx": .freqRx,
        "gridsquare": .gridsquare,
        "gridsquare_ext": .gridsquareExt,
        "guest_op": .guestOp,
        "hamlogeu_qso_upload_date": .hamlogeuQsoUploadDate,
        "hamlogeu_qso_upload_status": .hamlogeuQsoUploadStatus,
        "hamqth_qso_upload_date": .hamqthQsoUploadDate,
        "hamqth_qso_upload_status": .hamqthQsoUploadStatus,
        "hrdlog_qso_upload_date": .hrdlogQsoUploadDate,
        "hrdlog_qso_upload_status": .hrdlogQsoUploadStatus,
        "iota": .iota,
        "iota_island_id": .iotaIslandId,
        "ituz": .ituz,
        "k_index": .kIndex,
        "lat": .lat,
        "lon": .lon,
        "lotw_qslrdate": .lotwQslrdate,
        "lotw_qslsdate": .lotwQslsdate,
        "lotw_qsl_rcvd": .lotwQslRcvd,
        "lotw_qsl_sent": .lotwQslSent,
        "max_bursts": .maxBursts,
        "mode": .mode,
        "morse_key_info": .morseKeyInfo,
        "morse_key_type": .morseKeyType,
        "ms_shower": .msShower,
        "my_altitude": .myAltitude,
        "my_antenna": .myAntenna,
        "my_antenna_intl": .myAntennaIntl,
        "my_arrl_sect": .myArrlSect,
        "my_city": .myCity,
        "my_city_intl": .myCityIntl,
        "my_cnty": .myCnty,
        "my_cnty_alt": .myCntyAlt,
        "my_country": .myCountry,
        "my_country_intl": .myCountryIntl,
        "my_cq_zone": .myCqZone,
        "my_darc_dok": .myDarcDok,
        "my_dxcc": .myDxcc,
        "my_fists": .myFists,
        "my_gridsquare": .myGridsquare,
        "my_gridsquare_ext": .myGridsquareExt,
        "my_iota": .myIota,
        "my_iota_island_id": .myIotaIslandId,
        "my_itu_zone": .myItuZone,
        "my_lat": .myLat,
        "my_lon": .myLon,
        "my_morse_key_info": .myMorseKeyInfo,
        "my_morse_key_type": .myMorseKeyType,
        "my_name": .myName,
        "my_name_intl": .myNameIntl,
        "my_postal_code": .myPostalCode,
        "my_postal_code_intl": .myPostalCodeIntl,
        "my_pota_ref": .myPotaRef,
        "my_rig": .myRig,
        "my_rig_intl": .myRigIntl,
        "my_sig": .mySig,
        "my_sig_intl": .mySigIntl,
        "my_sig_info": .mySigInfo,
        "my_sig_info_intl": .mySigInfoIntl,
        "my_sota_ref": .mySotaRef,
        "my_state": .myState,
        "my_street": .myStreet,
        "my_street_intl": .myStreetIntl,
        "my_usaca_counties": .myUsacaCounties,
        "my_vucc_grids": .myVuccGrids,
        "my_wwff_ref": .myWwffRef,
        "name": .name,
        "name_intl": .nameIntl,
        "notes": .notes,
        "notes_intl": .notesIntl,
        "nr_bursts": .nrBursts,
        "nr_pings": .nrPings,
        "operator": .operatorValue,
        "owner_callsign": .ownerCallsign,
        "pfx": .pfx,
        "pota_ref": .potaRef,
        "precedence": .precedenceValue,
        "prop_mode": .propMode,
        "public_key": .publicKey,
        "qrzcom_qso_download_date": .qrzcomQsoDownloadDate,
        "qrzcom_qso_download_status": .qrzcomQsoDownloadStatus,
        "qrzcom_qso_upload_date": .qrzcomQsoUploadDate,
        "qrzcom_qso_upload_status": .qrzcomQsoUploadStatus,
        "qslmsg": .qslmsg,
        "qslmsg_intl": .qslmsgIntl,
        "qslmsg_rcvd": .qslmsgRcvd,
        "qslrdate": .qslrdate,
        "qslsdate": .qslsdate,
        "qsl_rcvd": .qslRcvd,
        "qsl_rcvd_via": .qslRcvdVia,
        "qsl_sent": .qslSent,
        "qsl_sent_via": .qslSentVia,
        "qsl_via": .qslVia,
        "qso_complete": .qsoComplete,
        "qso_date": .qsoDate,
        "qso_date_off": .qsoDateOff,
        "qso_random": .qsoRandom,
        "qth": .qth,
        "qth_intl": .qthIntl,
        "region": .region,
        "rig": .rig,
        "rig_intl": .rigIntl,
        "rst_rcvd": .rstRcvd,
        "rst_sent": .rstSent,
        "rx_pwr": .rxPwr,
        "sat_mode": .satMode,
        "sat_name": .satName,
        "sfi": .sfi,
        "sig": .sig,
        "sig_intl": .sigIntl,
        "sig_info": .sigInfo,
        "sig_info_intl": .sigInfoIntl,
        "silent_key": .silentKey,
        "skcc": .skcc,
        "sota_ref": .sotaRef,
        "srx": .srx,
        "srx_string": .srxString,
        "state": .state,
        "station_callsign": .stationCallsign,
        "stx": .stx,
        "stx_string": .stxString,
        "submode": .submode,
        "swl": .swl,
        "ten_ten": .tenTen,
        "time_off": .timeOff,
        "time_on": .timeOn,
        "tx_pwr": .txPwr,
        "uksmg": .uksmg,
        "usaca_counties": .usacaCounties,
        "ve_prov": .veProv,
        "vucc_grids": .vuccGrids,
        "web": .web,
        "wwff_ref": .wwffRef,
    ]

    /// Creates a value from its textual form.
    ///
    /// - Parameter rawValue: The value, in any case.
    /// - Returns: The matching value, or `nil` if `rawValue` names no member of
    ///   this enumeration.
    public init?(rawValue: some StringProtocol) {
        guard let member = Self.membersByLowercasedValue[rawValue.lowercased()] else {
            return nil
        }

        self = member
    }
}
