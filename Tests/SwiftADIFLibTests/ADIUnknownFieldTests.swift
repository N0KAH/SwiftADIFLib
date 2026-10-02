import Foundation
import Testing

@testable import SwiftADIFLib

@Suite("ADIUnknownField")
struct ADIUnknownFieldTests {
    @Suite("init(name:typeIndicator:data:)")
    struct InitTests {
        @Test("keeps the name, type, and data")
        func keepsComponents() throws {
            let field = try ADIUnknownField(
                name: "VENDOR",
                typeIndicator: .string,
                data: "ACME"
            )

            #expect(field.name == "VENDOR")
            #expect(field.typeIndicator == .string)
            #expect(field.data == "ACME")
        }

        @Test("normalizes the name to uppercase", arguments: [
            ("vendor", "VENDOR"),
            ("Vendor", "VENDOR"),
            ("VeNdOr", "VENDOR"),
        ])
        func normalizesName(_ sample: (input: String, expected: String)) throws {
            let field = try ADIUnknownField(name: sample.input, data: "")

            #expect(field.name == sample.expected)
        }

        @Test("accepts a missing type indicator")
        func acceptsMissingTypeIndicator() throws {
            let field = try ADIUnknownField(name: "VENDOR", data: "ACME")

            #expect(field.typeIndicator == nil)
        }

        @Test("accepts empty data")
        func acceptsEmptyData() throws {
            let field = try ADIUnknownField(name: "VENDOR", data: "")

            #expect(field.data.isEmpty)
            #expect(field.length == 0)
        }

