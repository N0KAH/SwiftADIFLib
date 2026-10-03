import Foundation
import Testing

@testable import SwiftADIFLib

/// One enumeration together with the member counts the specification lists for it.
struct EnumerationFixture: Sendable {
    let name: String
    let type: any ADIEnumeration.Type
    let memberCount: Int
    let importOnlyCount: Int
}

/// Every enumeration the library models, with its specification member counts.
///
/// - Note: Credit and DXCC entity codes are closed value sets, so they are
///   enumerations here even though they also carry specification metadata.
///   Regions and administrative subdivisions are keyed tables rather than
///   enumerations, so they are not listed here.
let enumerationFixtures: [EnumerationFixture] = [
    .init(name: "ADIAntPath", type: ADIAntPath.self, memberCount: 4, importOnlyCount: 0),
    .init(name: "ADIARRLSection", type: ADIARRLSection.self, memberCount: 90, importOnlyCount: 0),
    .init(name: "ADIAward", type: ADIAward.self, memberCount: 29, importOnlyCount: 29),
    .init(name: "ADIBand", type: ADIBand.self, memberCount: 33, importOnlyCount: 0),
    .init(name: "ADIContestID", type: ADIContestID.self, memberCount: 256, importOnlyCount: 4),
    .init(name: "ADIContinent", type: ADIContinent.self, memberCount: 7, importOnlyCount: 0),
    .init(name: "ADICredit", type: ADICredit.self, memberCount: 71, importOnlyCount: 0),
    .init(name: "ADIDXCCEntityCode", type: ADIDXCCEntityCode.self, memberCount: 403, importOnlyCount: 0),
    .init(name: "ADIEQSL_AG", type: ADIEQSL_AG.self, memberCount: 3, importOnlyCount: 0),
    .init(name: "ADIMode", type: ADIMode.self, memberCount: 91, importOnlyCount: 42),
    .init(name: "ADIMorseKeyType", type: ADIMorseKeyType.self, memberCount: 7, importOnlyCount: 0),
    .init(name: "ADIPropagationMode", type: ADIPropagationMode.self, memberCount: 20, importOnlyCount: 0),
    .init(name: "ADIQSLMedium", type: ADIQSLMedium.self, memberCount: 3, importOnlyCount: 0),
    .init(name: "ADIQSLRcvd", type: ADIQSLRcvd.self, memberCount: 5, importOnlyCount: 1),
    .init(name: "ADIQSLSent", type: ADIQSLSent.self, memberCount: 5, importOnlyCount: 0),
    .init(name: "ADIQSLVia", type: ADIQSLVia.self, memberCount: 4, importOnlyCount: 1),
    .init(name: "ADIQSOComplete", type: ADIQSOComplete.self, memberCount: 4, importOnlyCount: 0),
    .init(name: "ADIQSODownloadStatus", type: ADIQSODownloadStatus.self, memberCount: 3, importOnlyCount: 0),
    .init(name: "ADIQSOUploadStatus", type: ADIQSOUploadStatus.self, memberCount: 3, importOnlyCount: 0),
    .init(name: "ADISponsoredAward", type: ADISponsoredAward.self, memberCount: 11, importOnlyCount: 0),
    .init(name: "ADISubmode", type: ADISubmode.self, memberCount: 187, importOnlyCount: 0),
]

@Suite("Enumerations defined by the specification")
struct ADIEnumerationTests {
    @Test("Every enumeration defines the member count the specification lists",
          arguments: enumerationFixtures)
    func memberCountMatchesSpecification(fixture: EnumerationFixture) {
        #expect(fixture.type.allMembers.count == fixture.memberCount)
    }

    @Test("Every enumeration marks the import-only values the specification lists",
          arguments: enumerationFixtures)
    func importOnlyCountMatchesSpecification(fixture: EnumerationFixture) {
        #expect(fixture.type.importOnlyMembers.count == fixture.importOnlyCount)
    }

    @Test("Every defined member survives a round trip through its own value",
          arguments: enumerationFixtures)
    func definedMembersRoundTrip(fixture: EnumerationFixture) {
        for member in fixture.type.allMembers {
            let parsed = fixture.type.init(rawValue: member.description)
            let message: Comment = "\(fixture.name): \(member.description)"

            #expect(parsed.description == member.description, message)
            #expect(parsed.isRecognized, message)
        }
    }

    @Test("Values are matched without regard to case", arguments: enumerationFixtures)
    func parsingIgnoresCase(fixture: EnumerationFixture) {
        for member in fixture.type.allMembers {
            let value = member.description
            let message: Comment = "\(fixture.name): \(value)"

            #expect(fixture.type.init(rawValue: value.lowercased()).isRecognized, message)
            #expect(fixture.type.init(rawValue: value.lowercased()).description == value, message)
            #expect(fixture.type.init(rawValue: value.uppercased()).isRecognized, message)
            #expect(fixture.type.init(rawValue: value.uppercased()).description == value, message)
        }
    }

