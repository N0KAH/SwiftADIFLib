/// The ADIF `DXCC Entity Code` enumeration.
///
/// A DXCC entity code identifies a geographic entity for award and credit
/// purposes. The specification lists every code it has ever assigned, so a code
/// the specification has since retired is still readable here and is reported by
/// ``isDeleted`` rather than being dropped.
///
/// - Note: See the specification's section III.B for the authoritative list.
public enum ADIDXCCEntityCode: ADIEnumeration {
    /// None (the contacted station is known to not be within a DXCC entity).
    case noEntity
    /// CANADA.
    case canada
    /// ABU AIL IS.
    ///
    /// - Note: The specification marks entity code `2` as deleted.
    case abuAilIs
    /// AFGHANISTAN.
    case afghanistan
    /// AGALEGA & ST. BRANDON IS.
    case agalegaStBrandonIs
    /// ALAND IS.
    case alandIs
    /// ALASKA.
    case alaska
    /// ALBANIA.
    case albania
    /// ALDABRA.
    ///
    /// - Note: The specification marks entity code `8` as deleted.
    case aldabra
    /// AMERICAN SAMOA.
    case americanSamoa
    /// AMSTERDAM & ST. PAUL IS.
    case amsterdamStPaulIs
    /// ANDAMAN & NICOBAR IS.
    case andamanNicobarIs
    /// ANGUILLA.
    case anguilla
    /// ANTARCTICA.
    case antarctica
    /// ARMENIA.
    case armenia
    /// ASIATIC RUSSIA.
    case asiaticRussia
    /// NEW ZEALAND SUBANTARCTIC ISLANDS.
    case newZealandSubantarcticIslands
    /// AVES I.
    case avesI
    /// AZERBAIJAN.
    case azerbaijan
    /// BAJO NUEVO.
    ///
    /// - Note: The specification marks entity code `19` as deleted.
    case bajoNuevo
    /// BAKER & HOWLAND IS.
    case bakerHowlandIs
    /// BALEARIC IS.
    case balearicIs
    /// PALAU.
    case palau
    /// BLENHEIM REEF.
    ///
    /// - Note: The specification marks entity code `23` as deleted.
    case blenheimReef
    /// BOUVET.
    case bouvet
    /// BRITISH NORTH BORNEO.
    ///
    /// - Note: The specification marks entity code `25` as deleted.
    case britishNorthBorneo
    /// BRITISH SOMALILAND.
    ///
    /// - Note: The specification marks entity code `26` as deleted.
    case britishSomaliland
    /// BELARUS.
    case belarus
    /// CANAL ZONE.
    ///
    /// - Note: The specification marks entity code `28` as deleted.
    case canalZone
    /// CANARY IS.
    case canaryIs
    /// CELEBE & MOLUCCA IS.
    ///
    /// - Note: The specification marks entity code `30` as deleted.
    case celebeMoluccaIs
    /// C. KIRIBATI (BRITISH PHOENIX IS.).
    case cKiribatiBritishPhoenix
    /// CEUTA & MELILLA.
    case ceutaMelilla
    /// CHAGOS IS.
    case chagosIs
    /// CHATHAM IS.
    case chathamIs
    /// CHRISTMAS I.
    case christmasI
    /// CLIPPERTON I.
    case clippertonI
    /// COCOS I.
    case cocosI
    /// COCOS (KEELING) IS.
    case cocosKeelingIs
    /// COMOROS (Deleted).
    ///
    /// - Note: The specification marks entity code `39` as deleted.
    case comorosDeleted
    /// CRETE.
    case crete
    /// CROZET I.
    case crozetI
    /// DAMAO, DIU.
    ///
    /// - Note: The specification marks entity code `42` as deleted.
    case damaoDiu
    /// DESECHEO I.
    case desecheoI
    /// DESROCHES.
    ///
    /// - Note: The specification marks entity code `44` as deleted.
    case desroches
    /// DODECANESE.
    case dodecanese
    /// EAST MALAYSIA.
    case eastMalaysia
    /// EASTER I.
    case easterI
    /// E. KIRIBATI (LINE IS.).
    case eKiribatiLineIs
    /// EQUATORIAL GUINEA.
    case equatorialGuinea
    /// MEXICO.
    case mexico
    /// ERITREA.
    case eritrea
    /// ESTONIA.
    case estonia
    /// ETHIOPIA.
    case ethiopia
    /// EUROPEAN RUSSIA.
    case europeanRussia
    /// FARQUHAR.
    ///
    /// - Note: The specification marks entity code `55` as deleted.
    case farquhar
    /// FERNANDO DE NORONHA.
    case fernandoDeNoronha
    /// FRENCH EQUATORIAL AFRICA.
    ///
    /// - Note: The specification marks entity code `57` as deleted.
    case frenchEquatorialAfrica
    /// FRENCH INDO-CHINA.
    ///
    /// - Note: The specification marks entity code `58` as deleted.
    case frenchIndoChina
    /// FRENCH WEST AFRICA.
    ///
    /// - Note: The specification marks entity code `59` as deleted.
    case frenchWestAfrica
    /// BAHAMAS.
    case bahamas
    /// FRANZ JOSEF LAND.
    case franzJosefLand
    /// BARBADOS.
    case barbados
    /// FRENCH GUIANA.
    case frenchGuiana
    /// BERMUDA.
    case bermuda
    /// BRITISH VIRGIN IS.
    case britishVirginIs
    /// BELIZE.
    case belize
    /// FRENCH INDIA.
    ///
    /// - Note: The specification marks entity code `67` as deleted.
    case frenchIndia
    /// KUWAIT/SAUDI ARABIA NEUTRAL ZONE.
    ///
    /// - Note: The specification marks entity code `68` as deleted.
    case kuwaitSaudiArabiaNeutral
    /// CAYMAN IS.
    case caymanIs
    /// CUBA.
    case cuba
    /// GALAPAGOS IS.
    case galapagosIs
    /// DOMINICAN REPUBLIC.
    case dominicanRepublic
    /// EL SALVADOR.
    case elSalvador
    /// GEORGIA.
    case georgia
    /// GUATEMALA.
    case guatemala
    /// GRENADA.
    case grenada
    /// HAITI.
    case haiti
    /// GUADELOUPE.
    case guadeloupe
    /// HONDURAS.
    case honduras
    /// GERMANY.
    ///
    /// - Note: The specification marks entity code `81` as deleted.
    case germany
    /// JAMAICA.
    case jamaica
    /// MARTINIQUE.
    case martinique
    /// BONAIRE, CURACAO.
    ///
    /// - Note: The specification marks entity code `85` as deleted.
    case bonaireCuracao
    /// NICARAGUA.
    case nicaragua
    /// PANAMA.
    case panama
    /// TURKS & CAICOS IS.
    case turksCaicosIs
    /// TRINIDAD & TOBAGO.
    case trinidadTobago
    /// ARUBA.
    case aruba
    /// GEYSER REEF.
    ///
    /// - Note: The specification marks entity code `93` as deleted.
    case geyserReef
    /// ANTIGUA & BARBUDA.
    case antiguaBarbuda
    /// DOMINICA.
    case dominica
    /// MONTSERRAT.
    case montserrat
    /// ST. LUCIA.
    case stLucia
    /// ST. VINCENT.
    case stVincent
    /// GLORIOSO IS.
    case gloriosoIs
    /// ARGENTINA.
    case argentina
    /// GOA.
    ///
    /// - Note: The specification marks entity code `101` as deleted.
    case goa
    /// GOLD COAST, TOGOLAND.
    ///
    /// - Note: The specification marks entity code `102` as deleted.
    case goldCoastTogoland
    /// GUAM.
    case guam
    /// BOLIVIA.
    case bolivia
    /// GUANTANAMO BAY.
    case guantanamoBay
    /// GUERNSEY.
    case guernsey
    /// GUINEA.
    case guinea
    /// BRAZIL.
    case brazil
    /// GUINEA-BISSAU.
    case guineaBissau
    /// HAWAII.
    case hawaii
    /// HEARD I.
    case heardI
    /// CHILE.
    case chile
    /// IFNI.
    ///
    /// - Note: The specification marks entity code `113` as deleted.
    case ifni
    /// ISLE OF MAN.
    case isleOfMan
    /// ITALIAN SOMALILAND.
    ///
    /// - Note: The specification marks entity code `115` as deleted.
    case italianSomaliland
    /// COLOMBIA.
    case colombia
    /// ITU HQ.
    case ituHq
    /// JAN MAYEN.
    case janMayen
    /// JAVA.
    ///
    /// - Note: The specification marks entity code `119` as deleted.
    case java
    /// ECUADOR.
    case ecuador
    /// JERSEY.
    case jersey
    /// JOHNSTON I.
    case johnstonI
    /// JUAN DE NOVA, EUROPA.
    case juanDeNovaEuropa
    /// JUAN FERNANDEZ IS.
    case juanFernandezIs
    /// KALININGRAD.
    case kaliningrad
    /// KAMARAN IS.
    ///
    /// - Note: The specification marks entity code `127` as deleted.
    case kamaranIs
    /// KARELO-FINNISH REPUBLIC.
    ///
    /// - Note: The specification marks entity code `128` as deleted.
    case kareloFinnishRepublic
    /// GUYANA.
    case guyana
    /// KAZAKHSTAN.
    case kazakhstan
    /// KERGUELEN IS.
    case kerguelenIs
    /// PARAGUAY.
    case paraguay
    /// KERMADEC IS.
    case kermadecIs
    /// KINGMAN REEF.
    ///
    /// - Note: The specification marks entity code `134` as deleted.
    case kingmanReef
    /// KYRGYZSTAN.
    case kyrgyzstan
    /// PERU.
    case peru
    /// REPUBLIC OF KOREA.
    case republicOfKorea
    /// KURE I.
    case kureI
    /// KURIA MURIA I.
    ///
    /// - Note: The specification marks entity code `139` as deleted.
    case kuriaMuriaI
    /// SURINAME.
    case suriname
    /// FALKLAND IS.
    case falklandIs
    /// LAKSHADWEEP IS.
    case lakshadweepIs
    /// LAOS.
    case laos
    /// URUGUAY.
    case uruguay
    /// LATVIA.
    case latvia
    /// LITHUANIA.
    case lithuania
    /// LORD HOWE I.
    case lordHoweI
    /// VENEZUELA.
    case venezuela
    /// AZORES.
    case azores
    /// AUSTRALIA.
    case australia
    /// MALYJ VYSOTSKIJ I.
    ///
    /// - Note: The specification marks entity code `151` as deleted.
    case malyjVysotskijI
    /// MACAO.
    case macao
    /// MACQUARIE I.
    case macquarieI
    /// YEMEN ARAB REPUBLIC.
    ///
    /// - Note: The specification marks entity code `154` as deleted.
    case yemenArabRepublic
    /// MALAYA.
    ///
    /// - Note: The specification marks entity code `155` as deleted.
    case malaya
    /// NAURU.
    case nauru
    /// VANUATU.
    case vanuatu
    /// MALDIVES.
    case maldives
    /// TONGA.
    case tonga
    /// MALPELO I.
    case malpeloI
    /// NEW CALEDONIA.
    case newCaledonia
    /// PAPUA NEW GUINEA.
    case papuaNewGuinea
    /// MANCHURIA.
    ///
    /// - Note: The specification marks entity code `164` as deleted.
    case manchuria
    /// MAURITIUS.
    case mauritius
    /// MARIANA IS.
    case marianaIs
    /// MARKET REEF.
    case marketReef
    /// MARSHALL IS.
    case marshallIs
    /// MAYOTTE.
    case mayotte
    /// NEW ZEALAND.
    case newZealand
    /// MELLISH REEF.
    case mellishReef
    /// PITCAIRN I.
    case pitcairnI
    /// MICRONESIA.
    case micronesia
    /// MIDWAY I.
    case midwayI
    /// FRENCH POLYNESIA.
    case frenchPolynesia
    /// FIJI.
    case fiji
    /// MINAMI TORISHIMA.
    case minamiTorishima
    /// MINERVA REEF.
    ///
    /// - Note: The specification marks entity code `178` as deleted.
    case minervaReef
    /// MOLDOVA.
    case moldova
    /// MOUNT ATHOS.
    case mountAthos
    /// MOZAMBIQUE.
    case mozambique
    /// NAVASSA I.
    case navassaI
    /// NETHERLANDS BORNEO.
    ///
    /// - Note: The specification marks entity code `183` as deleted.
    case netherlandsBorneo
    /// NETHERLANDS NEW GUINEA.
    ///
    /// - Note: The specification marks entity code `184` as deleted.
    case netherlandsNewGuinea
    /// SOLOMON IS.
    case solomonIs
    /// NEWFOUNDLAND, LABRADOR.
    ///
    /// - Note: The specification marks entity code `186` as deleted.
    case newfoundlandLabrador
    /// NIGER.
    case niger
    /// NIUE.
    case niue
    /// NORFOLK I.
    case norfolkI
    /// SAMOA.
    case samoa
    /// NORTH COOK IS.
    case northCookIs
    /// OGASAWARA.
    case ogasawara
    /// OKINAWA (RYUKYU IS.).
    ///
    /// - Note: The specification marks entity code `193` as deleted.
    case okinawaRyukyuIs
    /// OKINO TORI-SHIMA.
    ///
    /// - Note: The specification marks entity code `194` as deleted.
    case okinoToriShima
    /// ANNOBON I.
    case annobonI
    /// PALESTINE (Deleted).
    ///
    /// - Note: The specification marks entity code `196` as deleted.
    case palestineDeleted
    /// PALMYRA & JARVIS IS.
    case palmyraJarvisIs
    /// PAPUA TERRITORY.
    ///
    /// - Note: The specification marks entity code `198` as deleted.
    case papuaTerritory
    /// PETER 1 I.
    case peter1I
    /// PORTUGUESE TIMOR.
    ///
    /// - Note: The specification marks entity code `200` as deleted.
    case portugueseTimor
    /// PRINCE EDWARD & MARION IS.
    case princeEdwardMarionIs
    /// PUERTO RICO.
    case puertoRico
    /// ANDORRA.
    case andorra
    /// REVILLAGIGEDO.
    case revillagigedo
    /// ASCENSION I.
    case ascensionI
    /// AUSTRIA.
    case austria
    /// RODRIGUES I.
    case rodriguesI
    /// RUANDA-URUNDI.
    ///
    /// - Note: The specification marks entity code `208` as deleted.
    case ruandaUrundi
    /// BELGIUM.
    case belgium
    /// SAAR.
    ///
    /// - Note: The specification marks entity code `210` as deleted.
    case saar
    /// SABLE I.
    case sableI
    /// BULGARIA.
    case bulgaria
    /// SAINT MARTIN.
    case saintMartin
    /// CORSICA.
    case corsica
    /// CYPRUS.
    case cyprus
    /// SAN ANDRES & PROVIDENCIA.
    case sanAndresProvidencia
    /// SAN FELIX & SAN AMBROSIO.
    case sanFelixSanAmbrosio
    /// CZECHOSLOVAKIA.
    ///
    /// - Note: The specification marks entity code `218` as deleted.
    case czechoslovakia
    /// SAO TOME & PRINCIPE.
    case saoTomePrincipe
    /// SARAWAK.
    ///
    /// - Note: The specification marks entity code `220` as deleted.
    case sarawak
    /// DENMARK.
    case denmark
    /// FAROE IS.
    case faroeIs
    /// ENGLAND.
    case england
    /// FINLAND.
    case finland
    /// SARDINIA.
    case sardinia
    /// SAUDI ARABIA/IRAQ NEUTRAL ZONE.
    ///
    /// - Note: The specification marks entity code `226` as deleted.
    case saudiArabiaIraqNeutral
    /// FRANCE.
    case france
    /// SERRANA BANK & RONCADOR CAY.
    ///
    /// - Note: The specification marks entity code `228` as deleted.
    case serranaBankRoncadorCay
    /// GERMAN DEMOCRATIC REPUBLIC.
    ///
    /// - Note: The specification marks entity code `229` as deleted.
    case germanDemocraticRepublic
    /// FEDERAL REPUBLIC OF GERMANY.
    case federalRepublicOfGermany
    /// SIKKIM.
    ///
    /// - Note: The specification marks entity code `231` as deleted.
    case sikkim
    /// SOMALIA.
    case somalia
    /// GIBRALTAR.
    case gibraltar
    /// SOUTH COOK IS.
    case southCookIs
    /// SOUTH GEORGIA I.
    case southGeorgiaI
    /// GREECE.
    case greece
    /// GREENLAND.
    case greenland
    /// SOUTH ORKNEY IS.
    case southOrkneyIs
    /// HUNGARY.
    case hungary
    /// SOUTH SANDWICH IS.
    case southSandwichIs
    /// SOUTH SHETLAND IS.
    case southShetlandIs
    /// ICELAND.
    case iceland
    /// PEOPLE'S DEMOCRATIC REP. OF YEMEN.
    ///
    /// - Note: The specification marks entity code `243` as deleted.
    case peopleSDemocraticRep
    /// SOUTHERN SUDAN.
    ///
    /// - Note: The specification marks entity code `244` as deleted.
    case southernSudan
    /// IRELAND.
    case ireland
    /// SOVEREIGN MILITARY ORDER OF MALTA.
    case sovereignMilitaryOrderOf
    /// SPRATLY IS.
    case spratlyIs
    /// ITALY.
    case italy
    /// ST. KITTS & NEVIS.
    case stKittsNevis
    /// ST. HELENA.
    case stHelena
    /// LIECHTENSTEIN.
    case liechtenstein
    /// ST. PAUL I.
    case stPaulI
    /// ST. PETER & ST. PAUL ROCKS.
    case stPeterStPaul
    /// LUXEMBOURG.
    case luxembourg
    /// ST. MAARTEN, SABA, ST. EUSTATIUS.
    ///
    /// - Note: The specification marks entity code `255` as deleted.
    case stMaartenSabaSt
    /// MADEIRA IS.
    case madeiraIs
    /// MALTA.
    case malta
    /// SUMATRA.
    ///
    /// - Note: The specification marks entity code `258` as deleted.
    case sumatra
    /// SVALBARD.
    case svalbard
    /// MONACO.
    case monaco
    /// SWAN IS.
    ///
    /// - Note: The specification marks entity code `261` as deleted.
    case swanIs
    /// TAJIKISTAN.
    case tajikistan
    /// NETHERLANDS.
    case netherlands
    /// TANGIER.
    ///
    /// - Note: The specification marks entity code `264` as deleted.
    case tangier
    /// NORTHERN IRELAND.
    case northernIreland
    /// NORWAY.
    case norway
    /// TERRITORY OF NEW GUINEA.
    ///
    /// - Note: The specification marks entity code `267` as deleted.
    case territoryOfNewGuinea
    /// TIBET.
    ///
    /// - Note: The specification marks entity code `268` as deleted.
    case tibet
    /// POLAND.
    case poland
    /// TOKELAU IS.
    case tokelauIs
    /// TRIESTE.
    ///
    /// - Note: The specification marks entity code `271` as deleted.
    case trieste
    /// PORTUGAL.
    case portugal
    /// TRINDADE & MARTIM VAZ IS.
    case trindadeMartimVazIs
    /// TRISTAN DA CUNHA & GOUGH I.
    case tristanDaCunhaGough
    /// ROMANIA.
    case romania
    /// TROMELIN I.
    case tromelinI
    /// ST. PIERRE & MIQUELON.
    case stPierreMiquelon
    /// SAN MARINO.
    case sanMarino
    /// SCOTLAND.
    case scotland
    /// TURKMENISTAN.
    case turkmenistan
    /// SPAIN.
    case spain
    /// TUVALU.
    case tuvalu
    /// UK SOVEREIGN BASE AREAS ON CYPRUS.
    case ukSovereignBaseAreas
    /// SWEDEN.
    case sweden
    /// VIRGIN IS.
    case virginIs
    /// UGANDA.
    case uganda
    /// SWITZERLAND.
    case switzerland
    /// UKRAINE.
    case ukraine
    /// UNITED NATIONS HQ.
    case unitedNationsHq
    /// UNITED STATES OF AMERICA.
    case unitedStatesOfAmerica
    /// UZBEKISTAN.
    case uzbekistan
    /// VIET NAM.
    case vietNam
    /// WALES.
    case wales
    /// VATICAN.
    case vatican
    /// SERBIA.
    case serbia
    /// WAKE I.
    case wakeI
    /// WALLIS & FUTUNA IS.
    case wallisFutunaIs
    /// WEST MALAYSIA.
    case westMalaysia
    /// W. KIRIBATI (GILBERT IS. ).
    case wKiribatiGilbertIs
    /// WESTERN SAHARA.
    case westernSahara
    /// WILLIS I.
    case willisI
    /// BAHRAIN.
    case bahrain
    /// BANGLADESH.
    case bangladesh
    /// BHUTAN.
    case bhutan
    /// ZANZIBAR.
    ///
    /// - Note: The specification marks entity code `307` as deleted.
    case zanzibar
    /// COSTA RICA.
    case costaRica
    /// MYANMAR.
    case myanmar
    /// CAMBODIA.
    case cambodia
    /// SRI LANKA.
    case sriLanka
    /// CHINA.
    case china
    /// HONG KONG.
    case hongKong
    /// INDIA.
    case india
    /// INDONESIA.
    case indonesia
    /// IRAN.
    case iran
    /// IRAQ.
    case iraq
    /// ISRAEL.
    case israel
    /// JAPAN.
    case japan
    /// JORDAN.
    case jordan
    /// DEMOCRATIC PEOPLE'S REP. OF KOREA.
    case democraticPeopleSRep
    /// BRUNEI DARUSSALAM.
    case bruneiDarussalam
    /// KUWAIT.
    case kuwait
    /// LEBANON.
    case lebanon
    /// MONGOLIA.
    case mongolia
    /// NEPAL.
    case nepal
    /// OMAN.
    case oman
    /// PAKISTAN.
    case pakistan
    /// PHILIPPINES.
    case philippines
    /// QATAR.
    case qatar
    /// SAUDI ARABIA.
    case saudiArabia
    /// SEYCHELLES.
    case seychelles
    /// SINGAPORE.
    case singapore
    /// DJIBOUTI.
    case djibouti
    /// SYRIA.
    case syria
    /// TAIWAN.
    case taiwan
    /// THAILAND.
    case thailand
    /// TURKEY.
    case turkey
    /// UNITED ARAB EMIRATES.
    case unitedArabEmirates
    /// ALGERIA.
    case algeria
    /// ANGOLA.
    case angola
    /// BOTSWANA.
    case botswana
    /// BURUNDI.
    case burundi
    /// CAMEROON.
    case cameroon
    /// CENTRAL AFRICA.
    case centralAfrica
    /// CAPE VERDE.
    case capeVerde
    /// CHAD.
    case chad
    /// COMOROS.
    case comoros
    /// REPUBLIC OF THE CONGO.
    case republicOfTheCongo
    /// DEMOCRATIC REPUBLIC OF THE CONGO.
    case democraticRepublicOfThe
    /// BENIN.
    case benin
    /// GABON.
    case gabon
    /// THE GAMBIA.
    case theGambia
    /// GHANA.
    case ghana
    /// COTE D'IVOIRE.
    case coteDIvoire
    /// KENYA.
    case kenya
    /// LESOTHO.
    case lesotho
    /// LIBERIA.
    case liberia
    /// LIBYA.
    case libya
    /// MADAGASCAR.
    case madagascar
    /// MALAWI.
    case malawi
    /// MALI.
    case mali
    /// MAURITANIA.
    case mauritania
    /// MOROCCO.
    case morocco
    /// NIGERIA.
    case nigeria
    /// ZIMBABWE.
    case zimbabwe
    /// REUNION I.
    case reunionI
    /// RWANDA.
    case rwanda
    /// SENEGAL.
    case senegal
    /// SIERRA LEONE.
    case sierraLeone
    /// ROTUMA I.
    case rotumaI
    /// REPUBLIC OF SOUTH AFRICA.
    case republicOfSouthAfrica
    /// NAMIBIA.
    case namibia
    /// SUDAN.
    case sudan
    /// KINGDOM OF ESWATINI.
    case kingdomOfEswatini
    /// TANZANIA.
    case tanzania
    /// TUNISIA.
    case tunisia
    /// EGYPT.
    case egypt
    /// BURKINA FASO.
    case burkinaFaso
    /// ZAMBIA.
    case zambia
    /// TOGO.
    case togo
    /// WALVIS BAY.
    ///
    /// - Note: The specification marks entity code `488` as deleted.
    case walvisBay
    /// CONWAY REEF.
    case conwayReef
    /// BANABA I. (OCEAN I.).
    case banabaIOceanI
    /// YEMEN.
    case yemen
    /// PENGUIN IS.
    ///
    /// - Note: The specification marks entity code `493` as deleted.
    case penguinIs
    /// CROATIA.
    case croatia
    /// SLOVENIA.
    case slovenia
    /// BOSNIA-HERZEGOVINA.
    case bosniaHerzegovina
    /// NORTH MACEDONIA (REPUBLIC OF).
    case northMacedoniaRepublicOf
    /// CZECH REPUBLIC.
    case czechRepublic
    /// SLOVAK REPUBLIC.
    case slovakRepublic
    /// PRATAS I.
    case pratasI
    /// SCARBOROUGH REEF.
    case scarboroughReef
    /// TEMOTU PROVINCE.
    case temotuProvince
    /// AUSTRAL I.
    case australI
    /// MARQUESAS IS.
    case marquesasIs
    /// PALESTINE.
    case palestine
    /// TIMOR-LESTE.
    case timorLeste
    /// CHESTERFIELD IS.
    case chesterfieldIs
    /// DUCIE I.
    case ducieI
    /// MONTENEGRO.
    case montenegro
    /// SWAINS I.
    case swainsI
    /// SAINT BARTHELEMY.
    case saintBarthelemy
    /// CURACAO.
    case curacao
    /// SINT MAARTEN.
    case sintMaarten
    /// SABA & ST. EUSTATIUS.
    case sabaStEustatius
    /// BONAIRE.
    case bonaire
    /// SOUTH SUDAN (REPUBLIC OF).
    case southSudanRepublicOf
    /// REPUBLIC OF KOSOVO.
    case republicOfKosovo

