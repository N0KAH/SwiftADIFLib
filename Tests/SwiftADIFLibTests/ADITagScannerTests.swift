import Testing

@testable import SwiftADIFLib

@Suite("ADITagScanner")
struct ADITagScannerTests {
    @Suite("scanTag()")
    struct ScanTagTests {
        @Test("parses a data specifier without a type indicator")
        func parsesDataSpecifierWithoutIndicator() throws {
            var scanner = ADITagScanner("<CALL:6>WN4AZY")

            guard case let .dataSpecifier(specifier) = try scanner.scanTag() else {
                Issue.record("expected a data specifier")

                return
            }

            #expect(specifier == (try ADIDataSpecifier(name: "CALL", data: "WN4AZY")))
        }

        @Test("parses a data specifier with a type indicator")
        func parsesDataSpecifierWithIndicator() throws {
            var scanner = ADITagScanner("<QSO_DATE:8:D>20240115")

            guard case let .dataSpecifier(specifier) = try scanner.scanTag() else {
                Issue.record("expected a data specifier")

                return
            }

            #expect(specifier.typeIndicator == .date)
            #expect(specifier.data == "20240115")
        }

        @Test("is case insensitive for field names")
        func isCaseInsensitiveForFieldNames() throws {
            var scanner = ADITagScanner("<cAlL:6>WN4AZY")

            guard case let .dataSpecifier(specifier) = try scanner.scanTag() else {
                Issue.record("expected a data specifier")

                return
            }

            #expect(specifier.name == "CALL")
        }

        @Test("is case insensitive for type indicators")
        func isCaseInsensitiveForIndicators() throws {
            var scanner = ADITagScanner("<CALL:6:s>WN4AZY")

            guard case let .dataSpecifier(specifier) = try scanner.scanTag() else {
                Issue.record("expected a data specifier")

                return
            }

            #expect(specifier.typeIndicator == .string)
        }

        @Test("recognizes the end-of-header tag in any case", arguments: ["<EOH>", "<eoh>", "<Eoh>"])
        func recognizesEndOfHeaderTag(_ text: String) throws {
            var scanner = ADITagScanner(text)

            #expect(try scanner.scanTag() == .endOfHeader)
        }

        @Test("recognizes the end-of-record tag in any case", arguments: ["<EOR>", "<eor>", "<Eor>"])
        func recognizesEndOfRecordTag(_ text: String) throws {
            var scanner = ADITagScanner(text)

            #expect(try scanner.scanTag() == .endOfRecord)
        }

        @Test("skips free-form text before a tag")
        func skipsFreeFormText() throws {
            var scanner = ADITagScanner("Generated on 2011-11-22 at 02:15:23Z for WN4AZY\n<CALL:6>WN4AZY")

            guard case let .dataSpecifier(specifier) = try scanner.scanTag() else {
                Issue.record("expected a data specifier")

                return
            }

            #expect(specifier.data == "WN4AZY")
        }

        @Test("reads consecutive tags")
        func readsConsecutiveTags() throws {
            var scanner = ADITagScanner("<CALL:6>WN4AZY<BAND:3>20M<EOR>")

            _ = try scanner.scanTag()
            _ = try scanner.scanTag()

            #expect(try scanner.scanTag() == .endOfRecord)
            #expect(try scanner.scanTag() == nil)
        }

        @Test("reports the end of the input")
        func reportsEndOfInput() throws {
            var scanner = ADITagScanner("")

            #expect(try scanner.scanTag() == nil)
        }

        @Test("accepts leading zeroes in a declared length")
        func acceptsLeadingZeroesInLength() throws {
            var scanner = ADITagScanner("<CALL:0006>WN4AZY")

            guard case let .dataSpecifier(specifier) = try scanner.scanTag() else {
                Issue.record("expected a data specifier")

                return
            }

            #expect(specifier.data == "WN4AZY")
        }