        @Test("rejects a name that cannot be a field name", arguments: [
            "",
            "<VENDOR>",
            "<",
            ">",
        ])
        func rejectsUnusableName(name: String) {
            #expect(throws: ADIFError.self) {
                try ADIUnknownField(name: name, data: "x")
            }
        }
    }

    @Suite("init(_:)")
    struct SpecifierInitTests {
        @Test("adopts the specifier's name, type, and data")
        func adoptsSpecifier() throws {
            let specifier = try ADIDataSpecifier(
                name: "VENDOR",
                typeIndicator: .string,
                data: "ACME"
            )
            let field = ADIUnknownField(specifier)

            #expect(field.name == "VENDOR")
            #expect(field.typeIndicator == .string)
            #expect(field.data == "ACME")
        }

        @Test("round trips through a specifier unchanged")
        func roundTripsThroughSpecifier() throws {
            let specifier = try ADIDataSpecifier(
                name: "VENDOR",
                typeIndicator: .enumeration,
                data: "3"
            )

            #expect(try ADIUnknownField(specifier).dataSpecifier() == specifier)
        }

        @Test("preserves data of every length")
        func preservesDataLength() throws {
            let data = String(repeating: "x", count: 300)

            let field = try ADIUnknownField(name: "VENDOR", data: data)

            #expect(field.length == 300)
            #expect(try field.dataSpecifier().data == data)
        }
    }

    @Suite("serialized()")
    struct SerializationTests {
        @Test(
            "renders the data specifier form",
            arguments: [
                ("VENDOR", ADIDataTypeIndicator?.none, "ACME", "<VENDOR:4>ACME"),
                ("VENDOR", ADIDataTypeIndicator?.none, "", "<VENDOR:0>"),
                ("VENDOR", ADIDataTypeIndicator.string, "ACME", "<VENDOR:4:S>ACME"),
                ("VENDOR", ADIDataTypeIndicator.number, "1.5", "<VENDOR:3:N>1.5"),
                ("VENDOR", ADIDataTypeIndicator.enumeration, "3", "<VENDOR:1:E>3"),
            ]
        )
        func rendersSpecifierForm(
            _ sample: (name: String, type: ADIDataTypeIndicator?, data: String, expected: String)
        ) throws {
            let field = try ADIUnknownField(
                name: sample.name,
                typeIndicator: sample.type,
                data: sample.data
            )

            let rendered = try field.serialized()

            #expect(rendered == sample.expected)
        }

        @Test("counts characters rather than bytes", arguments: [
            ("café", 4),
            ("naïve", 5),
            ("", 0),
        ])
        func countsCharacters(_ sample: (data: String, length: Int)) throws {
            let field = try ADIUnknownField(name: "VENDOR", data: sample.data)

            #expect(field.length == sample.length)
        }

        @Test("round trips through rendered text")
        func roundTripsThroughText() throws {
            let field = try ADIUnknownField(
                name: "VENDOR",
                typeIndicator: .enumeration,
                data: "3"
            )

            let rendered = try field.serialized()
            var scanner = ADITagScanner(rendered)
            let tag = try #require(try scanner.scanTag())
            guard case let .dataSpecifier(parsed) = tag else {
                Issue.record("expected a data specifier")
                return
            }

            #expect(ADIUnknownField(parsed) == field)
        }
    }

    @Suite("validatedForADI()")
    struct ValidationTests {
        @Test("accepts data types an ADI file may carry", arguments: [
            ADIDataTypeIndicator.string,
            .enumeration,
            .number,
            .boolean,
            .date,
            .time,
            .multilineString,
            .location,
        ])
        func acceptsADIPermittedTypes(type: ADIDataTypeIndicator) throws {
            let field = try ADIUnknownField(name: "VENDOR", typeIndicator: type, data: "1")

            let validated = try field.validatedForADI()
            let specifier = try field.dataSpecifier()

            #expect(validated == specifier)
        }

        @Test("rejects data types the specification reserves for ADX", arguments: [
            ADIDataTypeIndicator.intlString,
            .intlMultilineString,
        ])
        func rejectsADXOnlyTypes(type: ADIDataTypeIndicator) throws {
            let field = try ADIUnknownField(name: "VENDOR", typeIndicator: type, data: "x")

            #expect(throws: ADIFError.unsupportedDataType(
                dataType: type.description,
                reason: "fields of this type must only be used in ADX files"
            )) {
                try field.validatedForADI()
            }
        }

        @Test("accepts a missing type indicator")
        func acceptsMissingTypeIndicator() throws {
            let field = try ADIUnknownField(name: "VENDOR", data: "ACME")

            let specifier = try field.validatedForADI()

            #expect(specifier.name == "VENDOR")
        }

        @Test("rendering alone does not apply the ADI restriction")
        func renderingSkipsADIValidation() throws {
            let field = try ADIUnknownField(
                name: "VENDOR",
                typeIndicator: .intlString,
                data: "x"
            )

            let rendered = try field.serialized()

            #expect(rendered == "<VENDOR:1:I>x")
            #expect(throws: ADIFError.self) {
                try field.validatedForADI()
            }
        }
    }

    @Suite("specification coverage")
    struct SpecificationCoverageTests {
        @Test("the specification defines exactly ten indicators", arguments: [
            ("Boolean", ADIDataTypeIndicator.boolean.description),
            ("Number", ADIDataTypeIndicator.number.description),
            ("Date", ADIDataTypeIndicator.date.description),
            ("Time", ADIDataTypeIndicator.time.description),
            ("String", ADIDataTypeIndicator.string.description),
            ("IntlString", ADIDataTypeIndicator.intlString.description),
            ("MultilineString", ADIDataTypeIndicator.multilineString.description),
            ("IntlMultilineString", ADIDataTypeIndicator.intlMultilineString.description),
            ("Enumeration", ADIDataTypeIndicator.enumeration.description),
            ("Location", ADIDataTypeIndicator.location.description),
        ])
        func coversEveryDefinedIndicator(_ sample: (name: String, indicator: String)) {
            #expect(ADIDataTypeIndicator(rawValue: sample.indicator)?.description == sample.indicator)
        }
    }

    @Suite("value semantics")
    struct ValueSemanticsTests {
        @Test("equal fields compare equal")
        func equalFieldsAreEqual() throws {
            let first = try ADIUnknownField(name: "VENDOR", typeIndicator: .string, data: "ACME")
            let second = try ADIUnknownField(name: "VENDOR", typeIndicator: .string, data: "ACME")

            #expect(first == second)
            #expect(first.hashValue == second.hashValue)
        }

        @Test("fields differing in any component are unequal")
        func unequalFields() throws {
            let base = try ADIUnknownField(name: "VENDOR", typeIndicator: .string, data: "ACME")
            let otherName = try ADIUnknownField(
                name: "OTHER",
                typeIndicator: .string,
                data: "ACME"
            )
            let otherType = try ADIUnknownField(
                name: "VENDOR",
                typeIndicator: .number,
                data: "ACME"
            )
            let otherData = try ADIUnknownField(
                name: "VENDOR",
                typeIndicator: .string,
                data: "OTHER"
            )

            #expect(base != otherName)
            #expect(base != otherType)
            #expect(base != otherData)
        }

        @Test("properties are mutable")
        func propertiesAreMutable() throws {
            var field = try ADIUnknownField(name: "VENDOR", data: "ACME")
            field.name = "OTHER"
            field.data = "XYZ"

            #expect(field.name == "OTHER")
            #expect(field.data == "XYZ")
        }
    }

    @Suite("adoption by ADIHeader")
    struct HeaderIntegrationTests {
        @Test("preserves an unrecognized header field through a round trip")
        func preservesUnknownHeaderField() throws {
            let header = try ADIHeader(parsing: """
            ADIF Ver ADI 3.1.7
            <VENDOR:4:S>ACME
            <PROGRAMID:3:S>XYZ
            <EOH>

            """)

            #expect(header.unknownFields.count == 1)
            #expect(header.unknownFields.first?.name == "VENDOR")
            #expect(header.unknownFields.first?.typeIndicator == .string)
            #expect(header.unknownFields.first?.data == "ACME")

            let rendered = try header.serialized()

            #expect(rendered == """
            ADIF Ver ADI 3.1.7
            <PROGRAMID:3>XYZ
            <VENDOR:4:S>ACME
            <EOH>

            """)
        }

        @Test("writes several unknown fields in file order")
        func writesSeveralUnknownFields() throws {
            let header = try ADIHeader(parsing: """
            <FIRST:1:A>a
            <SECOND:1:B>b
            <EOH>

            """)

            #expect(header.unknownFields.map(\.name) == ["FIRST", "SECOND"])
            #expect(
                header.unknownFields.map(\.typeIndicator)
                    == [.unrecognized("A"), .boolean]
            )
            #expect(header.unknownFields.map(\.data) == ["a", "b"])

            let rendered = try header.serialized()

            #expect(rendered == """
            <FIRST:1:A>a
            <SECOND:1:B>b
            <EOH>

            """)
        }

        @Test("refuses to write a preserved ADX-only field into an ADI file")
        func refusesToWriteADXOnlyField() throws {
            let header = try ADIHeader(parsing: """
            <VENDOR:1:I>x
            <EOH>

            """)

            #expect(header.unknownFields.count == 1)
            #expect(throws: ADIFError.unsupportedDataType(
                dataType: "I",
                reason: "fields of this type must only be used in ADX files"
            )) {
                try header.serialized()
            }
        }

        @Test("a generated header never carries unknown fields")
        func generatedHeaderHasNoUnknownFields() throws {
            let header = ADIHeader(
                adifVersion: ADIFVersion.current,
                programID: "XYZ"
            )

            #expect(header.unknownFields.isEmpty)
            let rendered = try header.serialized()

            #expect(rendered.contains("VENDOR") == false)
        }
    }
}