    /// A value that this library does not recognize.
    ///
    /// - Important: This case exists so that unrecognized codes survive a
    ///   parse-and-serialize round trip rather than being discarded.
    case unrecognized(String)

    /// Every entity code the specification defines, in specification order,
    /// excluding ``ADIDXCCEntityCode.unrecognized(_:)``.
    public static let allMembers: [ADIDXCCEntityCode] = [
        .noEntity,
        .canada,
        .abuAilIs,
        .afghanistan,
        .agalegaStBrandonIs,
        .alandIs,
        .alaska,
        .albania,
        .aldabra,
        .americanSamoa,
        .amsterdamStPaulIs,
        .andamanNicobarIs,
        .anguilla,
        .antarctica,
        .armenia,
        .asiaticRussia,
        .newZealandSubantarcticIslands,
        .avesI,
        .azerbaijan,
        .bajoNuevo,
        .bakerHowlandIs,
        .balearicIs,
        .palau,
        .blenheimReef,
        .bouvet,
        .britishNorthBorneo,
        .britishSomaliland,
        .belarus,
        .canalZone,
        .canaryIs,
        .celebeMoluccaIs,
        .cKiribatiBritishPhoenix,
        .ceutaMelilla,
        .chagosIs,
        .chathamIs,
        .christmasI,
        .clippertonI,
        .cocosI,
        .cocosKeelingIs,
        .comorosDeleted,
        .crete,
        .crozetI,
        .damaoDiu,
        .desecheoI,
        .desroches,
        .dodecanese,
        .eastMalaysia,
        .easterI,
        .eKiribatiLineIs,
        .equatorialGuinea,
        .mexico,
        .eritrea,
        .estonia,
        .ethiopia,
        .europeanRussia,
        .farquhar,
        .fernandoDeNoronha,
        .frenchEquatorialAfrica,
        .frenchIndoChina,
        .frenchWestAfrica,
        .bahamas,
        .franzJosefLand,
        .barbados,
        .frenchGuiana,
        .bermuda,
        .britishVirginIs,
        .belize,
        .frenchIndia,
        .kuwaitSaudiArabiaNeutral,
        .caymanIs,
        .cuba,
        .galapagosIs,
        .dominicanRepublic,
        .elSalvador,
        .georgia,
        .guatemala,
        .grenada,
        .haiti,
        .guadeloupe,
        .honduras,
        .germany,
        .jamaica,
        .martinique,
        .bonaireCuracao,
        .nicaragua,
        .panama,
        .turksCaicosIs,
        .trinidadTobago,
        .aruba,
        .geyserReef,
        .antiguaBarbuda,
        .dominica,
        .montserrat,
        .stLucia,
        .stVincent,
        .gloriosoIs,
        .argentina,
        .goa,
        .goldCoastTogoland,
        .guam,
        .bolivia,
        .guantanamoBay,
        .guernsey,
        .guinea,
        .brazil,
        .guineaBissau,
        .hawaii,
        .heardI,
        .chile,
        .ifni,
        .isleOfMan,
        .italianSomaliland,
        .colombia,
        .ituHq,
        .janMayen,
        .java,
        .ecuador,
        .jersey,
        .johnstonI,
        .juanDeNovaEuropa,
        .juanFernandezIs,
        .kaliningrad,
        .kamaranIs,
        .kareloFinnishRepublic,
        .guyana,
        .kazakhstan,
        .kerguelenIs,
        .paraguay,
        .kermadecIs,
        .kingmanReef,
        .kyrgyzstan,
        .peru,
        .republicOfKorea,
        .kureI,
        .kuriaMuriaI,
        .suriname,
        .falklandIs,
        .lakshadweepIs,
        .laos,
        .uruguay,
        .latvia,
        .lithuania,
        .lordHoweI,
        .venezuela,
        .azores,
        .australia,
        .malyjVysotskijI,
        .macao,
        .macquarieI,
        .yemenArabRepublic,
        .malaya,
        .nauru,
        .vanuatu,
        .maldives,
        .tonga,
        .malpeloI,
        .newCaledonia,
        .papuaNewGuinea,
        .manchuria,
        .mauritius,
        .marianaIs,
        .marketReef,
        .marshallIs,
        .mayotte,
        .newZealand,
        .mellishReef,
        .pitcairnI,
        .micronesia,
        .midwayI,
        .frenchPolynesia,
        .fiji,
        .minamiTorishima,
        .minervaReef,
        .moldova,
        .mountAthos,
        .mozambique,
        .navassaI,
        .netherlandsBorneo,
        .netherlandsNewGuinea,
        .solomonIs,
        .newfoundlandLabrador,
        .niger,
        .niue,
        .norfolkI,
        .samoa,
        .northCookIs,
        .ogasawara,
        .okinawaRyukyuIs,
        .okinoToriShima,
        .annobonI,
        .palestineDeleted,
        .palmyraJarvisIs,
        .papuaTerritory,
        .peter1I,
        .portugueseTimor,
        .princeEdwardMarionIs,
        .puertoRico,
        .andorra,
        .revillagigedo,
        .ascensionI,
        .austria,
        .rodriguesI,
        .ruandaUrundi,
        .belgium,
        .saar,
        .sableI,
        .bulgaria,
        .saintMartin,
        .corsica,
        .cyprus,
        .sanAndresProvidencia,
        .sanFelixSanAmbrosio,
        .czechoslovakia,
        .saoTomePrincipe,
        .sarawak,
        .denmark,
        .faroeIs,
        .england,
        .finland,
        .sardinia,
        .saudiArabiaIraqNeutral,
        .france,
        .serranaBankRoncadorCay,
        .germanDemocraticRepublic,
        .federalRepublicOfGermany,
        .sikkim,
        .somalia,
        .gibraltar,
        .southCookIs,
        .southGeorgiaI,
        .greece,
        .greenland,
        .southOrkneyIs,
        .hungary,
        .southSandwichIs,
        .southShetlandIs,
        .iceland,
        .peopleSDemocraticRep,
        .southernSudan,
        .ireland,
        .sovereignMilitaryOrderOf,
        .spratlyIs,
        .italy,
        .stKittsNevis,
        .stHelena,
        .liechtenstein,
        .stPaulI,
        .stPeterStPaul,
        .luxembourg,
        .stMaartenSabaSt,
        .madeiraIs,
        .malta,
        .sumatra,
        .svalbard,
        .monaco,
        .swanIs,
        .tajikistan,
        .netherlands,
        .tangier,
        .northernIreland,
        .norway,
        .territoryOfNewGuinea,
        .tibet,
        .poland,
        .tokelauIs,
        .trieste,
        .portugal,
        .trindadeMartimVazIs,
        .tristanDaCunhaGough,
        .romania,
        .tromelinI,
        .stPierreMiquelon,
        .sanMarino,
        .scotland,
        .turkmenistan,
        .spain,
        .tuvalu,
        .ukSovereignBaseAreas,
        .sweden,
        .virginIs,
        .uganda,
        .switzerland,
        .ukraine,
        .unitedNationsHq,
        .unitedStatesOfAmerica,
        .uzbekistan,
        .vietNam,
        .wales,
        .vatican,
        .serbia,
        .wakeI,
        .wallisFutunaIs,
        .westMalaysia,
        .wKiribatiGilbertIs,
        .westernSahara,
        .willisI,
        .bahrain,
        .bangladesh,
        .bhutan,
        .zanzibar,
        .costaRica,
        .myanmar,
        .cambodia,
        .sriLanka,
        .china,
        .hongKong,
        .india,
        .indonesia,
        .iran,
        .iraq,
        .israel,
        .japan,
        .jordan,
        .democraticPeopleSRep,
        .bruneiDarussalam,
        .kuwait,
        .lebanon,
        .mongolia,
        .nepal,
        .oman,
        .pakistan,
        .philippines,
        .qatar,
        .saudiArabia,
        .seychelles,
        .singapore,
        .djibouti,
        .syria,
        .taiwan,
        .thailand,
        .turkey,
        .unitedArabEmirates,
        .algeria,
        .angola,
        .botswana,
        .burundi,
        .cameroon,
        .centralAfrica,
        .capeVerde,
        .chad,
        .comoros,
        .republicOfTheCongo,
        .democraticRepublicOfThe,
        .benin,
        .gabon,
        .theGambia,
        .ghana,
        .coteDIvoire,
        .kenya,
        .lesotho,
        .liberia,
        .libya,
        .madagascar,
        .malawi,
        .mali,
        .mauritania,
        .morocco,
        .nigeria,
        .zimbabwe,
        .reunionI,
        .rwanda,
        .senegal,
        .sierraLeone,
        .rotumaI,
        .republicOfSouthAfrica,
        .namibia,
        .sudan,
        .kingdomOfEswatini,
        .tanzania,
        .tunisia,
        .egypt,
        .burkinaFaso,
        .zambia,
        .togo,
        .walvisBay,
        .conwayReef,
        .banabaIOceanI,
        .yemen,
        .penguinIs,
        .croatia,
        .slovenia,
        .bosniaHerzegovina,
        .northMacedoniaRepublicOf,
        .czechRepublic,
        .slovakRepublic,
        .pratasI,
        .scarboroughReef,
        .temotuProvince,
        .australI,
        .marquesasIs,
        .palestine,
        .timorLeste,
        .chesterfieldIs,
        .ducieI,
        .montenegro,
        .swainsI,
        .saintBarthelemy,
        .curacao,
        .sintMaarten,
        .sabaStEustatius,
        .bonaire,
        .southSudanRepublicOf,
        .republicOfKosovo,
    ]

