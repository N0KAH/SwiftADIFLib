import Testing

@testable import SwiftADIFLib

@Suite("ADIDataSpecifier")
struct ADIDataSpecifierTests {
    @Suite("init(name:typeIndicator:data:)")
    struct InitializerTests {
        @Test("normalizes the field name to uppercase")
        func normalizesFieldName() throws {
            let specifier = try ADIDataSpecifier(name: "call", data: "WN4AZY")

            #expect(specifier.name == "CALL")
        }

        @Test("retains the data verbatim")
        func retainsData() throws {
            let specifier = try ADIDataSpecifier(name: "CALL", data: "  WN4AZY  ")

            #expect(specifier.data == "  WN4AZY  ")
        }

        @Test("allows empty data")
        func allowsEmptyData() throws {
            let specifier = try ADIDataSpecifier(name: "NAME", data: "")

            #expect(specifier.data.isEmpty)
            #expect(specifier.length == 0)
        }

        @Test("rejects an empty field name")
        func rejectsEmptyFieldName() {
            #expect(throws: ADIFError.invalidFieldName(name: "", reason: "it is empty")) {
                try ADIDataSpecifier(name: "", data: "x")
            }
        }

        @Test("rejects field names containing structural characters", arguments: [
            "CAL<L",
            "CAL>L",
            "CA:L",
        ])
        func rejectsStructurallyInvalidFieldNames(_ name: String) {
            #expect(throws: ADIFError.self) {
                try ADIDataSpecifier(name: name, data: "x")
            }
        }

        @Test("keeps the data type indicator when one is supplied")
        func keepsTypeIndicator() throws {
            let specifier = try ADIDataSpecifier(name: "QSO_DATE", typeIndicator: .date, data: "20240115")

            #expect(specifier.typeIndicator == .date)
        }

        @Test("has no data type indicator when none is supplied")
        func hasNoTypeIndicatorByDefault() throws {
            let specifier = try ADIDataSpecifier(name: "CALL", data: "WN4AZY")

            #expect(specifier.typeIndicator == nil)
        }
    }

    @Suite("length")
    struct LengthTests {
        @Test(arguments: [
            ("", 0),
            ("WN4AZY", 6),
            ("20240115", 8),
            ("a b c", 5),
        ])
        func countsCharacters(_ pair: (String, Int)) throws {
            let specifier = try ADIDataSpecifier(name: "COMMENT", data: pair.0)

            #expect(specifier.length == pair.1)
        }

        @Test("counts a multi-byte character once rather than by byte count")
        func countsMultiByteCharacterOnce() throws {
            let specifier = try ADIDataSpecifier(name: "COMMENT", data: "café")

            #expect(specifier.length == 4)
            #expect(specifier.data.utf8.count == 5)
        }

        @Test("round trips with the character count used as the declared length")
        func roundTripsUsingCharacterCount() throws {
            let specifier = try ADIDataSpecifier(name: "COMMENT", data: "café")
            var scanner = ADITagScanner(specifier.serialized())

            guard case let .dataSpecifier(parsed) = try scanner.scanTag() else {
                Issue.record("expected a data specifier")

                return
            }

            #expect(parsed == specifier)
        }
    }

    @Suite("serialized()")
    struct SerializationTests {
        @Test("renders the form documented by the specification")
        func rendersDocumentedForm() throws {
            let specifier = try ADIDataSpecifier(name: "ADIF_VER", data: "3.1.7")

            #expect(specifier.serialized() == "<ADIF_VER:5>3.1.7")
        }

        @Test("includes the data type indicator when present")
        func includesTypeIndicator() throws {
            let specifier = try ADIDataSpecifier(name: "CALL", typeIndicator: .string, data: "WN4AZY")

            #expect(specifier.serialized() == "<CALL:6:S>WN4AZY")
        }

        @Test("omits the data type indicator when absent")
        func omitsTypeIndicator() throws {
            let specifier = try ADIDataSpecifier(name: "CALL", data: "WN4AZY")

            #expect(specifier.serialized() == "<CALL:6>WN4AZY")
        }

        @Test("renders an empty value with a zero length")
        func rendersEmptyValue() throws {
            let specifier = try ADIDataSpecifier(name: "NAME", data: "")

            #expect(specifier.serialized() == "<NAME:0>")
        }

        @Test("never emits leading zeroes in the length")
        func neverEmitsLeadingZeroes() throws {
            let specifier = try ADIDataSpecifier(name: "CALL", data: "W")

            #expect(specifier.serialized() == "<CALL:1>W")
        }

        @Test("keeps greater-than characters inside the data")
        func keepsGreaterThanInData() throws {
            let specifier = try ADIDataSpecifier(name: "COMMENT", data: "a > b")

            #expect(specifier.serialized() == "<COMMENT:5>a > b")
        }
    }

    @Suite("settingTypeIndicator(_:)")
    struct SettingTypeIndicatorTests {
        @Test("returns a specifier with the new indicator")
        func returnsSpecifierWithNewIndicator() throws {
            let original = try ADIDataSpecifier(name: "CALL", data: "WN4AZY")
            let updated = original.settingTypeIndicator(.string)

            #expect(updated.typeIndicator == .string)
            #expect(updated.name == original.name)
            #expect(updated.data == original.data)
        }

        @Test("removes the indicator when passed nil")
        func removesIndicator() throws {
            let original = try ADIDataSpecifier(name: "CALL", typeIndicator: .string, data: "WN4AZY")
            let updated = original.settingTypeIndicator(nil)

            #expect(updated.typeIndicator == nil)
        }

        @Test("does not modify the original")
        func doesNotModifyOriginal() throws {
            let original = try ADIDataSpecifier(name: "CALL", data: "WN4AZY")
            _ = original.settingTypeIndicator(.string)

            #expect(original.typeIndicator == nil)
        }
    }

    @Suite("validatedForADI()")
    struct ValidationTests {
        @Test("returns the specifier unchanged when the data type is permitted")
        func returnsSpecifierWhenPermitted() throws {
            let specifier = try ADIDataSpecifier(name: "CALL", typeIndicator: .string, data: "WN4AZY")

            #expect(try specifier.validatedForADI() == specifier)
        }

        @Test("rejects a data type that may only appear in ADX files", arguments: [
            ADIDataTypeIndicator.intlString,
            .intlMultilineString,
        ])
        func rejectsADXOnlyDataTypes(_ indicator: ADIDataTypeIndicator) throws {
            let specifier = try ADIDataSpecifier(name: "COMMENT_INTL", typeIndicator: indicator, data: "hi")

            #expect(throws: ADIFError.unsupportedDataType(
                dataType: indicator.description,
                reason: "fields of this type must only be used in ADX files"
            )) {
                try specifier.validatedForADI()
            }
        }
    }

    @Suite("Equatable")
    struct EqualityTests {
        @Test("treats field names as case insensitive")
        func treatsFieldNamesCaseInsensitively() throws {
            let lower = try ADIDataSpecifier(name: "call", data: "WN4AZY")
            let upper = try ADIDataSpecifier(name: "CALL", data: "WN4AZY")

            #expect(lower == upper)
            #expect(lower.hashValue == upper.hashValue)
        }
    }
}
