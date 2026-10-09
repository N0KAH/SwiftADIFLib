import Foundation
import Testing

@testable import SwiftADIFLib

@Suite("ADILogReader")
struct ADILogReaderTests {
    @Test("Reads header and records from FromRumlog.adi")
    func readsFromRumlog() throws {
        let url = ADIFixture.url(named: "FromRumlog.adi")
        let reader = try ADILogReader(contentsOf: url)
        #expect(reader.records.count == 7)
        #expect(reader.problems.isEmpty)
        try reader.validate()
    }
    
    @Test("Reads header and record from JTTYMode.adi")
    func readsJTTY() throws {
        let text = try ADIFixture.text(named: "JTTYMode.adi")
        let reader = ADILogReader(parsing: text)
        #expect(reader.records.count == 1)
        let record = reader.records.first
        #expect(record?.call == "W5ITR")
        #expect(record?.mode == .unrecognized("JTTY"))
        #expect(reader.problems.isEmpty)
    }
    
    @Test("Empty header is allowed")
    func emptyHeader() throws {
        let text = "<EOH>\n<QSO_DATE:8>20251008 <TIME_ON:4>1234 <CALL:5>W5ITR <EOR>"
        let reader = ADILogReader(parsing: text)
        #expect(reader.records.count == 1)
        #expect(reader.problems.isEmpty)
    }
    
    @Test("Records survive round trip")
    func roundTrip() throws {
        let text = try ADIFixture.text(named: "FromRumlog.adi")
        let reader = ADILogReader(parsing: text)
        for record in reader.records {
            let serialized = try record.serialized()
            let reread = try ADIRecord(parsing: serialized)
            #expect(reread == record)
        }
    }
    
    @Test("Test Records From Potacat Log")
    func potacatExport() throws {
        let text = try ADIFixture.text(named: "potacat_export.adi")
        let reader = ADILogReader(parsing: text)
        #expect(reader.records.count == 11)

        let frstRecord = reader.records.first
        #expect(frstRecord?.call == "K8ERS")
        #expect(frstRecord?.mode == .ssb)
        #expect(frstRecord?.txPwr == 100.0)
        #expect(frstRecord?.sig == "POTA")
        #expect(frstRecord?.sigInfo == "US-1551")
        #expect(frstRecord?.wwffRef == "KFF-1551")
        #expect(frstRecord?.name == "Eric Stoddart")
        #expect(frstRecord?.state == "MI")
        #expect(frstRecord?.gridsquare == "EN66am")

        #expect(frstRecord?.operatorCallsign == "N0KAH")
        #expect(frstRecord?.loggingStationCallsign == "N0KAH")

        
    }
}