    /// The values the specification marks as import-only.
    ///
    /// - Note: The specification marks no entity code as import-only.
    public static let importOnlyMembers: Set<String> = []

    /// The entity name the specification gives this code.
    ///
    /// - Note: Undefined codes report the code itself, because the
    ///   specification names no entity for them.
    public var name: String {
        Self.namesByCode[description] ?? description
    }

    /// Whether the specification marks this entity code as deleted.
    ///
    /// - Note: A deleted code is one the specification has retired. It remains
    ///   readable so that an old log still resolves, but it is no longer a
    ///   code the specification issues.
    public var isDeleted: Bool {
        Self.deletedCodes.contains(description)
    }

    /// The entity code, in the canonical form the specification uses.
    public var description: String {
        switch self {
        case .noEntity:
            "0"
        case .canada:
            "1"
        case .abuAilIs:
            "2"
        case .afghanistan:
            "3"
        case .agalegaStBrandonIs:
            "4"
        case .alandIs:
            "5"
        case .alaska:
            "6"
        case .albania:
            "7"
        case .aldabra:
            "8"
        case .americanSamoa:
            "9"
        case .amsterdamStPaulIs:
            "10"
        case .andamanNicobarIs:
            "11"
        case .anguilla:
            "12"
        case .antarctica:
            "13"
        case .armenia:
            "14"
        case .asiaticRussia:
            "15"
        case .newZealandSubantarcticIslands:
            "16"
        case .avesI:
            "17"
        case .azerbaijan:
            "18"
        case .bajoNuevo:
            "19"
        case .bakerHowlandIs:
            "20"
        case .balearicIs:
            "21"
        case .palau:
            "22"
        case .blenheimReef:
            "23"
        case .bouvet:
            "24"
        case .britishNorthBorneo:
            "25"
        case .britishSomaliland:
            "26"
        case .belarus:
            "27"
        case .canalZone:
            "28"
        case .canaryIs:
            "29"
        case .celebeMoluccaIs:
            "30"
        case .cKiribatiBritishPhoenix:
            "31"
        case .ceutaMelilla:
            "32"
        case .chagosIs:
            "33"
        case .chathamIs:
            "34"
        case .christmasI:
            "35"
        case .clippertonI:
            "36"
        case .cocosI:
            "37"
        case .cocosKeelingIs:
            "38"
        case .comorosDeleted:
            "39"
        case .crete:
            "40"
        case .crozetI:
            "41"
        case .damaoDiu:
            "42"
        case .desecheoI:
            "43"
        case .desroches:
            "44"
        case .dodecanese:
            "45"
        case .eastMalaysia:
            "46"
        case .easterI:
            "47"
        case .eKiribatiLineIs:
            "48"
        case .equatorialGuinea:
            "49"
        case .mexico:
            "50"
        case .eritrea:
            "51"
        case .estonia:
            "52"
        case .ethiopia:
            "53"
        case .europeanRussia:
            "54"
        case .farquhar:
            "55"
        case .fernandoDeNoronha:
            "56"
        case .frenchEquatorialAfrica:
            "57"
        case .frenchIndoChina:
            "58"
        case .frenchWestAfrica:
            "59"
        case .bahamas:
            "60"
        case .franzJosefLand:
            "61"
        case .barbados:
            "62"
        case .frenchGuiana:
            "63"
        case .bermuda:
            "64"
        case .britishVirginIs:
            "65"
        case .belize:
            "66"
        case .frenchIndia:
            "67"
        case .kuwaitSaudiArabiaNeutral:
            "68"
        case .caymanIs:
            "69"
        case .cuba:
            "70"
        case .galapagosIs:
            "71"
        case .dominicanRepublic:
            "72"
        case .elSalvador:
            "74"
        case .georgia:
            "75"
        case .guatemala:
            "76"
        case .grenada:
            "77"
        case .haiti:
            "78"
        case .guadeloupe:
            "79"
        case .honduras:
            "80"
        case .germany:
            "81"
        case .jamaica:
            "82"
        case .martinique:
            "84"
        case .bonaireCuracao:
            "85"
        case .nicaragua:
            "86"
        case .panama:
            "88"
        case .turksCaicosIs:
            "89"
        case .trinidadTobago:
            "90"
        case .aruba:
            "91"
        case .geyserReef:
            "93"
        case .antiguaBarbuda:
            "94"
        case .dominica:
            "95"
        case .montserrat:
            "96"
        case .stLucia:
            "97"
        case .stVincent:
            "98"
        case .gloriosoIs:
            "99"
        case .argentina:
            "100"
        case .goa:
            "101"
        case .goldCoastTogoland:
            "102"
        case .guam:
            "103"
        case .bolivia:
            "104"
        case .guantanamoBay:
            "105"
        case .guernsey:
            "106"
        case .guinea:
            "107"
        case .brazil:
            "108"
        case .guineaBissau:
            "109"
        case .hawaii:
            "110"
        case .heardI:
            "111"
        case .chile:
            "112"
        case .ifni:
            "113"
        case .isleOfMan:
            "114"
        case .italianSomaliland:
            "115"
        case .colombia:
            "116"
        case .ituHq:
            "117"
        case .janMayen:
            "118"
        case .java:
            "119"
        case .ecuador:
            "120"
        case .jersey:
            "122"
        case .johnstonI:
            "123"
        case .juanDeNovaEuropa:
            "124"
        case .juanFernandezIs:
            "125"
        case .kaliningrad:
            "126"
        case .kamaranIs:
            "127"
        case .kareloFinnishRepublic:
            "128"
        case .guyana:
            "129"
        case .kazakhstan:
            "130"
        case .kerguelenIs:
            "131"
        case .paraguay:
            "132"
        case .kermadecIs:
            "133"
        case .kingmanReef:
            "134"
        case .kyrgyzstan:
            "135"
        case .peru:
            "136"
        case .republicOfKorea:
            "137"
        case .kureI:
            "138"
        case .kuriaMuriaI:
            "139"
        case .suriname:
            "140"
        case .falklandIs:
            "141"
        case .lakshadweepIs:
            "142"
        case .laos:
            "143"
        case .uruguay:
            "144"
        case .latvia:
            "145"
        case .lithuania:
            "146"
        case .lordHoweI:
            "147"
        case .venezuela:
            "148"
        case .azores:
            "149"
        case .australia:
            "150"
        case .malyjVysotskijI:
            "151"
        case .macao:
            "152"
        case .macquarieI:
            "153"
        case .yemenArabRepublic:
            "154"
        case .malaya:
            "155"
        case .nauru:
            "157"
        case .vanuatu:
            "158"
        case .maldives:
            "159"
        case .tonga:
            "160"
        case .malpeloI:
            "161"
        case .newCaledonia:
            "162"
        case .papuaNewGuinea:
            "163"
        case .manchuria:
            "164"
        case .mauritius:
            "165"
        case .marianaIs:
            "166"
        case .marketReef:
            "167"
        case .marshallIs:
            "168"
        case .mayotte:
            "169"
        case .newZealand:
            "170"
        case .mellishReef:
            "171"
        case .pitcairnI:
            "172"
        case .micronesia:
            "173"
        case .midwayI:
            "174"
        case .frenchPolynesia:
            "175"
        case .fiji:
            "176"
        case .minamiTorishima:
            "177"
        case .minervaReef:
            "178"
        case .moldova:
            "179"
        case .mountAthos:
            "180"
        case .mozambique:
            "181"
        case .navassaI:
            "182"
        case .netherlandsBorneo:
            "183"
        case .netherlandsNewGuinea:
            "184"
        case .solomonIs:
            "185"
        case .newfoundlandLabrador:
            "186"
        case .niger:
            "187"
        case .niue:
            "188"
        case .norfolkI:
            "189"
        case .samoa:
            "190"
        case .northCookIs:
            "191"
        case .ogasawara:
            "192"
        case .okinawaRyukyuIs:
            "193"
        case .okinoToriShima:
            "194"
        case .annobonI:
            "195"
        case .palestineDeleted:
            "196"
        case .palmyraJarvisIs:
            "197"
        case .papuaTerritory:
            "198"
        case .peter1I:
            "199"
        case .portugueseTimor:
            "200"
        case .princeEdwardMarionIs:
            "201"
        case .puertoRico:
            "202"
        case .andorra:
            "203"
        case .revillagigedo:
            "204"
        case .ascensionI:
            "205"
        case .austria:
            "206"
        case .rodriguesI:
            "207"
        case .ruandaUrundi:
            "208"
        case .belgium:
            "209"
        case .saar:
            "210"
        case .sableI:
            "211"
        case .bulgaria:
            "212"
        case .saintMartin:
            "213"
        case .corsica:
            "214"
        case .cyprus:
            "215"
        case .sanAndresProvidencia:
            "216"
        case .sanFelixSanAmbrosio:
            "217"
        case .czechoslovakia:
            "218"
        case .saoTomePrincipe:
            "219"
        case .sarawak:
            "220"
        case .denmark:
            "221"
        case .faroeIs:
            "222"
        case .england:
            "223"
        case .finland:
            "224"
        case .sardinia:
            "225"
        case .saudiArabiaIraqNeutral:
            "226"
        case .france:
            "227"
        case .serranaBankRoncadorCay:
            "228"
        case .germanDemocraticRepublic:
            "229"
        case .federalRepublicOfGermany:
            "230"
        case .sikkim:
            "231"
        case .somalia:
            "232"
        case .gibraltar:
            "233"
        case .southCookIs:
            "234"
        case .southGeorgiaI:
            "235"
        case .greece:
            "236"
        case .greenland:
            "237"
        case .southOrkneyIs:
            "238"
        case .hungary:
            "239"
        case .southSandwichIs:
            "240"
        case .southShetlandIs:
            "241"
        case .iceland:
            "242"
        case .peopleSDemocraticRep:
            "243"
        case .southernSudan:
            "244"
        case .ireland:
            "245"
        case .sovereignMilitaryOrderOf:
            "246"
        case .spratlyIs:
            "247"
        case .italy:
            "248"
        case .stKittsNevis:
            "249"
        case .stHelena:
            "250"
        case .liechtenstein:
            "251"
        case .stPaulI:
            "252"
        case .stPeterStPaul:
            "253"
        case .luxembourg:
            "254"
        case .stMaartenSabaSt:
            "255"
        case .madeiraIs:
            "256"
        case .malta:
            "257"
        case .sumatra:
            "258"
        case .svalbard:
            "259"
        case .monaco:
            "260"
        case .swanIs:
            "261"
        case .tajikistan:
            "262"
        case .netherlands:
            "263"
        case .tangier:
            "264"
        case .northernIreland:
            "265"
        case .norway:
            "266"
        case .territoryOfNewGuinea:
            "267"
        case .tibet:
            "268"
        case .poland:
            "269"
        case .tokelauIs:
            "270"
        case .trieste:
            "271"
        case .portugal:
            "272"
        case .trindadeMartimVazIs:
            "273"
        case .tristanDaCunhaGough:
            "274"
        case .romania:
            "275"
        case .tromelinI:
            "276"
        case .stPierreMiquelon:
            "277"
        case .sanMarino:
            "278"
        case .scotland:
            "279"
        case .turkmenistan:
            "280"
        case .spain:
            "281"
        case .tuvalu:
            "282"
        case .ukSovereignBaseAreas:
            "283"
        case .sweden:
            "284"
        case .virginIs:
            "285"
        case .uganda:
            "286"
        case .switzerland:
            "287"
        case .ukraine:
            "288"
        case .unitedNationsHq:
            "289"
        case .unitedStatesOfAmerica:
            "291"
        case .uzbekistan:
            "292"
        case .vietNam:
            "293"
        case .wales:
            "294"
        case .vatican:
            "295"
        case .serbia:
            "296"
        case .wakeI:
            "297"
        case .wallisFutunaIs:
            "298"
        case .westMalaysia:
            "299"
        case .wKiribatiGilbertIs:
            "301"
        case .westernSahara:
            "302"
        case .willisI:
            "303"
        case .bahrain:
            "304"
        case .bangladesh:
            "305"
        case .bhutan:
            "306"
        case .zanzibar:
            "307"
        case .costaRica:
            "308"
        case .myanmar:
            "309"
        case .cambodia:
            "312"
        case .sriLanka:
            "315"
        case .china:
            "318"
        case .hongKong:
            "321"
        case .india:
            "324"
        case .indonesia:
            "327"
        case .iran:
            "330"
        case .iraq:
            "333"
        case .israel:
            "336"
        case .japan:
            "339"
        case .jordan:
            "342"
        case .democraticPeopleSRep:
            "344"
        case .bruneiDarussalam:
            "345"
        case .kuwait:
            "348"
        case .lebanon:
            "354"
        case .mongolia:
            "363"
        case .nepal:
            "369"
        case .oman:
            "370"
        case .pakistan:
            "372"
        case .philippines:
            "375"
        case .qatar:
            "376"
        case .saudiArabia:
            "378"
        case .seychelles:
            "379"
        case .singapore:
            "381"
        case .djibouti:
            "382"
        case .syria:
            "384"
        case .taiwan:
            "386"
        case .thailand:
            "387"
        case .turkey:
            "390"
        case .unitedArabEmirates:
            "391"
        case .algeria:
            "400"
        case .angola:
            "401"
        case .botswana:
            "402"
        case .burundi:
            "404"
        case .cameroon:
            "406"
        case .centralAfrica:
            "408"
        case .capeVerde:
            "409"
        case .chad:
            "410"
        case .comoros:
            "411"
        case .republicOfTheCongo:
            "412"
        case .democraticRepublicOfThe:
            "414"
        case .benin:
            "416"
        case .gabon:
            "420"
        case .theGambia:
            "422"
        case .ghana:
            "424"
        case .coteDIvoire:
            "428"
        case .kenya:
            "430"
        case .lesotho:
            "432"
        case .liberia:
            "434"
        case .libya:
            "436"
        case .madagascar:
            "438"
        case .malawi:
            "440"
        case .mali:
            "442"
        case .mauritania:
            "444"
        case .morocco:
            "446"
        case .nigeria:
            "450"
        case .zimbabwe:
            "452"
        case .reunionI:
            "453"
        case .rwanda:
            "454"
        case .senegal:
            "456"
        case .sierraLeone:
            "458"
        case .rotumaI:
            "460"
        case .republicOfSouthAfrica:
            "462"
        case .namibia:
            "464"
        case .sudan:
            "466"
        case .kingdomOfEswatini:
            "468"
        case .tanzania:
            "470"
        case .tunisia:
            "474"
        case .egypt:
            "478"
        case .burkinaFaso:
            "480"
        case .zambia:
            "482"
        case .togo:
            "483"
        case .walvisBay:
            "488"
        case .conwayReef:
            "489"
        case .banabaIOceanI:
            "490"
        case .yemen:
            "492"
        case .penguinIs:
            "493"
        case .croatia:
            "497"
        case .slovenia:
            "499"
        case .bosniaHerzegovina:
            "501"
        case .northMacedoniaRepublicOf:
            "502"
        case .czechRepublic:
            "503"
        case .slovakRepublic:
            "504"
        case .pratasI:
            "505"
        case .scarboroughReef:
            "506"
        case .temotuProvince:
            "507"
        case .australI:
            "508"
        case .marquesasIs:
            "509"
        case .palestine:
            "510"
        case .timorLeste:
            "511"
        case .chesterfieldIs:
            "512"
        case .ducieI:
            "513"
        case .montenegro:
            "514"
        case .swainsI:
            "515"
        case .saintBarthelemy:
            "516"
        case .curacao:
            "517"
        case .sintMaarten:
            "518"
        case .sabaStEustatius:
            "519"
        case .bonaire:
            "520"
        case .southSudanRepublicOf:
            "521"
        case .republicOfKosovo:
            "522"
        case let .unrecognized(raw):
            raw
        }
    }

