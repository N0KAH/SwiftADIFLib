import Testing

@testable import SwiftADIFLib

@Suite("UserDefinedField")
struct UserDefinedFieldTests {
    @Suite("init(position:name:dataType:specification:)")
    struct InitializerTests {
        @Test("builds a declaration with all of its parts")
        func buildsDeclaration() throws {
            let specification = try UserDefinedFieldSpecification(enumeration: ["S", "M", "L"])
            let field = try UserDefinedField(
                position: 2,
                name: "SweaterSize",
                dataType: .enumeration,
                specification: specification
            )

            #expect(field.position == 2)
            #expect(field.name == "SWEATERSIZE")
            #expect(field.dataType == .enumeration)
            #expect(field.specification == specification)
        }

        @Test("normalizes the field name to uppercase")
        func normalizesFieldName() throws {
            let field = try UserDefinedField(position: 1, name: "epc")

            #expect(field.name == "EPC")
        }

        @Test("has no data type when none is supplied")
        func hasNoDataTypeByDefault() throws {
            let field = try UserDefinedField(position: 1, name: "EPC")

            #expect(field.dataType == nil)
        }

        @Test("rejects a position below one", arguments: [0, -1])
        func rejectsPositionBelowOne(_ position: Int) {
            #expect(throws: ADIFError.invalidUserDefinedFieldPosition(position)) {
                try UserDefinedField(position: position, name: "EPC")
            }
        }

        @Test("rejects an empty field name")
        func rejectsEmptyFieldName() {
            #expect(throws: ADIFError.invalidFieldName(name: "", reason: "it is empty")) {
                try UserDefinedField(position: 1, name: "")
            }
        }

        @Test("rejects a name that is already a specification-defined header field")
        func rejectsSpecificationDefinedName() throws {
            for name in ["ADIF_VER", "adif_ver", "PROGRAMID", "created_timestamp"] {
                #expect(throws: ADIFError.self) {
                    try UserDefinedField(position: 1, name: name)
                }
            }
        }

        @Test("rejects a name containing a structural character", arguments: [
            "A,B",
            "A:B",
            "A<B",
            "A>B",
            "A{B",
            "A}B",
        ])
        func rejectsStructurallyInvalidName(_ name: String) {
            #expect(throws: ADIFError.invalidFieldName(
                name: name,
                reason: "it may not contain a comma, a colon, an angle bracket, or a curly brace"
            )) {
                try UserDefinedField(position: 1, name: name)
            }
        }

        @Test("rejects a name that begins or ends with a space")
        func rejectsNameWithSurroundingSpace() {
            #expect(throws: ADIFError.invalidFieldName(
                name: " EPC",
                reason: "it may not begin or end with a space character"
            )) {
                try UserDefinedField(position: 1, name: " EPC")
            }

            #expect(throws: ADIFError.self) {
                try UserDefinedField(position: 1, name: "EPC ")
            }
        }

        @Test("accepts a name with an interior space")
        func acceptsNameWithInteriorSpace() throws {
            let field = try UserDefinedField(position: 1, name: "MY FIELD")

            #expect(field.name == "MY FIELD")
        }
    }

    @Suite("init(position:parsing:dataType:)")
    struct ParsingTests {
        @Test("parses a bare field name")
        func parsesBareFieldName() throws {
            let field = try UserDefinedField(position: 1, parsing: "EPC", dataType: .number)

            #expect(field.name == "EPC")
            #expect(field.dataType == .number)
            #expect(field.specification == nil)
        }

        @Test("parses an enumeration specification")
        func parsesEnumerationSpecification() throws {
            let field = try UserDefinedField(position: 2, parsing: "SweaterSize,{S,M,L}", dataType: .enumeration)

            #expect(field.name == "SWEATERSIZE")
            #expect(field.specification == .enumeration(values: ["S", "M", "L"]))
        }

        @Test("parses a range specification")
        func parsesRangeSpecification() throws {
            let field = try UserDefinedField(position: 3, parsing: "ShoeSize,{5:20}", dataType: .number)

            #expect(field.name == "SHOESIZE")
            #expect(field.specification == .range(lowerBound: 5, upperBound: 20))
        }

        @Test("parses a fractional range specification")
        func parsesFractionalRange() throws {
            let field = try UserDefinedField(position: 3, parsing: "Size,{1.5:2.5}", dataType: .number)

            #expect(field.specification == .range(lowerBound: 1.5, upperBound: 2.5))
        }

        @Test("preserves the data type indicator taken from the header specifier")
        func preservesDataTypeIndicator() throws {
            let field = try UserDefinedField(position: 1, parsing: "EPC", dataType: nil)

            #expect(field.dataType == nil)
        }

        @Test("rejects a specification that the specification does not permit")
        func rejectsMalformedSpecification() throws {
            // A specification that is neither a valid enumeration nor a valid
            // range is dropped rather than silently reinterpreted.
            let field = try UserDefinedField(position: 1, parsing: "Bad,{20:5}", dataType: nil)

            #expect(field.name == "BAD")
            #expect(field.specification == nil)
        }
    }

    @Suite("description")
    struct DescriptionTests {
        @Test("renders a bare field name")
        func rendersBareFieldName() throws {
            let field = try UserDefinedField(position: 1, name: "EPC")

            #expect(field.description == "EPC")
        }

        @Test("renders a field name with its specification")
        func rendersFieldNameWithSpecification() throws {
            let specification = try UserDefinedFieldSpecification(enumeration: ["S", "M", "L"])
            let field = try UserDefinedField(position: 2, name: "SweaterSize", specification: specification)

            #expect(field.description == "SWEATERSIZE,{S,M,L}")
        }

        @Test("round trips through the parsing initializer")
        func roundTripsThroughParsing() throws {
            let specification = try UserDefinedFieldSpecification(lowerBound: 5, upperBound: 20)
            let field = try UserDefinedField(
                position: 3,
                name: "ShoeSize",
                dataType: .number,
                specification: specification
            )
            let reparsed = try UserDefinedField(
                position: 3,
                parsing: field.description,
                dataType: .number
            )

            #expect(reparsed == field)
        }
    }

    @Suite("headerFieldName")
    struct HeaderFieldNameTests {
        @Test("renders the USERDEFn name")
        func rendersUserDefName() throws {
            let field = try UserDefinedField(position: 1, name: "EPC")

            #expect(field.headerFieldName == "USERDEF1")
        }

        @Test("renders multi-digit positions")
        func rendersMultiDigitPositions() throws {
            let field = try UserDefinedField(position: 12, name: "EPC")

            #expect(field.headerFieldName == "USERDEF12")
        }
    }
}