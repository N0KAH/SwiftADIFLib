import Testing

@testable import SwiftADIFLib

@Suite("Credits")
struct ADICreditTests {
    @Test("The specification's credit count is modeled")
    func memberCountMatchesSpecification() {
        #expect(ADICredit.allMembers.count == 71)
    }

    @Test("The canonical form of a value is the specification's credit spelling")
    func descriptionIsTheCanonicalSpelling() {
        #expect(ADICredit.cqdx.description == "CQDX")
        #expect(ADICredit.cqdxBand.description == "CQDX_BAND")
        #expect(ADICredit.dxcc.description == "DXCC")
        #expect(ADICredit.iota.description == "IOTA")
    }

    @Test("Every credit resolves to the metadata the specification lists")
    func metadataComesFromTheSpecification() {
        for credit in ADICredit.allMembers {
            let message: Comment = "credit \(credit.description)"
            let resolved = ADICredit(rawValue: credit.description)

            #expect(resolved.sponsor == credit.sponsor, message)
            #expect(resolved.award == credit.award, message)
            #expect(resolved.facet == credit.facet, message)
        }
    }

    @Test("Every credit names a sponsor and an award")
    func metadataIsComplete() {
        for credit in ADICredit.allMembers {
            let message: Comment = "credit \(credit.description)"

            #expect(!credit.sponsor.isEmpty, message)
            #expect(!credit.award.isEmpty, message)
            #expect(!credit.facet.isEmpty, message)
        }
    }

    @Test("A facet-limited credit names the facet it is limited to")
    func facetNamesTheLimitation() {
        #expect(ADICredit.cqdx.facet == "Mixed")
        #expect(ADICredit.cqdxBand.facet == "Band")
        #expect(ADICredit.cqdxMode.facet == "Mode")
        #expect(ADICredit.cqdxSatellite.facet == "Satellite")
    }

    @Test("Credits for the same award are grouped under one sponsor")
    func sponsorIsSharedAcrossAnAwardsCredits() {
        #expect(ADICredit.cqdx.sponsor == "CQ Magazine")
        #expect(ADICredit.cqdxBand.sponsor == "CQ Magazine")
        #expect(ADICredit.cqdxMode.sponsor == "CQ Magazine")

        #expect(ADICredit.dxcc.sponsor != ADICredit.cqdx.sponsor)
    }

    @Test("A credit the specification does not define is kept as unrecognized")
    func unknownCreditsArePreserved() {
        #expect(ADICredit(rawValue: "") == .unrecognized(""))
        #expect(ADICredit(rawValue: "   ") == .unrecognized("   "))
        #expect(ADICredit(rawValue: "CQDX_INVALID") == .unrecognized("CQDX_INVALID"))
        #expect(!ADICredit(rawValue: "CQDX_INVALID").isRecognized)
    }

    @Test("An unrecognized credit keeps the text it was built with")
    func unrecognizedRoundTrip() {
        let future = ADICredit.unrecognized("CQDX_INVALID")

        #expect(future.description == "CQDX_INVALID")
        #expect(future.sponsor == "")
        #expect(!ADICredit.allMembers.contains(future))
    }
}