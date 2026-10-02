import Testing

@testable import SwiftADIFLib

@Suite("ADIDataTypeIndicator")
struct ADIDataTypeIndicatorTests {
    @Suite("init?(rawValue:)")
    struct ParsingTests {
        @Test(arguments: [
            ("B", ADIDataTypeIndicator.boolean),
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
        func recognizesSpecificationIndicators(_ pair: (String, ADIDataTypeIndicator)) throws {
            #expect(ADIDataTypeIndicator(rawValue: pair.0) == pair.1)
        }

        @Test(arguments: ["B", "b", "n", "d", "t", "s", "i", "m", "g", "e", "l"])
        func isCaseInsensitive(_ raw: String) throws {
            let indicator = try #require(ADIDataTypeIndicator(rawValue: raw))

            #expect(indicator == ADIDataTypeIndicator(rawValue: raw.uppercased()))
            #expect(indicator == ADIDataTypeIndicator(rawValue: raw.lowercased()))
        }

        @Test("rejects an empty indicator")
        func rejectsEmptyIndicator() {
            #expect(ADIDataTypeIndicator(rawValue: "") == nil)
        }

        @Test("preserves an unrecognized indicator instead of discarding it")
        func preservesUnrecognizedIndicator() throws {
            let indicator = try #require(ADIDataTypeIndicator(rawValue: "q"))

            #expect(indicator == .unrecognized("Q"))
            #expect(indicator.description == "Q")
        }

        @Test("normalizes an unrecognized indicator to uppercase")
        func normalizesUnrecognizedIndicator() throws {
            let indicator = try #require(ADIDataTypeIndicator(rawValue: "q"))

            #expect(ADIDataTypeIndicator(rawValue: "Q") == indicator)
        }
    }

    @Suite("description")
    struct DescriptionTests {
        @Test(arguments: [
            (ADIDataTypeIndicator.boolean, "B"),
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
        func rendersCanonicalForm(_ pair: (ADIDataTypeIndicator, String)) {
            #expect(pair.0.description == pair.1)
        }

        @Test("round trips through its textual form")
        func roundTripsThroughTextualForm() {
            let indicators: [ADIDataTypeIndicator] = [
                .boolean, .number, .date, .time, .string,
                .intlString, .multilineString, .intlMultilineString,
                .enumeration, .location, .unrecognized("Z"),
            ]

            for indicator in indicators {
                #expect(ADIDataTypeIndicator(rawValue: indicator.description) == indicator)
            }
        }
    }

    @Suite("isPermittedInADI")
    struct PermittedInADITests {
        @Test("international data types are not permitted in ADI files")
        func internationalDataTypesAreNotPermitted() {
            #expect(ADIDataTypeIndicator.intlString.isPermittedInADI == false)
            #expect(ADIDataTypeIndicator.intlMultilineString.isPermittedInADI == false)
        }

        @Test("every other data type is permitted in ADI files")
        func otherDataTypesArePermitted() {
            let permitted: [ADIDataTypeIndicator] = [
                .boolean, .number, .date, .time, .string,
                .multilineString, .enumeration, .location, .unrecognized("Z"),
            ]

            for indicator in permitted {
                #expect(indicator.isPermittedInADI)
            }
        }
    }
}