    @Test("No enumeration defines a value twice", arguments: enumerationFixtures)
    func definedValuesAreUnique(fixture: EnumerationFixture) {
        let values = fixture.type.allMembers.map(\.description)
        let message: Comment = "\(fixture.name)"

        #expect(Set(values).count == values.count, message)
        #expect(Set(values.map { $0.lowercased() }).count == values.count, message)
    }

    @Test("Import-only marking agrees with the import-only value list",
          arguments: enumerationFixtures)
    func importOnlyMarkingAgreesWithList(fixture: EnumerationFixture) {
        for member in fixture.type.allMembers {
            let listed = fixture.type.importOnlyMembers.contains(member.description)
            let message: Comment = "\(fixture.name): \(member.description)"

            #expect(member.isImportOnly == listed, message)
        }
    }

    @Test("A value the specification does not define is kept as unrecognized",
          arguments: enumerationFixtures)
    func unknownValuesArePreserved(fixture: EnumerationFixture) {
        for value in ["", "  ", "ZZ-UNRECOGNIZED"] {
            let parsed = fixture.type.init(rawValue: value)
            let message: Comment = "\(fixture.name): \(value)"

            #expect(!parsed.isRecognized, message)
            #expect(parsed.description == value, message)
        }
    }

    @Test("No defined value is reachable by appending to another defined value",
          arguments: enumerationFixtures)
    func definedValuesDoNotCollideWithDerivedValues(fixture: EnumerationFixture) {
        for member in fixture.type.allMembers {
            let message: Comment = "\(fixture.name): \(member.description)"

            #expect(!fixture.type.init(rawValue: member.description + "-x").isRecognized, message)
        }
    }

    @Test("The specification's full set of closed enumerations is modeled")
    func everyClosedEnumerationIsCoveredByAFixture() {
        let expected = [
            "ADIAntPath", "ADIARRLSection", "ADIAward", "ADIBand", "ADIContestID",
            "ADIContinent", "ADICredit", "ADIDXCCEntityCode", "ADIEQSL_AG", "ADIMode",
            "ADIMorseKeyType", "ADIPropagationMode", "ADIQSLMedium", "ADIQSLRcvd",
            "ADIQSLSent", "ADIQSLVia", "ADIQSOComplete", "ADIQSODownloadStatus",
            "ADIQSOUploadStatus", "ADISponsoredAward", "ADISubmode",
        ]

        #expect(enumerationFixtures.map(\.name) == expected)
        #expect(enumerationFixtures.reduce(0) { $0 + $1.memberCount } == 1239)
    }
}

@Suite("Enumeration values in canonical form")
struct ADIEnumerationCanonicalFormTests {
    @Test("Values that begin with a digit keep the specification's spelling")
    func digitLeadingValues() {
        #expect(ADIBand.band2190m.description == "2190m")
        #expect(ADIBand.band160m.description == "160m")
        #expect(ADIBand.band80m.description == "80m")
        #expect(ADIBand.submm.description == "submm")
        #expect(ADISubmode.submode8psk125.description == "8PSK125")
        #expect(ADIContestID.contestID070160mSprint.description == "070-160M-SPRINT")
    }

    @Test("Capitalized abbreviations are folded to readable case names")
    func capitalizedAbbreviations() {
        #expect(ADISponsoredAward.adif.description == "ADIF_")
        #expect(ADISponsoredAward.arrl.description == "ARRL_")
        #expect(ADIMode.chip.description == "CHIP")
        #expect(ADIMode.psk.description == "PSK")
        #expect(ADIMode.ft8.description == "FT8")
        #expect(ADISubmode.jt9eFast.description == "JT9E FAST")
        #expect(ADISubmode.olivia4125.description == "OLIVIA 4/125")
    }

    @Test("One-letter codes are named for their specification meaning")
    func oneLetterCodes() {
        #expect(ADIQSOComplete.yes.description == "Y")
        #expect(ADIQSOComplete.no.description == "N")
        #expect(ADIQSOComplete.notHeard.description == "NIL")
        #expect(ADIQSOComplete.uncertain.description == "?")
        #expect(ADIEQSL_AG.yes.description == "Y")
        #expect(ADIEQSL_AG.unspecified.description == "U")
        #expect(ADIAntPath.grayline.description == "G")
        #expect(ADIQSLVia.bureau.description == "B")
        #expect(ADIMorseKeyType.straightKey.description == "SK")
        #expect(ADIMorseKeyType.computerDriven.description == "CPU")
    }