        @Test("counts multi-byte characters once")
        func countsMultiByteCharactersOnce() throws {
            var scanner = ADITagScanner("<COMMENT:4>café<EOH>")

            guard case let .dataSpecifier(specifier) = try scanner.scanTag() else {
                Issue.record("expected a data specifier")

                return
            }

            #expect(specifier.data == "café")
            #expect(try scanner.scanTag() == .endOfHeader)
        }

        @Test("does not treat a greater-than sign inside data as a tag")
        func doesNotTreatGreaterThanInDataAsTag() throws {
            var scanner = ADITagScanner("<COMMENT:5>a>b<c<EOR>")

            guard case let .dataSpecifier(specifier) = try scanner.scanTag() else {
                Issue.record("expected a data specifier")

                return
            }

            #expect(specifier.data == "a>b<c")
            #expect(try scanner.scanTag() == .endOfRecord)
        }
    }

    @Suite("malformed input")
    struct MalformedInputTests {
        @Test("rejects a tag that is never closed")
        func rejectsUnterminatedTag() {
            var scanner = ADITagScanner("<CALL:6")

            #expect(throws: ADIFError.unterminatedTag(offset: 0)) {
                try scanner.scanTag()
            }
        }

        @Test("rejects an empty field name")
        func rejectsEmptyFieldName() {
            var scanner = ADITagScanner("<:6>WN4AZY")

            #expect(throws: ADIFError.emptyFieldName(offset: 0)) {
                try scanner.scanTag()
            }
        }

        @Test("rejects a tag that is not a data specifier")
        func rejectsTagThatIsNotDataSpecifier() {
            var scanner = ADITagScanner("<EOHX>")

            #expect(throws: ADIFError.self) {
                try scanner.scanTag()
            }
        }

        @Test("rejects a non-numeric length", arguments: ["<CALL:x>WN4AZY", "<CALL:>WN4AZY", "<CALL:6a>WN4AZY"])
        func rejectsNonNumericLength(_ text: String) {
            var scanner = ADITagScanner(text)

            #expect(throws: ADIFError.self) {
                try scanner.scanTag()
            }
        }

        @Test("rejects a length too large to represent")
        func rejectsOverflowingLength() {
            var scanner = ADITagScanner("<CALL:99999999999999999999>WN4AZY")

            #expect(throws: ADIFError.dataLengthOverflow(found: "99999999999999999999")) {
                try scanner.scanTag()
            }
        }

        @Test("rejects data shorter than the declared length")
        func rejectsTruncatedData() {
            var scanner = ADITagScanner("<CALL:10>WN4AZY")

            #expect(throws: ADIFError.dataTruncated(expected: 10, available: 6)) {
                try scanner.scanTag()
            }
        }
    }

    @Suite("consumeLeadingText()")
    struct ConsumeLeadingTextTests {
        @Test("returns the text before the first tag")
        func returnsTextBeforeFirstTag() {
            var scanner = ADITagScanner("hello\nworld\n<CALL:6>WN4AZY")

            #expect(scanner.consumeLeadingText() == "hello\nworld\n")
        }

        @Test("returns an empty string when the content begins with a tag")
        func returnsEmptyWhenBeginningWithTag() {
            var scanner = ADITagScanner("<CALL:6>WN4AZY")

            #expect(scanner.consumeLeadingText().isEmpty)
        }

        @Test("returns everything when there is no tag at all")
        func returnsEverythingWhenNoTag() {
            var scanner = ADITagScanner("just text")

            #expect(scanner.consumeLeadingText() == "just text")
            #expect(scanner.isAtEnd)
        }
    }

    @Suite("ADITag.name")
    struct TagNameTests {
        @Test("reports the uppercased tag name")
        func reportsUppercasedName() throws {
            let specifier = try ADIDataSpecifier(name: "call", data: "WN4AZY")

            #expect(ADITag.dataSpecifier(specifier).name == "CALL")
            #expect(ADITag.endOfHeader.name == "EOH")
            #expect(ADITag.endOfRecord.name == "EOR")
        }
    }
}
