import Testing

@testable import SwiftADIFLib

@Suite("ADIHeaderUserDefinedFieldSpecification")
struct ADIHeaderUserDefinedFieldSpecificationTests {
    @Suite("init(enumeration:)")
    struct EnumerationInitializerTests {
        @Test("builds an enumeration from permitted values")
        func buildsEnumeration() throws {
            let specification = try ADIHeaderUserDefinedFieldSpecification(enumeration: ["S", "M", "L"])

            #expect(specification == .enumeration(values: ["S", "M", "L"]))
        }

        @Test("rejects an empty list of values")
        func rejectsEmptyValues() {
            #expect(throws: ADIFError.self) {
                try ADIHeaderUserDefinedFieldSpecification(enumeration: [])
            }
        }

        @Test("rejects a value containing the delimiter comma")
        func rejectsValueContainingComma() {
            #expect(throws: ADIFError.invalidUserDefinedFieldSpecification(
                specification: "a,b",
                reason: "an enumerated value may not contain a comma"
            )) {
                try ADIHeaderUserDefinedFieldSpecification(enumeration: ["a,b"])
            }
        }

        @Test("accepts a single value")
        func acceptsSingleValue() throws {
            let specification = try ADIHeaderUserDefinedFieldSpecification(enumeration: ["ONLY"])

            #expect(specification.description == "{ONLY}")
        }
    }

    @Suite("init(lowerBound:upperBound:)")
    struct RangeInitializerTests {
        @Test("builds a range from its bounds")
        func buildsRange() throws {
            let specification = try ADIHeaderUserDefinedFieldSpecification(lowerBound: 5, upperBound: 20)

            #expect(specification == .range(lowerBound: 5, upperBound: 20))
        }

        @Test("accepts fractional bounds")
        func acceptsFractionalBounds() throws {
            let specification = try ADIHeaderUserDefinedFieldSpecification(lowerBound: 1.5, upperBound: 2.5)

            #expect(specification == .range(lowerBound: 1.5, upperBound: 2.5))
        }

        @Test("rejects bounds that are not ordered", arguments: [(5.0, 5.0), (20.0, 5.0)])
        func rejectsUnorderedBounds(_ bounds: (Double, Double)) {
            #expect(throws: ADIFError.self) {
                try ADIHeaderUserDefinedFieldSpecification(lowerBound: bounds.0, upperBound: bounds.1)
            }
        }
    }

    @Suite("description")
    struct DescriptionTests {
        @Test("renders an enumeration in the form the specification shows")
        func rendersEnumeration() throws {
            let specification = try ADIHeaderUserDefinedFieldSpecification(enumeration: ["S", "M", "L"])

            #expect(specification.description == "{S,M,L}")
        }

        @Test("renders an integral range without a decimal point")
        func rendersIntegralRange() throws {
            let specification = try ADIHeaderUserDefinedFieldSpecification(lowerBound: 5, upperBound: 20)

            #expect(specification.description == "{5:20}")
        }

        @Test("renders a fractional range with its decimal point")
        func rendersFractionalRange() throws {
            let specification = try ADIHeaderUserDefinedFieldSpecification(lowerBound: 1.5, upperBound: 2.5)

            #expect(specification.description == "{1.5:2.5}")
        }

        @Test("renders a bound too large for Int without trapping")
        func rendersHugeIntegralBound() throws {
            // `Int(_:)` traps above `Int.max`, so the rendering has to fall
            // back rather than crash on a bound a caller chose.
            let specification = try ADIHeaderUserDefinedFieldSpecification(lowerBound: 1e300, upperBound: 2e300)

            #expect(specification.description == "{1e+300:2e+300}")
        }
    }
}
