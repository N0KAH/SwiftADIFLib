import Testing

@testable import SwiftADIFLib

@Suite("ADIHeader")
struct ADIHeaderTests {
    @Suite("serialized()")
    struct SerializationTests {
        @Test("writes the end-of-header tag even for an empty header")
        func writesEndOfHeaderTagForEmptyHeader() throws {
            let header = ADIHeader()

            #expect(try header.serialized() == "<EOH>\n")
        }

        @Test("writes each specification-defined header field")
        func writesEachSpecificationDefinedHeaderField() throws {
            let timestamp = try ADIHeaderTimestamp(
                year: 2011,
                month: 11,
                day: 22,
                hour: 2,
                minute: 15,
                second: 23
            )
            let header = ADIHeader(
                text: "Generated on 2011-11-22 at 02:15:23Z for WN4AZY",
                adifVersion: try ADIFVersion(epoch: 3, major: 0, minor: 5),
                createdTimestamp: timestamp,
                programID: "MonoLog",
                programVersion: "1.2.3"
            )

            #expect(try header.serialized() == """
            Generated on 2011-11-22 at 02:15:23Z for WN4AZY
            <ADIF_VER:5>3.0.5
            <CREATED_TIMESTAMP:15>20111122 021523
            <PROGRAMID:7>MonoLog
            <PROGRAMVERSION:5>1.2.3
            <EOH>

            """)
        }

        @Test("omits fields that are not present")
        func omitsAbsentFields() throws {
            let header = ADIHeader(programID: "MonoLog")

            #expect(try header.serialized() == "<PROGRAMID:7>MonoLog\n<EOH>\n")
        }

        @Test("writes user-defined field declarations in ascending order")
        func writesUserDefinedFieldsInAscendingOrder() throws {
            let third = try ADIHeaderUserDefinedField(position: 3, name: "ShoeSize", dataType: .number)
            let first = try ADIHeaderUserDefinedField(position: 1, name: "EPC", dataType: .number)
            let header = ADIHeader(userDefinedFields: [third, first])

            // The declared name is normalized to uppercase, and the length
            // counts "SHOESIZE".
            #expect(try header.serialized() == """
            <USERDEF1:3:N>EPC
            <USERDEF3:8:N>SHOESIZE
            <EOH>

            """)
        }

        @Test("writes a user-defined field with an enumeration")
        func writesUserDefinedFieldWithEnumeration() throws {
            let specification = try ADIHeaderUserDefinedFieldSpecification(enumeration: ["S", "M", "L"])
            let field = try ADIHeaderUserDefinedField(
                position: 2,
                name: "SweaterSize",
                dataType: .enumeration,
                specification: specification
            )
            let header = ADIHeader(userDefinedFields: [field])

            #expect(try header.serialized() == """
            <USERDEF2:19:E>SWEATERSIZE,{S,M,L}
            <EOH>

            """)
        }

        @Test("preserves unrecognized header fields")
        func preservesUnrecognizedHeaderFields() throws {
            // Unrecognized fields come into existence only by reading content,
            // so they are obtained by parsing rather than by construction.
            let header = try ADIHeader(parsing: "<SOME_VENDOR_FIELD:5>value<EOH>\n")

            #expect(header.unknownFields.count == 1)
            #expect(try header.serialized() == """
            <SOME_VENDOR_FIELD:5>value
            <EOH>

            """)
        }

        @Test("a generated header carries no unrecognized fields")
        func generatedHeaderHasNoUnknownFields() throws {
            let header = ADIHeader(programID: "MonoLog")

            #expect(header.unknownFields.isEmpty)

            let standard = ADIHeader.standard(
                programID: "MonoLog",
                programVersion: "1.0",
                createdAt: try ADIHeaderTimestamp(year: 2024, month: 1, day: 15, hour: 0, minute: 0, second: 0)
            )

            #expect(standard.unknownFields.isEmpty)
        }

        @Test("rejects two user-defined fields claiming the same position")
        func rejectsDuplicatePositions() throws {
            let first = try ADIHeaderUserDefinedField(position: 1, name: "ONE")
            let second = try ADIHeaderUserDefinedField(position: 1, name: "TWO")
            let header = ADIHeader(userDefinedFields: [first, second])

            #expect(throws: ADIFError.duplicateUserDefinedFieldPosition(1)) {
                try header.serialized()
            }
        }

        @Test("rejects an unrecognized field whose data type may only appear in ADX files")
        func rejectsADXOnlyUnknownField() throws {
            let header = try ADIHeader(parsing: "<VENDOR_INTL:2:I>hi<EOH>\n")

            #expect(header.unknownFields.count == 1)
            #expect(throws: ADIFError.unsupportedDataType(
                dataType: "I",
                reason: "fields of this type must only be used in ADX files"
            )) {
                try header.serialized()
            }
        }

        @Test("ends with a newline so that records may follow")
        func endsWithNewline() throws {
            #expect(try ADIHeader().serialized().hasSuffix("\n"))
        }
    }

    @Suite("init(parsing:)")
    struct ParsingTests {
        @Test("parses the header shown by the specification's sample file")
        func parsesSpecificationSampleHeader() throws {
            let header = try ADIHeader(parsing: """
            Generated on 2011-11-22 at 02:15:23Z for WN4AZY
            <adif_ver:5>3.0.5
            <programid:7>monolog
            <USERDEF1:3:N>EPC
            <USERDEF2:19:E>SweaterSize,{S,M,L}
            <USERDEF3:15:N>ShoeSize,{5:20}
            <EOH>
            <call:5>VK9NS<eor>

            """)

            let expectedVersion = try ADIFVersion(epoch: 3, major: 0, minor: 5)

            #expect(header.text == "Generated on 2011-11-22 at 02:15:23Z for WN4AZY")
            #expect(header.adifVersion == expectedVersion)
            #expect(header.programID == "monolog")
            #expect(header.userDefinedFields.count == 3)
            #expect(header.userDefinedFields[0].name == "EPC")
            #expect(header.userDefinedFields[1].specification == .enumeration(values: ["S", "M", "L"]))
            #expect(header.userDefinedFields[2].specification == .range(lowerBound: 5, upperBound: 20))
        }

        @Test("parses every specification-defined header field")
        func parsesEveryHeaderField() throws {
            let header = try ADIHeader(parsing: """
            <ADIF_VER:5>3.1.7
            <CREATED_TIMESTAMP:15>20240115 143055
            <PROGRAMID:7>MonoLog
            <PROGRAMVERSION:5>1.2.3
            <EOH>

            """)

            let expectedTimestamp = try ADIHeaderTimestamp(
                year: 2024,
                month: 1,
                day: 15,
                hour: 14,
                minute: 30,
                second: 55
            )

            #expect(header.adifVersion == .current)
            #expect(header.createdTimestamp == expectedTimestamp)
            #expect(header.programID == "MonoLog")
            #expect(header.programVersion == "1.2.3")
        }

        @Test("parses a header with no text and no fields")
        func parsesMinimalHeader() throws {
            let header = try ADIHeader(parsing: "<EOH>\n")

            #expect(header.text.isEmpty)
            #expect(header.adifVersion == nil)
            #expect(header.programID == nil)
            #expect(header.userDefinedFields.isEmpty)
        }

        @Test("matches header field names and the end-of-header tag case insensitively")
        func matchesCaseInsensitively() throws {
            let header = try ADIHeader(parsing: "<adif_ver:5>3.1.7<ProgramId:7>MonoLog<eoh>\n")

            #expect(header.adifVersion == .current)
            #expect(header.programID == "MonoLog")
        }

        @Test("collects unrecognized header fields instead of discarding them")
        func collectsUnrecognizedFields() throws {
            let header = try ADIHeader(parsing: "<ADIF_VER:5>3.1.7<VENDOR:3>abc<EOH>\n")

            #expect(header.unknownFields.count == 1)
            #expect(header.unknownFields.first?.name == "VENDOR")
            #expect(header.unknownFields.first?.data == "abc")
        }

        @Test("stops reading at the end-of-header tag")
        func stopsAtEndOfHeader() throws {
            let header = try ADIHeader(parsing: "<EOH>\n<CALL:6>WN4AZY<EOR>\n")

            #expect(header.unknownFields.isEmpty)
        }

        @Test("trims trailing newlines from the leading text")
        func trimsTrailingNewlinesFromText() throws {
            let header = try ADIHeader(parsing: "a note\n\n<EOH>\n")

            #expect(header.text == "a note")
        }

        @Test("preserves multi-line leading text")
        func preservesMultiLineText() throws {
            let header = try ADIHeader(parsing: "line one\nline two\n<EOH>\n")

            #expect(header.text == "line one\nline two")
        }

        @Test("rejects content that ends before the end-of-header tag")
        func rejectsContentWithoutEndOfHeader() {
            #expect(throws: ADIFError.missingEndOfHeader) {
                try ADIHeader(parsing: "<ADIF_VER:5>3.1.7")
            }
        }

        @Test("rejects an end-of-record tag inside a header")
        func rejectsEndOfRecordTagInsideHeader() {
            #expect(throws: ADIFError.unexpectedTagInHeader(name: "EOR")) {
                try ADIHeader(parsing: "<EOR><EOH>")
            }
        }

        @Test("rejects a malformed ADIF_VER value")
        func rejectsMalformedVersion() {
            #expect(throws: ADIFError.invalidADIFVersion(found: "1.2.3.4")) {
                try ADIHeader(parsing: "<ADIF_VER:7>1.2.3.4<EOH>")
            }
        }

        @Test("rejects a malformed CREATED_TIMESTAMP value")
        func rejectsMalformedTimestamp() {
            #expect(throws: ADIFError.invalidTimestamp(found: "20240115143055")) {
                try ADIHeader(parsing: "<CREATED_TIMESTAMP:14>20240115143055<EOH>")
            }
        }

        @Test("rejects a user-defined field number that is not positive")
        func rejectsNonPositiveUserDefinedNumber() {
            #expect(throws: ADIFError.self) {
                try ADIHeader(parsing: "<USERDEF0:3>N>EPC<EOH>")
            }
        }

        @Test("propagates a malformed tag")
        func propagatesMalformedTag() {
            #expect(throws: ADIFError.unterminatedTag(offset: 0)) {
                try ADIHeader(parsing: "<ADIF_VER:5")
            }
        }
    }

    @Suite("round trip")
    struct RoundTripTests {
@Test("reproduces the specification's sample header")
        func reproducesSpecificationSample() throws {
            let source = """
            Generated on 2011-11-22 at 02:15:23Z for WN4AZY
            <ADIF_VER:5>3.0.5
            <PROGRAMID:7>monolog
            <USERDEF1:3:N>EPC
            <USERDEF2:19:E>SWEATERSIZE,{S,M,L}
            <USERDEF3:15:N>SHOESIZE,{5:20}
            <EOH>

            """
            let header = try ADIHeader(parsing: source)

            #expect(try header.serialized() == source)
        }

        @Test("reproduces a header with every specification-defined field")
        func reproducesFullyPopulatedHeader() throws {
            let source = """
            <ADIF_VER:5>3.1.7
            <CREATED_TIMESTAMP:15>20240115 143055
            <PROGRAMID:12>SwiftADIFLib
            <PROGRAMVERSION:5>0.1.0
            <USERDEF1:3:N>EPC
            <EOH>

            """
            let header = try ADIHeader(parsing: source)

            #expect(try header.serialized() == source)
        }

        @Test("survives a parse and serialize cycle without a header")
        func roundTripsEmptyHeader() throws {
            let header = try ADIHeader(parsing: "<EOH>\n")

            #expect(try header.serialized() == "<EOH>\n")
        }

        @Test("normalizes field names and user-defined field casing on the first pass")
        func normalizesCasingOnFirstPass() throws {
            let header = try ADIHeader(parsing: "<userdef2:19:E>SweaterSize,{S,M,L}<EOH>\n")

            #expect(try header.serialized() == "<USERDEF2:19:E>SWEATERSIZE,{S,M,L}\n<EOH>\n")
        }

        @Test("is idempotent after the first pass")
        func isIdempotent() throws {
            let header = try ADIHeader(parsing: "<adif_ver:5>3.1.7<userdef1:3:N>epc<EOH>\n")
            let once = try header.serialized()
            let twice = try ADIHeader(parsing: once).serialized()

            #expect(once == twice)
        }

        @Test("separates tags that the input ran together, without changing their meaning")
        func separatesTagsThatRanTogether() throws {
            // ADI permits tags to follow one another with no intervening
            // whitespace, so the serializer is free to put each tag on its own
            // line. The header must still mean the same thing afterwards.
            let header = try ADIHeader(parsing: "<ADIF_VER:5>3.1.7<VENDOR_THING:7>payload<EOH>\n")

            #expect(try header.serialized() == """
            <ADIF_VER:5>3.1.7
            <VENDOR_THING:7>payload
            <EOH>

            """)
            #expect(try ADIHeader(parsing: header.serialized()) == header)
        }

        @Test("preserves an unrecognized field through a full cycle")
        func preservesUnrecognizedField() throws {
            let source = """
            <ADIF_VER:5>3.1.7
            <VENDOR_THING:7>payload
            <EOH>

            """
            let header = try ADIHeader(parsing: source)

            #expect(try header.serialized() == source)
            #expect(try ADIHeader(parsing: header.serialized()) == header)
        }
    }

    @Suite("standard(programID:programVersion:)")
    struct StandardFactoryTests {
        @Test("stamps the header with the current ADIF version and the given time")
        func stampsVersionAndTime() throws {
            let timestamp = try ADIHeaderTimestamp(
                year: 2024,
                month: 1,
                day: 15,
                hour: 14,
                minute: 30,
                second: 55
            )
            let header = ADIHeader.standard(
                programID: "SwiftADIFLib",
                programVersion: "0.1.0",
                createdAt: timestamp
            )

            #expect(header.adifVersion == .current)
            #expect(header.createdTimestamp == timestamp)
            #expect(header.programID == "SwiftADIFLib")
            #expect(header.programVersion == "0.1.0")
            #expect(try header.serialized() == """
            <ADIF_VER:5>3.1.7
            <CREATED_TIMESTAMP:15>20240115 143055
            <PROGRAMID:12>SwiftADIFLib
            <PROGRAMVERSION:5>0.1.0
            <EOH>

            """)
        }

        @Test("produces a header that parses back to an equal value")
        func producesParsableHeader() throws {
            let timestamp = try ADIHeaderTimestamp(
                year: 2024,
                month: 1,
                day: 15,
                hour: 14,
                minute: 30,
                second: 55
            )
            let header = ADIHeader.standard(
                programID: "SwiftADIFLib",
                programVersion: "0.1.0",
                createdAt: timestamp,
                text: "a note",
                userDefinedFields: [try ADIHeaderUserDefinedField(position: 1, name: "EPC", dataType: .number)]
            )
            let reparsed = try ADIHeader(parsing: header.serialized())

            #expect(reparsed == header)
        }
    }
}
