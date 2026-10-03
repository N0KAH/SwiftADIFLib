import Foundation
import Testing

@testable import SwiftADIFLib

@Suite("Test fixtures")
struct ADIFixtureTests {
    @Test("A fixture resolves against TestFiles at the repository root")
    func resolvesAgainstRepositoryRoot() {
        let fixture = ADIFixture.url(named: "FromRumlog.adi")

        #expect(fixture.lastPathComponent == "FromRumlog.adi")
        #expect(fixture.deletingLastPathComponent().lastPathComponent == "TestFiles")
        #expect(FileManager.default.fileExists(atPath: fixture.path()))
    }

    @Test("A fixture is readable as text")
    func readsFixture() throws {
        let text = try ADIFixture.text(named: "FromRumlog.adi")

        #expect(text.contains("<EOH>"))
    }

    @Test("A missing fixture reports as missing rather than trapping")
    func missingFixture() {
        #expect(FileManager.default.fileExists(
            atPath: ADIFixture.url(named: "NoSuchFile.adi").path()
        ) == false)
    }
}
