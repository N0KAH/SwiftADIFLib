import Testing

@testable import SwiftADIFLib

@Suite("Regions")
struct ADIRegionTests {
    @Test("The specification's region count is modeled")
    func regionCountMatchesSpecification() {
        #expect(ADIRegion.allRegions.count == 10)
    }

    @Test("A region is identified by its code and DXCC entity")
    func lookupRequiresBothCodeAndEntity() {
        let kosovo = try! #require(ADIRegion(code: "KO", dxccEntityCode: "296"))

        #expect(kosovo.name == "Kosovo")
        #expect(kosovo.prefix == "YU8")
        #expect(kosovo.applicability == "CQ, WAE")
    }

    @Test("One region entity code can name a different region in each DXCC entity")
    func reusedRegionCodesResolvePerEntity() {
        let yugoslavia = try! #require(ADIRegion(code: "KO", dxccEntityCode: "296"))
        let noEntity = try! #require(ADIRegion(code: "KO", dxccEntityCode: "0"))
        let deletedEntity = try! #require(ADIRegion(code: "KO", dxccEntityCode: "522"))

        #expect(yugoslavia.prefix == "YU8")
        #expect(noEntity.prefix == "Z6")
        #expect(deletedEntity.prefix == "Z6")
        #expect(yugoslavia != noEntity)
        #expect(noEntity != deletedEntity)
    }

    @Test("A region that applies in no single DXCC entity is looked up with nil")
    func noneAppliesInNoEntity() {
        let none = try! #require(ADIRegion(code: "NONE", dxccEntityCode: nil))

        #expect(none.code == "NONE")
        #expect(none.dxccEntityCode == nil)
        #expect(none.prefix == nil)
        #expect(none.applicability == nil)
        #expect(none.name.contains("Not within"))
    }

    @Test("Region entity codes are matched without regard to case")
    func lookupIgnoresCase() {
        #expect(ADIRegion(code: "ko", dxccEntityCode: "296")
            == ADIRegion(code: "KO", dxccEntityCode: "296"))
        #expect(ADIRegion(code: "none", dxccEntityCode: nil)
            == ADIRegion(code: "NONE", dxccEntityCode: nil))
    }

    @Test("A region the specification does not define is not found")
    func unknownRegionsAreNotFound() {
        #expect(ADIRegion(code: "ZZ", dxccEntityCode: "1") == nil)
        #expect(ADIRegion(code: "", dxccEntityCode: nil) == nil)
        #expect(ADIRegion(code: "KO", dxccEntityCode: "1") == nil)
        #expect(ADIRegion(code: "NONE", dxccEntityCode: "1") == nil)
    }

    @Test("Every region the specification lists resolves back to itself")
    func regionsRoundTrip() {
        for region in ADIRegion.allRegions {
            let message: Comment = "region \(region.code) in \(region.dxccEntityCode ?? "-")"
            let parsed = try! #require(
                ADIRegion(code: region.code, dxccEntityCode: region.dxccEntityCode),
                message
            )

            #expect(parsed == region, message)
            #expect(parsed.description == region.code, message)
        }
    }

    @Test("The regions of a DXCC entity are listed in specification order")
    func regionsWithinAnEntity() {
        let italy = ADIRegion.regions(inDXCCEntity: "248")

        #expect(italy.map(\.code) == ["AI", "SY"])
        #expect(ADIRegion.regions(inDXCCEntity: "1").isEmpty)
        #expect(ADIRegion.regions(inDXCCEntity: "99999").isEmpty)
    }

    @Test("Every region names itself and carries no contradictory data")
    func regionsAreWellFormed() {
        for region in ADIRegion.allRegions {
            let message: Comment = "region \(region.code)"
            let lookup = try! #require(
                ADIRegion(code: region.code, dxccEntityCode: region.dxccEntityCode),
                message
            )

            #expect(!region.name.isEmpty, message)
            #expect(lookup.description == region.code, message)
        }
    }
}