    private static let namesByCode: [String: String] = [
        "0": "None (the contacted station is known to not be within a DXCC entity)",
        "1": "CANADA",
        "2": "ABU AIL IS.",
        "3": "AFGHANISTAN",
        "4": "AGALEGA & ST. BRANDON IS.",
        "5": "ALAND IS.",
        "6": "ALASKA",
        "7": "ALBANIA",
        "8": "ALDABRA",
        "9": "AMERICAN SAMOA",
        "10": "AMSTERDAM & ST. PAUL IS.",
        "11": "ANDAMAN & NICOBAR IS.",
        "12": "ANGUILLA",
        "13": "ANTARCTICA",
        "14": "ARMENIA",
        "15": "ASIATIC RUSSIA",
        "16": "NEW ZEALAND SUBANTARCTIC ISLANDS",
        "17": "AVES I.",
        "18": "AZERBAIJAN",
        "19": "BAJO NUEVO",
        "20": "BAKER & HOWLAND IS.",
        "21": "BALEARIC IS.",
        "22": "PALAU",
        "23": "BLENHEIM REEF",
        "24": "BOUVET",
        "25": "BRITISH NORTH BORNEO",
        "26": "BRITISH SOMALILAND",
        "27": "BELARUS",
        "28": "CANAL ZONE",
        "29": "CANARY IS.",
        "30": "CELEBE & MOLUCCA IS.",
        "31": "C. KIRIBATI (BRITISH PHOENIX IS.)",
        "32": "CEUTA & MELILLA",
        "33": "CHAGOS IS.",
        "34": "CHATHAM IS.",
        "35": "CHRISTMAS I.",
        "36": "CLIPPERTON I.",
        "37": "COCOS I.",
        "38": "COCOS (KEELING) IS.",
        "39": "COMOROS (Deleted)",
        "40": "CRETE",
        "41": "CROZET I.",
        "42": "DAMAO, DIU",
        "43": "DESECHEO I.",
        "44": "DESROCHES",
        "45": "DODECANESE",
        "46": "EAST MALAYSIA",
        "47": "EASTER I.",
        "48": "E. KIRIBATI (LINE IS.)",
        "49": "EQUATORIAL GUINEA",
        "50": "MEXICO",
        "51": "ERITREA",
        "52": "ESTONIA",
        "53": "ETHIOPIA",
        "54": "EUROPEAN RUSSIA",
        "55": "FARQUHAR",
        "56": "FERNANDO DE NORONHA",
        "57": "FRENCH EQUATORIAL AFRICA",
        "58": "FRENCH INDO-CHINA",
        "59": "FRENCH WEST AFRICA",
        "60": "BAHAMAS",
        "61": "FRANZ JOSEF LAND",
        "62": "BARBADOS",
        "63": "FRENCH GUIANA",
        "64": "BERMUDA",
        "65": "BRITISH VIRGIN IS.",
        "66": "BELIZE",
        "67": "FRENCH INDIA",
        "68": "KUWAIT/SAUDI ARABIA NEUTRAL ZONE",
        "69": "CAYMAN IS.",
        "70": "CUBA",
        "71": "GALAPAGOS IS.",
        "72": "DOMINICAN REPUBLIC",
        "74": "EL SALVADOR",
        "75": "GEORGIA",
        "76": "GUATEMALA",
        "77": "GRENADA",
        "78": "HAITI",
        "79": "GUADELOUPE",
        "80": "HONDURAS",
        "81": "GERMANY",
        "82": "JAMAICA",
        "84": "MARTINIQUE",
        "85": "BONAIRE, CURACAO",
        "86": "NICARAGUA",
        "88": "PANAMA",
        "89": "TURKS & CAICOS IS.",
        "90": "TRINIDAD & TOBAGO",
        "91": "ARUBA",
        "93": "GEYSER REEF",
        "94": "ANTIGUA & BARBUDA",
        "95": "DOMINICA",
        "96": "MONTSERRAT",
        "97": "ST. LUCIA",
        "98": "ST. VINCENT",
        "99": "GLORIOSO IS.",
        "100": "ARGENTINA",
        "101": "GOA",
        "102": "GOLD COAST, TOGOLAND",
        "103": "GUAM",
        "104": "BOLIVIA",
        "105": "GUANTANAMO BAY",
        "106": "GUERNSEY",
        "107": "GUINEA",
        "108": "BRAZIL",
        "109": "GUINEA-BISSAU",
        "110": "HAWAII",
        "111": "HEARD I.",
        "112": "CHILE",
        "113": "IFNI",
        "114": "ISLE OF MAN",
        "115": "ITALIAN SOMALILAND",
        "116": "COLOMBIA",
        "117": "ITU HQ",
        "118": "JAN MAYEN",
        "119": "JAVA",
        "120": "ECUADOR",
        "122": "JERSEY",
        "123": "JOHNSTON I.",
        "124": "JUAN DE NOVA, EUROPA",
        "125": "JUAN FERNANDEZ IS.",
        "126": "KALININGRAD",
        "127": "KAMARAN IS.",
        "128": "KARELO-FINNISH REPUBLIC",
        "129": "GUYANA",
        "130": "KAZAKHSTAN",
        "131": "KERGUELEN IS.",
        "132": "PARAGUAY",
        "133": "KERMADEC IS.",
        "134": "KINGMAN REEF",
        "135": "KYRGYZSTAN",
        "136": "PERU",
        "137": "REPUBLIC OF KOREA",
        "138": "KURE I.",
        "139": "KURIA MURIA I.",
        "140": "SURINAME",
        "141": "FALKLAND IS.",
        "142": "LAKSHADWEEP IS.",
        "143": "LAOS",
        "144": "URUGUAY",
        "145": "LATVIA",
        "146": "LITHUANIA",
        "147": "LORD HOWE I.",
        "148": "VENEZUELA",
        "149": "AZORES",
        "150": "AUSTRALIA",
        "151": "MALYJ VYSOTSKIJ I.",
        "152": "MACAO",
        "153": "MACQUARIE I.",
        "154": "YEMEN ARAB REPUBLIC",
        "155": "MALAYA",
        "157": "NAURU",
        "158": "VANUATU",
        "159": "MALDIVES",
        "160": "TONGA",
        "161": "MALPELO I.",
        "162": "NEW CALEDONIA",
        "163": "PAPUA NEW GUINEA",
        "164": "MANCHURIA",
        "165": "MAURITIUS",
        "166": "MARIANA IS.",
        "167": "MARKET REEF",
        "168": "MARSHALL IS.",
        "169": "MAYOTTE",
        "170": "NEW ZEALAND",
        "171": "MELLISH REEF",
        "172": "PITCAIRN I.",
        "173": "MICRONESIA",
        "174": "MIDWAY I.",
        "175": "FRENCH POLYNESIA",
        "176": "FIJI",
        "177": "MINAMI TORISHIMA",
        "178": "MINERVA REEF",
        "179": "MOLDOVA",
        "180": "MOUNT ATHOS",
        "181": "MOZAMBIQUE",
        "182": "NAVASSA I.",
        "183": "NETHERLANDS BORNEO",
        "184": "NETHERLANDS NEW GUINEA",
        "185": "SOLOMON IS.",
        "186": "NEWFOUNDLAND, LABRADOR",
        "187": "NIGER",
        "188": "NIUE",
        "189": "NORFOLK I.",
        "190": "SAMOA",
        "191": "NORTH COOK IS.",
        "192": "OGASAWARA",
        "193": "OKINAWA (RYUKYU IS.)",
        "194": "OKINO TORI-SHIMA",
        "195": "ANNOBON I.",
        "196": "PALESTINE (Deleted)",
        "197": "PALMYRA & JARVIS IS.",
        "198": "PAPUA TERRITORY",
        "199": "PETER 1 I.",
        "200": "PORTUGUESE TIMOR",
        "201": "PRINCE EDWARD & MARION IS.",
        "202": "PUERTO RICO",
        "203": "ANDORRA",
        "204": "REVILLAGIGEDO",
        "205": "ASCENSION I.",
        "206": "AUSTRIA",
        "207": "RODRIGUES I.",
        "208": "RUANDA-URUNDI",
        "209": "BELGIUM",
        "210": "SAAR",
        "211": "SABLE I.",
        "212": "BULGARIA",
        "213": "SAINT MARTIN",
        "214": "CORSICA",
        "215": "CYPRUS",
        "216": "SAN ANDRES & PROVIDENCIA",
        "217": "SAN FELIX & SAN AMBROSIO",
        "218": "CZECHOSLOVAKIA",
        "219": "SAO TOME & PRINCIPE",
        "220": "SARAWAK",
        "221": "DENMARK",
        "222": "FAROE IS.",
        "223": "ENGLAND",
        "224": "FINLAND",
        "225": "SARDINIA",
        "226": "SAUDI ARABIA/IRAQ NEUTRAL ZONE",
        "227": "FRANCE",
        "228": "SERRANA BANK & RONCADOR CAY",
        "229": "GERMAN DEMOCRATIC REPUBLIC",
        "230": "FEDERAL REPUBLIC OF GERMANY",
        "231": "SIKKIM",
        "232": "SOMALIA",
        "233": "GIBRALTAR",
        "234": "SOUTH COOK IS.",
        "235": "SOUTH GEORGIA I.",
        "236": "GREECE",
        "237": "GREENLAND",
        "238": "SOUTH ORKNEY IS.",
        "239": "HUNGARY",
        "240": "SOUTH SANDWICH IS.",
        "241": "SOUTH SHETLAND IS.",
        "242": "ICELAND",
        "243": "PEOPLE'S DEMOCRATIC REP. OF YEMEN",
        "244": "SOUTHERN SUDAN",
        "245": "IRELAND",
        "246": "SOVEREIGN MILITARY ORDER OF MALTA",
        "247": "SPRATLY IS.",
        "248": "ITALY",
        "249": "ST. KITTS & NEVIS",
        "250": "ST. HELENA",
        "251": "LIECHTENSTEIN",
        "252": "ST. PAUL I.",
        "253": "ST. PETER & ST. PAUL ROCKS",
        "254": "LUXEMBOURG",
        "255": "ST. MAARTEN, SABA, ST. EUSTATIUS",
        "256": "MADEIRA IS.",
        "257": "MALTA",
        "258": "SUMATRA",
        "259": "SVALBARD",
        "260": "MONACO",
        "261": "SWAN IS.",
        "262": "TAJIKISTAN",
        "263": "NETHERLANDS",
        "264": "TANGIER",
        "265": "NORTHERN IRELAND",
        "266": "NORWAY",
        "267": "TERRITORY OF NEW GUINEA",
        "268": "TIBET",
        "269": "POLAND",
        "270": "TOKELAU IS.",
        "271": "TRIESTE",
        "272": "PORTUGAL",
        "273": "TRINDADE & MARTIM VAZ IS.",
        "274": "TRISTAN DA CUNHA & GOUGH I.",
        "275": "ROMANIA",
        "276": "TROMELIN I.",
        "277": "ST. PIERRE & MIQUELON",
        "278": "SAN MARINO",
        "279": "SCOTLAND",
        "280": "TURKMENISTAN",
        "281": "SPAIN",
        "282": "TUVALU",
        "283": "UK SOVEREIGN BASE AREAS ON CYPRUS",
        "284": "SWEDEN",
        "285": "VIRGIN IS.",
        "286": "UGANDA",
        "287": "SWITZERLAND",
        "288": "UKRAINE",
        "289": "UNITED NATIONS HQ",
        "291": "UNITED STATES OF AMERICA",
        "292": "UZBEKISTAN",
        "293": "VIET NAM",
        "294": "WALES",
        "295": "VATICAN",
        "296": "SERBIA",
        "297": "WAKE I.",
        "298": "WALLIS & FUTUNA IS.",
        "299": "WEST MALAYSIA",
        "301": "W. KIRIBATI (GILBERT IS. )",
        "302": "WESTERN SAHARA",
        "303": "WILLIS I.",
        "304": "BAHRAIN",
        "305": "BANGLADESH",
        "306": "BHUTAN",
        "307": "ZANZIBAR",
        "308": "COSTA RICA",
        "309": "MYANMAR",
        "312": "CAMBODIA",
        "315": "SRI LANKA",
        "318": "CHINA",
        "321": "HONG KONG",
        "324": "INDIA",
        "327": "INDONESIA",
        "330": "IRAN",
        "333": "IRAQ",
        "336": "ISRAEL",
        "339": "JAPAN",
        "342": "JORDAN",
        "344": "DEMOCRATIC PEOPLE'S REP. OF KOREA",
        "345": "BRUNEI DARUSSALAM",
        "348": "KUWAIT",
        "354": "LEBANON",
        "363": "MONGOLIA",
        "369": "NEPAL",
        "370": "OMAN",
        "372": "PAKISTAN",
        "375": "PHILIPPINES",
        "376": "QATAR",
        "378": "SAUDI ARABIA",
        "379": "SEYCHELLES",
        "381": "SINGAPORE",
        "382": "DJIBOUTI",
        "384": "SYRIA",
        "386": "TAIWAN",
        "387": "THAILAND",
        "390": "TURKEY",
        "391": "UNITED ARAB EMIRATES",
        "400": "ALGERIA",
        "401": "ANGOLA",
        "402": "BOTSWANA",
        "404": "BURUNDI",
        "406": "CAMEROON",
        "408": "CENTRAL AFRICA",
        "409": "CAPE VERDE",
        "410": "CHAD",
        "411": "COMOROS",
        "412": "REPUBLIC OF THE CONGO",
        "414": "DEMOCRATIC REPUBLIC OF THE CONGO",
        "416": "BENIN",
        "420": "GABON",
        "422": "THE GAMBIA",
        "424": "GHANA",
        "428": "COTE D'IVOIRE",
        "430": "KENYA",
        "432": "LESOTHO",
        "434": "LIBERIA",
        "436": "LIBYA",
        "438": "MADAGASCAR",
        "440": "MALAWI",
        "442": "MALI",
        "444": "MAURITANIA",
        "446": "MOROCCO",
        "450": "NIGERIA",
        "452": "ZIMBABWE",
        "453": "REUNION I.",
        "454": "RWANDA",
        "456": "SENEGAL",
        "458": "SIERRA LEONE",
        "460": "ROTUMA I.",
        "462": "REPUBLIC OF SOUTH AFRICA",
        "464": "NAMIBIA",
        "466": "SUDAN",
        "468": "KINGDOM OF ESWATINI",
        "470": "TANZANIA",
        "474": "TUNISIA",
        "478": "EGYPT",
        "480": "BURKINA FASO",
        "482": "ZAMBIA",
        "483": "TOGO",
        "488": "WALVIS BAY",
        "489": "CONWAY REEF",
        "490": "BANABA I. (OCEAN I.)",
        "492": "YEMEN",
        "493": "PENGUIN IS.",
        "497": "CROATIA",
        "499": "SLOVENIA",
        "501": "BOSNIA-HERZEGOVINA",
        "502": "NORTH MACEDONIA (REPUBLIC OF)",
        "503": "CZECH REPUBLIC",
        "504": "SLOVAK REPUBLIC",
        "505": "PRATAS I.",
        "506": "SCARBOROUGH REEF",
        "507": "TEMOTU PROVINCE",
        "508": "AUSTRAL I.",
        "509": "MARQUESAS IS.",
        "510": "PALESTINE",
        "511": "TIMOR-LESTE",
        "512": "CHESTERFIELD IS.",
        "513": "DUCIE I.",
        "514": "MONTENEGRO",
        "515": "SWAINS I.",
        "516": "SAINT BARTHELEMY",
        "517": "CURACAO",
        "518": "SINT MAARTEN",
        "519": "SABA & ST. EUSTATIUS",
        "520": "BONAIRE",
        "521": "SOUTH SUDAN (REPUBLIC OF)",
        "522": "REPUBLIC OF KOSOVO",
    ]

