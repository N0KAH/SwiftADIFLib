import Testing

@testable import SwiftADIFLib

@Suite("Alaska counties")
struct ADIAlaskaCountyTests {
    @Test("Every county the specification lists is present")
    func memberCount() {
        #expect(ADIAlaskaCounty.allCounties.count == 58)
    }

    @Test("A county reports its code as its description")
    func descriptionIsCode() {
        let county = ADIAlaskaCounty(
            code: "AK,Aleutians East",
            name: "Aleutians East",
            judicialDistrict: "Alaska Third Judicial District"
        )

        #expect(county.description == "AK,Aleutians East")
    }

    @Test("A county code is the state abbreviation, a comma, and the name")
    func codeFormat() {
        // The specification folds the state into the code, so a county's code is
        // not the county name on its own.
        let county = try? #require(ADIAlaskaCounty(code: "AK,Aleutians East"))

        #expect(county?.name == "Aleutians East")
        #expect(county?.code == "AK,Aleutians East")
    }

    @Test("A lookup matches without regard to case")
    func lookupIsCaseInsensitive() throws {
        let county = try #require(ADIAlaskaCounty(code: "ak,aleutians east"))

        #expect(county.name == "Aleutians East")
    }

    @Test("A lookup for an unknown county fails")
    func unknownCode() {
        #expect(ADIAlaskaCounty(code: "AK,Nowhere") == nil)
        #expect(ADIAlaskaCounty(code: "99,Anchorage") == nil)
    }

    @Test("Every county sits in a judicial district")
    func judicialDistricts() {
        #expect(
            ADIAlaskaCounty.allCounties.allSatisfy { !$0.judicialDistrict.isEmpty }
        )
        #expect(Set(ADIAlaskaCounty.allCounties.map(\.judicialDistrict)).count == 4)
    }

    @Test("A retired county is kept and flagged rather than dropped")
    func retiredCounties() {
        let retired = ADIAlaskaCounty.allCounties.filter(\.isDeleted)

        #expect(retired.count == 25)
        #expect(retired.contains { $0.name == "Aleutians Islands" })
        #expect(ADIAlaskaCounty(code: "AK,Aleutians Islands")?.isDeleted == true)
        #expect(ADIAlaskaCounty(code: "AK,Aleutians East")?.isDeleted == false)
    }

    @Test("A county created from its data equals one read from the specification")
    func roundTrip() {
        let created = ADIAlaskaCounty(
            code: "AK,Aleutians East",
            name: "Aleutians East",
            judicialDistrict: "Alaska Third Judicial District"
        )

        #expect(ADIAlaskaCounty.allCounties.contains(created))
        #expect(ADIAlaskaCounty(code: created.code) == created)
    }
}
