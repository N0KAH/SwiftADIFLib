import Testing

@testable import SwiftADIFLib

@Suite("DataTypeIndicator")
struct DataTypeIndicatorTests {
    @Suite("init?(rawValue:)")
    struct ParsingTests {
        @Test(arguments: [
            ("B", DataTypeIndicator.boolean),
            ("N", .number),
            ("D", .date),
            ("T", .time),
            ("S", .string),
            ("I", .intlString),
            ("M", .multilineString),
            ("G", .intlMultilineString),
            ("E", .enumeration),
            ("L", .location),
        ])
        func recognizesSpecificationIndicators(_ pair: (String, DataTypeIndicator)) throws {
            #expect(DataTypeIndicator(rawValue: pair.0) == pair.1)
        }

        @Test(arguments: ["B", "b", "n", "d", "t", "s", "i", "m", "g", "e", "l"])
        func isCaseInsensitive(_ raw: String) throws {
            let indicator = try #require(DataTypeIndicator(rawValue: raw))

            #expect(indicator == DataTypeIndicator(rawValue: raw.uppercased()))
            #expect(indicator == DataTypeIndicator(rawValue: raw.lowercased()))
        }

        @Test("rejects an empty indicator")
        func rejectsEmptyIndicator() {
            #expect(DataTypeIndicator(rawValue: "") == nil)
        }

        @Test("preserves an unrecognized indicator instead of discarding it")
        func preservesUnrecognizedIndicator() throws {
            let indicator = try #require(DataTypeIndicator(rawValue: "q"))

            #expect(indicator == .unrecognized("Q"))
            #expect(indicator.description == "Q")
        }

        @Test("normalizes an unrecognized indicator to uppercase")
        func normalizesUnrecognizedIndicator() throws {
            let indicator = try #require(DataTypeIndicator(rawValue: "q"))

            #expect(DataTypeIndicator(rawValue: "Q") == indicator)
        }
    }

    @Suite("description")
    struct DescriptionTests {
        @Test(arguments: [
            (DataTypeIndicator.boolean, "B"),
            (.number, "N"),
            (.date, "D"),
            (.time, "T"),
            (.string, "S"),
            (.intlString, "I"),
            (.multilineString, "M"),
            (.intlMultilineString, "G"),
            (.enumeration, "E"),
            (.location, "L"),
            (.unrecognized("Z"), "Z"),
        ])
        func rendersCanonicalForm(_ pair: (DataTypeIndicator, String)) {
            #expect(pair.0.description == pair.1)
        }

        @Test("round trips through its textual form")
        func roundTripsThroughTextualForm() {
            let indicators: [DataTypeIndicator] = [
                .boolean, .number, .date, .time, .string,
                .intlString, .multilineString, .intlMultilineString,
                .enumeration, .location, .unrecognized("Z"),
            ]

            for indicator in indicators {
                #expect(DataTypeIndicator(rawValue: indicator.description) == indicator)
            }
        }
    }

    @Suite("isPermittedInADI")
    struct PermittedInADITests {
        @Test("international data types are not permitted in ADI files")
        func internationalDataTypesAreNotPermitted() {
            #expect(DataTypeIndicator.intlString.isPermittedInADI == false)
            #expect(DataTypeIndicator.intlMultilineString.isPermittedInADI == false)
        }

        @Test("every other data type is permitted in ADI files")
        func otherDataTypesArePermitted() {
            let permitted: [DataTypeIndicator] = [
                .boolean, .number, .date, .time, .string,
                .multilineString, .enumeration, .location, .unrecognized("Z"),
            ]

            for indicator in permitted {
                #expect(indicator.isPermittedInADI)
            }
        }
    }
}