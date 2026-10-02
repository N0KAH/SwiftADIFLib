import Testing

@testable import SwiftADIFLib

@Suite("ADIFieldName")
struct ADIFieldNameTests {
    @Suite("isHeaderField(_:)")
    struct IsHeaderFieldTests {
        @Test("recognizes the specification-defined header fields in any case", arguments: [
            "ADIF_VER",
            "adif_ver",
            "CREATED_TIMESTAMP",
            "created_timestamp",
            "PROGRAMID",
            "programid",
            "PROGRAMVERSION",
            "programversion",
        ])
        func recognizesSpecificationFields(_ name: String) {
            #expect(ADIFieldName.isHeaderField(name))
        }

        @Test("does not recognize a user-defined field name")
        func doesNotRecognizeUserDefinedField() {
            #expect(ADIFieldName.isHeaderField("USERDEF1") == false)
        }

        @Test("does not recognize an unknown field")
        func doesNotRecognizeUnknownField() {
            #expect(ADIFieldName.isHeaderField("SOMETHING_ELSE") == false)
        }
    }

    @Suite("userDefinedNumber(_:)")
    struct UserDefinedNumberTests {
        @Test("extracts the field number", arguments: [
            ("USERDEF1", 1),
            ("userdef1", 1),
            ("USERDEF12", 12),
            ("UserDef99", 99),
        ])
        func extractsFieldNumber(_ pair: (String, Int)) {
            #expect(ADIFieldName.userDefinedNumber(pair.0) == pair.1)
        }

        @Test("returns nil for a name without the prefix")
        func returnsNilWithoutPrefix() {
            #expect(ADIFieldName.userDefinedNumber("CALL") == nil)
            #expect(ADIFieldName.userDefinedNumber("USERDEFINED1") == nil)
        }

        @Test("returns nil when no number follows the prefix")
        func returnsNilWithoutNumber() {
            #expect(ADIFieldName.userDefinedNumber("USERDEF") == nil)
        }

        @Test("returns nil when the suffix is not all digits")
        func returnsNilForNonNumericSuffix() {
            #expect(ADIFieldName.userDefinedNumber("USERDEF1A") == nil)
            #expect(ADIFieldName.userDefinedNumber("USERDEF_1") == nil)
        }
    }
}