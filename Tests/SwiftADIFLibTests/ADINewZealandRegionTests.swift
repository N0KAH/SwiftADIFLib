import Testing

@testable import SwiftADIFLib

@Suite("New Zealand regions")
struct ADINewZealandRegionTests {
    @Test("Every region and district the specification lists is present")
    func memberCount() {
        #expect(ADINewZealandRegion.allRegions.count == 73)
    }

    @Test("A region reports its code as its description")
    func descriptionIsCode() {
        let region = ADINewZealandRegion(
            code: "NZ_Regions:Northland/Far North",
            region: "Northland",
            district: "Far North"
        )

        #expect(region.description == "NZ_Regions:Northland/Far North")
    }

    @Test("A code is the enumeration name, a colon, then region and district")
    func codeFormat() throws {
        let region = try #require(
            ADINewZealandRegion(code: "NZ_Regions:Northland/Far North")
        )

        #expect(region.region == "Northland")
        #expect(region.district == "Far North")
    }

    @Test("A lookup matches without regard to case")
    func lookupIsCaseInsensitive() throws {
        let region = try #require(
            ADINewZealandRegion(code: "nz_regions:auckland/rodney")
        )

        #expect(region.region == "Auckland")
        #expect(region.district == "Rodney")
    }

    @Test("A lookup for an unknown code fails")
    func unknownCode() {
        #expect(ADINewZealandRegion(code: "NZ_Regions:Nowhere/Nowhere") == nil)
    }

    @Test("Every subdivision names both a region and a district")
    func everyEntryIsComplete() {
        #expect(ADINewZealandRegion.allRegions.allSatisfy { !$0.region.isEmpty })
        #expect(ADINewZealandRegion.allRegions.allSatisfy { !$0.district.isEmpty })
    }

    @Test("A region's districts are returned in specification order")
    func districtsInRegion() {
        let northland = ADINewZealandRegion.districts(inRegion: "Northland")

        #expect(northland.count == 3)
        #expect(northland.first?.district == "Far North")
        #expect(northland.allSatisfy { $0.region == "Northland" })
    }

    @Test("A region lookup matches without regard to case")
    func regionLookupIsCaseInsensitive() {
        #expect(ADINewZealandRegion.districts(inRegion: "NORTHLAND").count == 3)
        #expect(ADINewZealandRegion.districts(inRegion: "northland").count == 3)
    }

    @Test("An unknown region returns no districts")
    func unknownRegion() {
        #expect(ADINewZealandRegion.districts(inRegion: "Wellington").isEmpty == false)
        #expect(ADINewZealandRegion.districts(inRegion: "Atlantis").isEmpty)
    }

    @Test("A region created from its data equals one read from the specification")
    func roundTrip() {
        let created = ADINewZealandRegion(
            code: "NZ_Regions:Northland/Far North",
            region: "Northland",
            district: "Far North"
        )

        #expect(ADINewZealandRegion.allRegions.contains(created))
        #expect(ADINewZealandRegion(code: created.code) == created)
    }
}
