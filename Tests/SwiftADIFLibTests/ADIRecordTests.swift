import Testing

@testable import SwiftADIFLib

@Suite("ADI records")
struct ADIRecordTests {
    /// The records of an ADIF export, which are the lines after the header.
    ///
    /// An export is not required to use a particular line ending, so this treats
    /// a carriage return and a line feed alike rather than assuming either.
    private func records(in export: String) throws -> [ADIRecord] {
        let lines = export
            .split(whereSeparator: { $0.isNewline })
            .map(String.init)

        let header = try #require(
            lines.firstIndex(where: { $0.contains("<EOH>") }),
            "an ADIF export ends its header with <EOH>"
        )

        return try lines[lines.index(after: header)...]
            .filter { !$0.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }
            .map(ADIRecord.init(parsing:))
    }

    @Test("The record models every QSO field the specification defines")
    func propertyCount() {
        // Reflection counts the fields that were generated, rather than trusting
        // the number the generator reported.
        let fields = Mirror(reflecting: ADIRecord()).children.filter { $0.label != "unknownFields" }

        #expect(fields.count == 181)
    }

    @Test("An empty record writes nothing but its terminator")
    func emptyRecord() throws {
        let text = try ADIRecord().serialized()

        #expect(text == "<EOR>")
    }

    @Test("A record reads the fields a contact is identified by")
    func coreFields() throws {
        let record = try ADIRecord(parsing: "<call:5>W5ITR <qso_date:8>20261003 <time_on:6>033628 <band:3>40m <mode:3>SSB <freq:8>7.091500 <dxcc:3>291 <eor>")

        #expect(record.call == "W5ITR")
        #expect(try record.qsoDate == ADIDate(year: 2026, month: 10, day: 3))
        #expect(try record.timeOn == ADITime(hour: 3, minute: 36, second: 28))
        #expect(record.band == .band40m)
        #expect(record.mode == .ssb)
        #expect(record.freq == 7.0915)
        #expect(record.dxcc == .unitedStatesOfAmerica)
    }

    @Test("The convenience initializer holds the core fields")
    func convenienceInit() {
        let record = ADIRecord(call: "W5ITR", freq: 14.074)

        #expect(record.call == "W5ITR")
        #expect(record.freq == 14.074)
        #expect(record.mode == nil)
        #expect(record.unknownFields.isEmpty)
    }

    @Test("Field names are matched without regard to case")
    func caseInsensitiveNames() throws {
        // RumLogNG writes its tags in lower case.
        let record = try ADIRecord(parsing: "<CALL:5>W5ITR <Band:3>40m <eor>")

        #expect(record.call == "W5ITR")
        #expect(record.band == .band40m)
    }

    @Test("A field the specification types as an enumeration keeps its type")
    func enumeratedFields() throws {
        let record = try ADIRecord(parsing: "<cont:2>NA <prop_mode:3>SAT <morse_key_type:2>SK <qsl_rcvd:1>Y <eor>")

        #expect(record.cont == .northAmerica)
        #expect(record.propMode == .satellite)
        #expect(record.morseKeyType == .straightKey)
        #expect(record.qslRcvd == .yes)
    }

    @Test("A field the specification types as text stays text")
    func stringTypedEnumerations() throws {
        // QSL_VIA carries the value of the QSL Via enumeration but the
        // specification types the field as a String, so it is not narrowed.
        let record = try ADIRecord(parsing: "<qsl_via:1>B <eor>")

        #expect(record.qslVia == "B")
    }

    @Test("An enumeration value the specification has not published is preserved")
    func unrecognizedEnumerationValue() throws {
        // ADIF 3.1.7 defines neither JTTY as a mode nor as a submode, yet
        // RumLogNG exports it, so a parser has to keep the text intact.
        let record = try ADIRecord(parsing: "<mode:4>JTTY <submode:4>JTTY <eor>")

        #expect(record.mode == .unrecognized("JTTY"))
        #expect(record.mode?.isRecognized == false)
        #expect(record.submode == .unrecognized("JTTY"))
        #expect(record.submode?.isRecognized == false)

        // Preserving the text is what makes the round trip lossless.
        let text = try record.serialized()

        #expect(text == "<MODE:4>JTTY <SUBMODE:4>JTTY <EOR>")
    }

    @Test("A field whose name is a Swift keyword is spelled for what it holds")
    func keywordRenames() throws {
        let record = try ADIRecord(parsing: "<class:5>MORSE <precedence:1>A <operator:5>N0KAH <station_callsign:5>K5ABC <eor>")

        #expect(record.contestClass == "MORSE")
        #expect(record.contestPrecedence == "A")
        #expect(record.operatorCallsign == "N0KAH")
        #expect(record.loggingStationCallsign == "K5ABC")
    }

    @Test("The station worked and the station logging are not conflated")
    func loggingAndContactedCallsignsStayDistinct() throws {
        // `OPERATOR` and `STATION_CALLSIGN` describe this end of the QSO, which is
        // the opposite end from `CALL`. Neither takes a `my` prefix, because the
        // specification defines no `MY_OPERATOR` or `MY_CALLSIGN` field.
        let record = try ADIRecord(parsing: "<call:5>W5ITR <operator:5>N0KAH <station_callsign:5>K5ABC <eor>")

        #expect(record.call == "W5ITR")
        #expect(record.operatorCallsign == "N0KAH")
        #expect(record.loggingStationCallsign == "K5ABC")
    }

    @Test("A record that names no logging station still holds the contacted one")
    func onlyTheContactedCallsign() throws {
        let record = try ADIRecord(parsing: "<call:5>W5ITR <eor>")

        #expect(record.call == "W5ITR")
        #expect(record.operatorCallsign == nil)
        #expect(record.loggingStationCallsign == nil)
    }

    @Test("An administrative subdivision is resolved against the entity that issued it")
    func subdivisionResolution() throws {
        let record = try ADIRecord(parsing: "<dxcc:3>291 <state:2>MA <eor>")

        #expect(record.state == "MA")
        #expect(record.contactedStationSubdivision?.name == "Massachusetts")
    }

    @Test("A subdivision code is meaningless without its entity")
    func subdivisionNeedsEntity() {
        var record = ADIRecord()
        record.state = "MA"

        #expect(record.contactedStationSubdivision == nil)
    }

    @Test("A region is resolved against the entity it belongs to")
    func regionResolution() throws {
        // The specification defines regions for entities outside a DXCC entity's
        // own territory, such as Sicily within Italy.
        let record = try ADIRecord(parsing: "<dxcc:3>248 <region:2>AI <eor>")

        #expect(record.region == "AI")
        #expect(record.contactedStationRegion?.name == "African Italy")
    }

    @Test("A region code is meaningless outside the entity that issued it")
    func regionNeedsItsEntity() {
        var record = ADIRecord()
        record.region = "AI"

        #expect(record.contactedStationRegion == nil)
    }

    @Test("A list field splits into its elements")
    func lists() throws {
        let record = try ADIRecord(parsing: "<pota_ref:27>K-0817,K-4566,K-4576,K-4573 <credit_granted:4>IOTA <eor>")

        #expect(record.potaRef == ["K-0817", "K-4566", "K-4576", "K-4573"])
        #expect(record.creditGranted == [.iota])
    }

    @Test("A Boolean is read from either the short or the spelled-out form")
    func booleans() throws {
        let record = try ADIRecord(parsing: "<qso_random:1>Y <silent_key:3>yes <force_init:4>TRUE <swl:1>n <eor>")

        #expect(record.qsoRandom == true)
        #expect(record.silentKey == true)
        #expect(record.forceInit == true)
        #expect(record.swl == false)
    }

    @Test("A Boolean is written in the spelling the specification requires")
    func booleansAreWrittenAsYorN() throws {
        var record = ADIRecord()
        record.qsoRandom = true
        record.swl = false

        let text = try record.serialized()

        #expect(text == "<QSO_RANDOM:1>Y <SWL:1>N <EOR>")
    }

    @Test("A field this library does not model is preserved")
    func unknownFieldPreservation() throws {
        let record = try ADIRecord(parsing: "<call:5>W5ITR <app_rumlog_qsl:1>W <future_field:3>abc <eor>")

        #expect(record.call == "W5ITR")
        #expect(record.unknownFields.count == 2)
        // ADIDataSpecifier normalizes a name to upper case.
        #expect(record.unknownFields.map(\.name) == ["APP_RUMLOG_QSL", "FUTURE_FIELD"])
        #expect(record.unknownFields.map(\.data) == ["W", "abc"])

        let text = try record.serialized()

        #expect(text.contains("<APP_RUMLOG_QSL:1>W"))
        #expect(text.contains("<FUTURE_FIELD:3>abc"))
    }

    @Test("A record survives being written and read again")
    func roundTrip() throws {
        let original = try ADIRecord(parsing: "<call:5>W5ITR <band:3>40m <freq:8>7.091500 <comment:4>JTTY <app_rumlog_qsl:1>W <eor>")
        let text = try original.serialized()
        let reread = try ADIRecord(parsing: text)

        #expect(reread == original)
        #expect(try reread.serialized() == text)
    }

    @Test("Every record of a real export survives a round trip")
    func roundTripFromRumlog() throws {
        let parsed = try records(in: try ADIFixture.text(named: "FromRumlog.adi"))

        #expect(parsed.count == 7)

        for record in parsed {
            let text = try record.serialized()
            let reread = try ADIRecord(parsing: text)

            #expect(reread == record)
        }
    }

    @Test("A real export read with a mode the specification does not define survives a round trip")
    func roundTripJTTY() throws {
        let parsed = try records(in: try ADIFixture.text(named: "JTTYMode.adi"))
        let record = try #require(parsed.first)

        #expect(parsed.count == 1)
        #expect(record.call == "W5ITR")
        #expect(record.band == .band40m)
        #expect(record.cont == .northAmerica)
        // The mode is real in the wild but absent from ADIF 3.1.7.
        #expect(record.mode == .unrecognized("JTTY"))
        #expect(record.submode == .unrecognized("JTTY"))
        // RumLogNG's own application fields are not modelled, so they survive as unknowns.
        #expect(record.unknownFields.map(\.name) == ["APP_RUMLOG_QSL", "APP_RUMLOG_COLORCODE"])

        let text = try record.serialized()

        #expect(try ADIRecord(parsing: text) == record)
    }

    @Test("Fields are written in the order the specification presents them")
    func serializationOrder() throws {
        var record = try ADIRecord(parsing: "<eor>")
        record.mode = .ssb
        record.call = "W5ITR"
        record.band = .band40m

        let text = try record.serialized()

        #expect(text == "<BAND:3>40m <CALL:5>W5ITR <MODE:3>SSB <EOR>")
    }

    @Test("Free-form text before the first tag is ignored")
    func leadingTextIgnored() throws {
        let record = try ADIRecord(parsing: "a note from the logger <call:5>W5ITR <eor>")

        #expect(record.call == "W5ITR")
    }

    @Test("Content that ends without a terminator is still a record")
    func missingEndOfRecord() throws {
        let record = try ADIRecord(parsing: "<call:5>W5ITR")

        #expect(record.call == "W5ITR")
    }

    @Test("A later occurrence of a field replaces the earlier one")
    func duplicateField() throws {
        let record = try ADIRecord(parsing: "<call:4>W5IT <call:5>W5ITR <eor>")

        #expect(record.call == "W5ITR")
    }

    @Test("A value that is not the type its field requires is rejected", arguments: [
        // Each value is the right length, so only the value itself is wrong.
        "<qso_date:9>2026-10-3 <eor>",
        "<time_on:4>3:36 <eor>",
        "<freq:5>seven <eor>",
        "<cqz:3>4.5 <eor>",
        "<qso_random:5>maybe <eor>",
    ])
    func typeMismatches(text: String) {
        #expect(throws: ADIFError.self) {
            try ADIRecord(parsing: text)
        }
    }

    @Test("The rejected value names the field it came from")
    func rejectionNamesTheField() {
        do {
            _ = try ADIRecord(parsing: "<freq:5>seven <eor>")
            Issue.record("Expected a value that is not a number to be rejected")
        } catch let error as ADIFError {
            guard case let .invalidFieldValue(name, _, _) = error else {
                Issue.record("Expected invalidFieldValue, got \(error)")
                return
            }

            #expect(name == "FREQ")
        } catch {
            Issue.record("Unexpected error: \(error)")
        }
    }

    @Test("A header tag has no place inside a record")
    func endOfHeaderInRecord() {
        #expect(throws: ADIFError.unexpectedTagInRecord(name: "EOH")) {
            try ADIRecord(parsing: "<call:5>W5ITR <EOH>")
        }
    }
}