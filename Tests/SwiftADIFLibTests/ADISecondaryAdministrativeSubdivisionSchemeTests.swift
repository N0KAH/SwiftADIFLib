import Testing

@testable import SwiftADIFLib

@Suite("Secondary administrative subdivision schemes")
struct ADISecondaryAdministrativeSubdivisionSchemeTests {
    @Test("Every scheme the specification describes is present")
    func memberCount() {
        #expect(ADISecondaryAdministrativeSubdivisionScheme.allSchemes.count == 19)
    }

    @Test("A scheme reports its name as its description")
    func descriptionIsName() {
        let scheme = ADISecondaryAdministrativeSubdivisionScheme(
            name: "Russian Districts",
            dxccEntityCode: "15",
            dxccEntityName: "Asiatic Russia"
        )

        #expect(scheme.description == "Russian Districts")
    }

    @Test("A scheme says which authority maintains its subdivision list")
    func sponsorAndList() {
        let russian = ADISecondaryAdministrativeSubdivisionScheme.allSchemes.first {
            $0.name == "Russian Districts" && $0.dxccEntityCode == "15"
        }

        #expect(russian?.award == "RDA")
        #expect(russian?.subdivisionList == "RDA List")
        // The specification wraps this sponsor's name in quotes, which have to
        // survive being written into a Swift string literal.
        #expect(russian?.awardSponsor == "Tambov award group (\"TAG\")")
    }

    @Test("A scheme records how its codes are formatted")
    func codeFormat() {
        let alaska = ADISecondaryAdministrativeSubdivisionScheme.allSchemes.first {
            $0.dxccEntityCode == "6"
        }

        #expect(alaska?.name == "U.S. Counties")
        #expect(alaska?.codeFormat == "<Two-letter state abbr.> COMMA <county name>")
    }

    @Test("A scheme counts its subdivisions only where the specification does")
    func countIsOptional() {
        let alaska = ADISecondaryAdministrativeSubdivisionScheme.allSchemes.first {
            $0.dxccEntityCode == "6"
        }
        let hawaii = ADISecondaryAdministrativeSubdivisionScheme.allSchemes.first {
            $0.dxccEntityCode == "110"
        }

        // Alaska's row leaves the count blank; Hawaii's gives one.
        #expect(alaska?.count == nil)
        #expect(hawaii?.count == "5")
    }

    @Test("One scheme is described per DXCC entity rather than once for all of them")
    func schemePerEntity() {
        // The specification shares a scheme down the group of entities it applies
        // to, so Russian Districts appears once per Russian entity.
        let russian = ADISecondaryAdministrativeSubdivisionScheme.schemes(inDXCCEntity: "15")

        #expect(russian.count == 1)
        #expect(russian.first?.name == "Russian Districts")
        #expect(russian.first?.dxccEntityName == "Asiatic Russia")
    }

    @Test("An entity the specification gives no scheme returns none")
    func entityWithNone() {
        #expect(
            ADISecondaryAdministrativeSubdivisionScheme.schemes(inDXCCEntity: "1").isEmpty
        )
    }

    @Test("The alternative enumeration New Zealand defines is not lost")
    func alternativeEnumeration() {
        // Section III.B.23 holds a single row naming NZ_Regions, which describes a
        // scheme in the same terms as section III.B.22.
        // New Zealand has two schemes: NZ Counties from III.B.22 and NZ_Regions
        // from III.B.23, so the lookup has to name the one it means.
        let newZealand = ADISecondaryAdministrativeSubdivisionScheme.allSchemes.first {
            $0.name == "NZ_Regions"
        }

        #expect(newZealand?.dxccEntityCode == "170")
        #expect(newZealand?.dxccEntityName == "New Zealand")
        #expect(newZealand?.subdivisionList == "NZ_Regions")
        #expect(newZealand?.awardSponsor == "NZART")
        #expect(newZealand?.count == nil)
    }

    @Test("One entity can have more than one subdivision scheme")
    func entityWithTwoSchemes() {
        // New Zealand has both the county scheme from III.B.22 and the regional
        // one III.B.23 adds as an alternative.
        let newZealand = ADISecondaryAdministrativeSubdivisionScheme.schemes(inDXCCEntity: "170")

        #expect(newZealand.count == 2)
        #expect(newZealand.map(\.name).sorted() == ["NZ Counties", "NZ_Regions"])
    }

    @Test("A scheme created from its data equals one read from the specification")
    func roundTrip() {
        let created = ADISecondaryAdministrativeSubdivisionScheme(
            name: "U.S. Counties",
            dxccEntityCode: "291",
            dxccEntityName: "United States",
            count: "3068",
            award: "USA-CA",
            subdivisionList: "CountyHunter FIPS 6-4",
            awardSponsor: "CQ Magazine",
            codeFormat: "<Two-letter state abbr.> COMMA <county name>"
        )

        #expect(
            ADISecondaryAdministrativeSubdivisionScheme.allSchemes.contains(created)
        )
    }
}