    @Test("Abbreviations are named for their specification meaning")
    func abbreviationsNamedForMeaning() {
        #expect(ADIContinent.northAmerica.description == "NA")
        #expect(ADIContinent.antarctica.description == "AN")
        #expect(ADIPropagationMode.aircraftScatter.description == "AS")
        #expect(ADIPropagationMode.earthMoonEarth.description == "EME")
        #expect(ADIPropagationMode.troposphericDucting.description == "TR")
        #expect(ADIAntPath.grayline.description == "G")
    }

    @Test("Distinct multi-word values keep distinguishable names")
    func distinctValuesKeepDistinctNames() {
        #expect(ADIContestID.allAsianDxCw.description == "ALL-ASIAN-DX-CW")
        #expect(ADIContestID.allAsianDxPhone.description == "ALL-ASIAN-DX-PHONE")
        #expect(ADIContestID.allAsianDxCw != ADIContestID.allAsianDxPhone)
        #expect(ADIMode.cw.description == "CW")
        #expect(ADIMode.chip.description == "CHIP")
    }

    @Test("Sections are named for the specification's unique section names")
    func arrlSectionNames() {
        #expect(ADIARRLSection.alabama.description == "AL")
        #expect(ADIARRLSection.alaska.description == "AK")
        #expect(ADIARRLSection.newYorkCityLongIsland.description == "NLI")
        #expect(ADIARRLSection.easternNewYork.description == "ENY")
        #expect(ADIARRLSection.alabama != ADIARRLSection.alaska)
        #expect(ADIARRLSection.easternNewYork != ADIARRLSection.westernNewYork)
    }

    @Test("Punctuation in a value does not alter the canonical spelling")
    func punctuationIsPreserved() {
        #expect(ADIContestID.contestID070160mSprint.description.contains("-"))
        #expect(ADIAward.cqwaz160m.description == "CQWAZ_160m")
        #expect(ADIBand.band125m.description == "1.25m")
        #expect(ADISubmode.olivia4125.description.contains("/"))
        #expect(ADISubmode.psk31.description == "PSK31")
    }

    @Test("Import-only marking follows the specification's markers")
    func importOnlyMarking() {
        #expect(ADIAward.allMembers.allSatisfy { $0.isImportOnly })
        #expect(ADIMode.psk31.isImportOnly)
        #expect(!ADIMode.ssb.isImportOnly)
        #expect(ADIQSLRcvd.verified.isImportOnly)
        #expect(!ADIQSLRcvd.yes.isImportOnly)
        #expect(ADIQSLVia.manager.isImportOnly)
        #expect(!ADIQSLVia.bureau.isImportOnly)
        #expect(ADIContestID.importOnlyMembers == ["EA-RTTY", "RAC", "URE-DX", "VIRGINIA QSO PARTY"])
    }

    @Test("Unrecognized values keep the text they were built with")
    func unrecognizedRoundTrip() {
        let mode = ADIMode.unrecognized("FutureMode")
        let band = ADIBand.unrecognized("FutureBand")
        let complete = ADIQSOComplete.unrecognized("MAYBE")
        let submode = ADISubmode.unrecognized("9psk175")

        #expect(mode.description == "FutureMode")
        #expect(band.description == "FutureBand")
        #expect(complete.description == "MAYBE")
        #expect(submode.description == "9psk175")
        #expect(!mode.isImportOnly)
        #expect(!ADIMode.allMembers.contains(mode))
    }

    @Test("Parsing a value the specification does not define yields the unrecognized case")
    func parsingUnknownValuesYieldsUnrecognized() {
        #expect(ADIMode(rawValue: "FutureMode") == .unrecognized("FutureMode"))
        #expect(ADIBand(rawValue: "FutureBand") == .unrecognized("FutureBand"))
        #expect(ADIQSOComplete(rawValue: "MAYBE") == .unrecognized("MAYBE"))
        #expect(ADISubmode(rawValue: "FutureSubMode") == .unrecognized("FutureSubMode"))

        #expect(!ADIMode(rawValue: "FutureMode").isRecognized)
        #expect(!ADIBand(rawValue: "FutureBand").isRecognized)
        #expect(!ADIQSOComplete(rawValue: "MAYBE").isRecognized)
        #expect(!ADISubmode(rawValue: "FutureSubMode").isRecognized)
        #expect(!ADIMode(rawValue: "FutureMode").isImportOnly)
        #expect(!ADIBand(rawValue: "FutureBand").isImportOnly)
        #expect(!ADIQSOComplete(rawValue: "MAYBE").isImportOnly)
        #expect(!ADISubmode(rawValue: "FutureSubMode").isImportOnly)
    }
}