    private static let deletedCodes: Set<String> = [
        "2",
        "8",
        "19",
        "23",
        "25",
        "26",
        "28",
        "30",
        "39",
        "42",
        "44",
        "55",
        "57",
        "58",
        "59",
        "67",
        "68",
        "81",
        "85",
        "93",
        "101",
        "102",
        "113",
        "115",
        "119",
        "127",
        "128",
        "134",
        "139",
        "151",
        "154",
        "155",
        "164",
        "178",
        "183",
        "184",
        "186",
        "193",
        "194",
        "196",
        "198",
        "200",
        "208",
        "210",
        "218",
        "220",
        "226",
        "228",
        "229",
        "231",
        "243",
        "244",
        "255",
        "258",
        "261",
        "264",
        "267",
        "268",
        "271",
        "307",
        "488",
        "493",
    ]

    private static let membersByValue: [String: ADIDXCCEntityCode] = [
        "0": .noEntity,
        "1": .canada,
        "2": .abuAilIs,
        "3": .afghanistan,
        "4": .agalegaStBrandonIs,
        "5": .alandIs,
        "6": .alaska,
        "7": .albania,
        "8": .aldabra,
        "9": .americanSamoa,
        "10": .amsterdamStPaulIs,
        "11": .andamanNicobarIs,
        "12": .anguilla,
        "13": .antarctica,
        "14": .armenia,
        "15": .asiaticRussia,
        "16": .newZealandSubantarcticIslands,
        "17": .avesI,
        "18": .azerbaijan,
        "19": .bajoNuevo,
        "20": .bakerHowlandIs,
        "21": .balearicIs,
        "22": .palau,
        "23": .blenheimReef,
        "24": .bouvet,
        "25": .britishNorthBorneo,
        "26": .britishSomaliland,
        "27": .belarus,
        "28": .canalZone,
        "29": .canaryIs,
        "30": .celebeMoluccaIs,
        "31": .cKiribatiBritishPhoenix,
        "32": .ceutaMelilla,
        "33": .chagosIs,
        "34": .chathamIs,
        "35": .christmasI,
        "36": .clippertonI,
        "37": .cocosI,
        "38": .cocosKeelingIs,
        "39": .comorosDeleted,
        "40": .crete,
        "41": .crozetI,
        "42": .damaoDiu,
        "43": .desecheoI,
        "44": .desroches,
        "45": .dodecanese,
        "46": .eastMalaysia,
        "47": .easterI,
        "48": .eKiribatiLineIs,
        "49": .equatorialGuinea,
        "50": .mexico,
        "51": .eritrea,
        "52": .estonia,
        "53": .ethiopia,
        "54": .europeanRussia,
        "55": .farquhar,
        "56": .fernandoDeNoronha,
        "57": .frenchEquatorialAfrica,
        "58": .frenchIndoChina,
        "59": .frenchWestAfrica,
        "60": .bahamas,
        "61": .franzJosefLand,
        "62": .barbados,
        "63": .frenchGuiana,
        "64": .bermuda,
        "65": .britishVirginIs,
        "66": .belize,
        "67": .frenchIndia,
        "68": .kuwaitSaudiArabiaNeutral,
        "69": .caymanIs,
        "70": .cuba,
        "71": .galapagosIs,
        "72": .dominicanRepublic,
        "74": .elSalvador,
        "75": .georgia,
        "76": .guatemala,
        "77": .grenada,
        "78": .haiti,
        "79": .guadeloupe,
        "80": .honduras,
        "81": .germany,
        "82": .jamaica,
        "84": .martinique,
        "85": .bonaireCuracao,
        "86": .nicaragua,
        "88": .panama,
        "89": .turksCaicosIs,
        "90": .trinidadTobago,
        "91": .aruba,
        "93": .geyserReef,
        "94": .antiguaBarbuda,
        "95": .dominica,
        "96": .montserrat,
        "97": .stLucia,
        "98": .stVincent,
        "99": .gloriosoIs,
        "100": .argentina,
        "101": .goa,
        "102": .goldCoastTogoland,
        "103": .guam,
        "104": .bolivia,
        "105": .guantanamoBay,
        "106": .guernsey,
        "107": .guinea,
        "108": .brazil,
        "109": .guineaBissau,
        "110": .hawaii,
        "111": .heardI,
        "112": .chile,
        "113": .ifni,
        "114": .isleOfMan,
        "115": .italianSomaliland,
        "116": .colombia,
        "117": .ituHq,
        "118": .janMayen,
        "119": .java,
        "120": .ecuador,
        "122": .jersey,
        "123": .johnstonI,
        "124": .juanDeNovaEuropa,
        "125": .juanFernandezIs,
        "126": .kaliningrad,
        "127": .kamaranIs,
        "128": .kareloFinnishRepublic,
        "129": .guyana,
        "130": .kazakhstan,
        "131": .kerguelenIs,
        "132": .paraguay,
        "133": .kermadecIs,
        "134": .kingmanReef,
        "135": .kyrgyzstan,
        "136": .peru,
        "137": .republicOfKorea,
        "138": .kureI,
        "139": .kuriaMuriaI,
        "140": .suriname,
        "141": .falklandIs,
        "142": .lakshadweepIs,
        "143": .laos,
        "144": .uruguay,
        "145": .latvia,
        "146": .lithuania,
        "147": .lordHoweI,
        "148": .venezuela,
        "149": .azores,
        "150": .australia,
        "151": .malyjVysotskijI,
        "152": .macao,
        "153": .macquarieI,
        "154": .yemenArabRepublic,
        "155": .malaya,
        "157": .nauru,
        "158": .vanuatu,
        "159": .maldives,
        "160": .tonga,
        "161": .malpeloI,
        "162": .newCaledonia,
        "163": .papuaNewGuinea,
        "164": .manchuria,
        "165": .mauritius,
        "166": .marianaIs,
        "167": .marketReef,
        "168": .marshallIs,
        "169": .mayotte,
        "170": .newZealand,
        "171": .mellishReef,
        "172": .pitcairnI,
        "173": .micronesia,
        "174": .midwayI,
        "175": .frenchPolynesia,
        "176": .fiji,
        "177": .minamiTorishima,
        "178": .minervaReef,
        "179": .moldova,
        "180": .mountAthos,
        "181": .mozambique,
        "182": .navassaI,
        "183": .netherlandsBorneo,
        "184": .netherlandsNewGuinea,
        "185": .solomonIs,
        "186": .newfoundlandLabrador,
        "187": .niger,
        "188": .niue,
        "189": .norfolkI,
        "190": .samoa,
        "191": .northCookIs,
        "192": .ogasawara,
        "193": .okinawaRyukyuIs,
        "194": .okinoToriShima,
        "195": .annobonI,
        "196": .palestineDeleted,
        "197": .palmyraJarvisIs,
        "198": .papuaTerritory,
        "199": .peter1I,
        "200": .portugueseTimor,
        "201": .princeEdwardMarionIs,
        "202": .puertoRico,
        "203": .andorra,
        "204": .revillagigedo,
        "205": .ascensionI,
        "206": .austria,
        "207": .rodriguesI,
        "208": .ruandaUrundi,
        "209": .belgium,
        "210": .saar,
        "211": .sableI,
        "212": .bulgaria,
        "213": .saintMartin,
        "214": .corsica,
        "215": .cyprus,
        "216": .sanAndresProvidencia,
        "217": .sanFelixSanAmbrosio,
        "218": .czechoslovakia,
        "219": .saoTomePrincipe,
        "220": .sarawak,
        "221": .denmark,
        "222": .faroeIs,
        "223": .england,
        "224": .finland,
        "225": .sardinia,
        "226": .saudiArabiaIraqNeutral,
        "227": .france,
        "228": .serranaBankRoncadorCay,
        "229": .germanDemocraticRepublic,
        "230": .federalRepublicOfGermany,
        "231": .sikkim,
        "232": .somalia,
        "233": .gibraltar,
        "234": .southCookIs,
        "235": .southGeorgiaI,
        "236": .greece,
        "237": .greenland,
        "238": .southOrkneyIs,
        "239": .hungary,
        "240": .southSandwichIs,
        "241": .southShetlandIs,
        "242": .iceland,
        "243": .peopleSDemocraticRep,
        "244": .southernSudan,
        "245": .ireland,
        "246": .sovereignMilitaryOrderOf,
        "247": .spratlyIs,
        "248": .italy,
        "249": .stKittsNevis,
        "250": .stHelena,
        "251": .liechtenstein,
        "252": .stPaulI,
        "253": .stPeterStPaul,
        "254": .luxembourg,
        "255": .stMaartenSabaSt,
        "256": .madeiraIs,
        "257": .malta,
        "258": .sumatra,
        "259": .svalbard,
        "260": .monaco,
        "261": .swanIs,
        "262": .tajikistan,
        "263": .netherlands,
        "264": .tangier,
        "265": .northernIreland,
        "266": .norway,
        "267": .territoryOfNewGuinea,
        "268": .tibet,
        "269": .poland,
        "270": .tokelauIs,
        "271": .trieste,
        "272": .portugal,
        "273": .trindadeMartimVazIs,
        "274": .tristanDaCunhaGough,
        "275": .romania,
        "276": .tromelinI,
        "277": .stPierreMiquelon,
        "278": .sanMarino,
        "279": .scotland,
        "280": .turkmenistan,
        "281": .spain,
        "282": .tuvalu,
        "283": .ukSovereignBaseAreas,
        "284": .sweden,
        "285": .virginIs,
        "286": .uganda,
        "287": .switzerland,
        "288": .ukraine,
        "289": .unitedNationsHq,
        "291": .unitedStatesOfAmerica,
        "292": .uzbekistan,
        "293": .vietNam,
        "294": .wales,
        "295": .vatican,
        "296": .serbia,
        "297": .wakeI,
        "298": .wallisFutunaIs,
        "299": .westMalaysia,
        "301": .wKiribatiGilbertIs,
        "302": .westernSahara,
        "303": .willisI,
        "304": .bahrain,
        "305": .bangladesh,
        "306": .bhutan,
        "307": .zanzibar,
        "308": .costaRica,
        "309": .myanmar,
        "312": .cambodia,
        "315": .sriLanka,
        "318": .china,
        "321": .hongKong,
        "324": .india,
        "327": .indonesia,
        "330": .iran,
        "333": .iraq,
        "336": .israel,
        "339": .japan,
        "342": .jordan,
        "344": .democraticPeopleSRep,
        "345": .bruneiDarussalam,
        "348": .kuwait,
        "354": .lebanon,
        "363": .mongolia,
        "369": .nepal,
        "370": .oman,
        "372": .pakistan,
        "375": .philippines,
        "376": .qatar,
        "378": .saudiArabia,
        "379": .seychelles,
        "381": .singapore,
        "382": .djibouti,
        "384": .syria,
        "386": .taiwan,
        "387": .thailand,
        "390": .turkey,
        "391": .unitedArabEmirates,
        "400": .algeria,
        "401": .angola,
        "402": .botswana,
        "404": .burundi,
        "406": .cameroon,
        "408": .centralAfrica,
        "409": .capeVerde,
        "410": .chad,
        "411": .comoros,
        "412": .republicOfTheCongo,
        "414": .democraticRepublicOfThe,
        "416": .benin,
        "420": .gabon,
        "422": .theGambia,
        "424": .ghana,
        "428": .coteDIvoire,
        "430": .kenya,
        "432": .lesotho,
        "434": .liberia,
        "436": .libya,
        "438": .madagascar,
        "440": .malawi,
        "442": .mali,
        "444": .mauritania,
        "446": .morocco,
        "450": .nigeria,
        "452": .zimbabwe,
        "453": .reunionI,
        "454": .rwanda,
        "456": .senegal,
        "458": .sierraLeone,
        "460": .rotumaI,
        "462": .republicOfSouthAfrica,
        "464": .namibia,
        "466": .sudan,
        "468": .kingdomOfEswatini,
        "470": .tanzania,
        "474": .tunisia,
        "478": .egypt,
        "480": .burkinaFaso,
        "482": .zambia,
        "483": .togo,
        "488": .walvisBay,
        "489": .conwayReef,
        "490": .banabaIOceanI,
        "492": .yemen,
        "493": .penguinIs,
        "497": .croatia,
        "499": .slovenia,
        "501": .bosniaHerzegovina,
        "502": .northMacedoniaRepublicOf,
        "503": .czechRepublic,
        "504": .slovakRepublic,
        "505": .pratasI,
        "506": .scarboroughReef,
        "507": .temotuProvince,
        "508": .australI,
        "509": .marquesasIs,
        "510": .palestine,
        "511": .timorLeste,
        "512": .chesterfieldIs,
        "513": .ducieI,
        "514": .montenegro,
        "515": .swainsI,
        "516": .saintBarthelemy,
        "517": .curacao,
        "518": .sintMaarten,
        "519": .sabaStEustatius,
        "520": .bonaire,
        "521": .southSudanRepublicOf,
        "522": .republicOfKosovo,
    ]

    /// Creates a value from its entity code.
    ///
    /// - Parameter rawValue: The entity code.
    /// - Returns: The matching member, or `.unrecognized` when `rawValue` is no
    ///   entity code the specification defines.
    public init(rawValue: some StringProtocol) {
        guard let member = Self.membersByValue[String(rawValue)] else {
            self = .unrecognized(rawValue.description)

            return
        }

        self = member
    }
}
