import Testing

@testable import SwiftADIFLib

@Suite("Primary administrative subdivisions")
struct ADIPrimaryAdministrativeSubdivisionTests {
    @Test("Every subdivision the specification lists is present")
    func memberCount() {
        #expect(ADIPrimaryAdministrativeSubdivision.allSubdivisions.count == 1965)
    }

    @Test("The subdivisions cover every DXCC entity that defines any")
    func entityCount() {
        let entities = Set(
            ADIPrimaryAdministrativeSubdivision.allSubdivisions.map(\.dxccEntityCode)
        )

        #expect(entities.count == 66)
    }

    @Test("A subdivision reports its code as its description")
    func descriptionIsCode() throws {
        let subdivision = try #require(
            ADIPrimaryAdministrativeSubdivision(code: "NS", dxccEntityCode: "1")
        )

        #expect(subdivision.description == "NS")
    }

    @Test(arguments: [
        ("NS", "1", "Nova Scotia"),
        ("qc", "1", "Québec"),
        ("ny", "291", "New York"),
    ])
    func looksUpWithinItsEntity(code: String, dxccEntityCode: String, name: String) {
        let subdivision = ADIPrimaryAdministrativeSubdivision(
            code: code,
            dxccEntityCode: dxccEntityCode
        )

        #expect(subdivision?.name == name)
    }

    @Test("A code means nothing without its DXCC entity")
    func codeIsNotGlobal() {
        // '01' is a subdivision in five different entities and means none of them
        // the same thing, which is why the entity is part of the key.
        let names = ["132", "227", "339", "497", "70"].map {
            ADIPrimaryAdministrativeSubdivision(code: "01", dxccEntityCode: $0)?.name
        }

        #expect(names == [
            "Concepción (import-only)",
            "Ain",
            "Hokkaido",
            "Zagrebačka županija",
            "Pinar del Río (province)",
        ])
    }

    @Test("A lookup for an unknown code within a known entity fails")
    func unknownCode() {
        #expect(ADIPrimaryAdministrativeSubdivision(code: "ZZ", dxccEntityCode: "1") == nil)
    }

    @Test("A lookup for a known code in the wrong entity fails")
    func wrongEntity() {
        // Nova Scotia is only defined by Canada, so 'NS' is not a subdivision of
        // the United States even though that entity has its own 'NY'.
        #expect(ADIPrimaryAdministrativeSubdivision(code: "NS", dxccEntityCode: "291") == nil)
    }

    @Test("An entity's subdivisions are returned in specification order")
    func subdivisionsInEntity() {
        let canada = ADIPrimaryAdministrativeSubdivision.subdivisions(inDXCCEntity: "1")

        #expect(canada.count == 13)
        #expect(canada.first?.code == "NS")
        #expect(canada.allSatisfy { $0.dxccEntityCode == "1" })
    }

    @Test("An entity that defines no subdivisions returns none")
    func entityWithNone() {
        #expect(ADIPrimaryAdministrativeSubdivision.subdivisions(inDXCCEntity: "0").isEmpty)
    }

    @Test("A code the specification reuses within one entity yields every candidate")
    func reusedCodeKeepsBothSubdivisions() {
        // The specification renamed both of these at a date and gives each name a
        // qualifier saying which side of the date it applies to.
        let perm = ADIPrimaryAdministrativeSubdivision.subdivisions(
            code: "PM",
            dxccEntityCode: "15"
        )
        let bruck = ADIPrimaryAdministrativeSubdivision.subdivisions(
            code: "BM",
            dxccEntityCode: "206"
        )

        #expect(perm.count == 2)
        #expect(perm.contains { $0.name.contains("on or after 2005-12-01") })
        #expect(perm.contains { $0.name.contains("before 2005-12-01") })
        #expect(bruck.count == 2)
        #expect(bruck.allSatisfy { $0.region == "Styria (Steiermark)" })
    }

    @Test("A reused code still resolves to a subdivision rather than failing")
    func reusedCodeResolves() {
        #expect(ADIPrimaryAdministrativeSubdivision(code: "PM", dxccEntityCode: "15") != nil)
        #expect(ADIPrimaryAdministrativeSubdivision(code: "BM", dxccEntityCode: "206") != nil)
    }

    @Test("A district heading groups the subdivisions beneath it")
    func regionGrouping() {
        let vienna = ADIPrimaryAdministrativeSubdivision(code: "WC", dxccEntityCode: "206")
        let salzburg = ADIPrimaryAdministrativeSubdivision(code: "SC", dxccEntityCode: "206")
        let ungrouped = ADIPrimaryAdministrativeSubdivision(code: "1", dxccEntityCode: "1")

        #expect(vienna?.region == "Vienna (Wien)")
        #expect(salzburg?.region == "Salzburg")
        #expect(ungrouped?.region == nil)
    }

    @Test("Only entities whose tables carry the columns report them")
    func optionalColumns() {
        let russian = ADIPrimaryAdministrativeSubdivision(code: "UO", dxccEntityCode: "15")
        let canadian = ADIPrimaryAdministrativeSubdivision(code: "NS", dxccEntityCode: "1")

        #expect(russian?.oblast == "174")
        #expect(russian?.cqZone == "18")
        #expect(russian?.ituZone == "32")
        #expect(canadian?.oblast == nil)
        #expect(canadian?.cqZone == "05")
        #expect(canadian?.ituZone == "09")
    }

    @Test("A retired subdivision is kept and flagged")
    func retiredSubdivision() {
        let market = ADIPrimaryAdministrativeSubdivision(code: "051", dxccEntityCode: "5")

        #expect(market?.name == "Märket")
        #expect(market?.isDeleted == true)
        #expect(ADIPrimaryAdministrativeSubdivision.allSubdivisions.filter(\.isDeleted).count == 1)
    }

    @Test("A subdivision created from its data equals the one looked up")
    func roundTrip() {
        let created = ADIPrimaryAdministrativeSubdivision(
            code: "NS",
            name: "Nova Scotia",
            dxccEntityCode: "1",
            dxccEntityName: "Canada",
            cqZone: "05",
            ituZone: "09"
        )

        #expect(created == ADIPrimaryAdministrativeSubdivision(code: "NS", dxccEntityCode: "1"))
    }
}
