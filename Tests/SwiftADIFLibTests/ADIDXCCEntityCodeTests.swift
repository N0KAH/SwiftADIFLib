import Testing

@testable import SwiftADIFLib

@Suite("DXCC entity codes")
struct ADIDXCCEntityCodeTests {
    @Test("The specification's entity count is modeled")
    func memberCountMatchesSpecification() {
        #expect(ADIDXCCEntityCode.allMembers.count == 403)
    }

    @Test("Entity codes are numeric and unique")
    func codesAreNumericAndUnique() {
        let codes = ADIDXCCEntityCode.allMembers.map(\.description)

        #expect(Set(codes).count == codes.count)
        #expect(codes.allSatisfy { $0.allSatisfy(\.isNumber) })
    }

    @Test("The canonical form of a value is its numeric entity code")
    func descriptionIsTheEntityCode() {
        #expect(ADIDXCCEntityCode.canada.description == "1")
        #expect(ADIDXCCEntityCode.unitedStatesOfAmerica.description == "291")
        #expect(ADIDXCCEntityCode.noEntity.description == "0")
    }

    @Test("An entity code resolves to the entity name the specification gives it")
    func nameComesFromTheSpecification() {
        #expect(ADIDXCCEntityCode.canada.name == "CANADA")
        #expect(ADIDXCCEntityCode.afghanistan.name == "AFGHANISTAN")
        #expect(ADIDXCCEntityCode.unitedStatesOfAmerica.name == "UNITED STATES OF AMERICA")
    }

    @Test("Entity code `0` means the station is in no DXCC entity")
    func noEntityIsNamedForItsMeaning() {
        let noEntity = ADIDXCCEntityCode(rawValue: "0")

        #expect(noEntity == .noEntity)
        #expect(noEntity.name.contains("not be within a DXCC entity"))
        #expect(!noEntity.isDeleted)
    }

    @Test("Codes the specification has retired are still readable")
    func deletedCodesRemainReadable() {
        let deleted = ADIDXCCEntityCode.allMembers.filter(\.isDeleted)

        #expect(deleted.count == 62)

        for code in deleted {
            let message: Comment = "entity code \(code.description)"
            let parsed = ADIDXCCEntityCode(rawValue: code.description)

            #expect(parsed.isDeleted, message)
        }
    }

    @Test("A code the specification has retired is distinct from the live code")
    func deletedCodesAreDisambiguatedFromLiveCodes() {
        #expect(ADIDXCCEntityCode.comoros.name == "COMOROS")
        #expect(!ADIDXCCEntityCode.comoros.isDeleted)
        #expect(ADIDXCCEntityCode.comorosDeleted.name == "COMOROS (Deleted)")
        #expect(ADIDXCCEntityCode.comorosDeleted.isDeleted)
        #expect(ADIDXCCEntityCode.comoros.description == "411")
        #expect(ADIDXCCEntityCode.comorosDeleted.description == "39")

        #expect(ADIDXCCEntityCode.palestine.name == "PALESTINE")
        #expect(!ADIDXCCEntityCode.palestine.isDeleted)
        #expect(ADIDXCCEntityCode.palestineDeleted.isDeleted)
    }

    @Test("Every entity code parses back to the value it names")
    func codesParseToThemselves() {
        for code in ADIDXCCEntityCode.allMembers {
            let message: Comment = "entity code \(code.description)"

            #expect(ADIDXCCEntityCode(rawValue: code.description) == code, message)
            #expect(ADIDXCCEntityCode(rawValue: code.description).isRecognized, message)
        }
    }

    @Test("Every entity name the specification lists is distinct per code")
    func reusedNamesAreMarked() {
        let names = ADIDXCCEntityCode.allMembers.map(\.name)

        #expect(Set(names).count == names.count)
    }

    @Test("An entity code no longer assigned to any entity has no name")
    func codeZeroHasNoEntityName() {
        #expect(ADIDXCCEntityCode.noEntity.name != "")
    }

    @Test("An entity code the specification does not define is kept as unrecognized")
    func unknownCodesArePreserved() {
        #expect(ADIDXCCEntityCode(rawValue: "") == .unrecognized(""))
        #expect(ADIDXCCEntityCode(rawValue: "   ") == .unrecognized("   "))
        #expect(ADIDXCCEntityCode(rawValue: "CANADA") == .unrecognized("CANADA"))
        #expect(ADIDXCCEntityCode(rawValue: "99999") == .unrecognized("99999"))
        #expect(!ADIDXCCEntityCode(rawValue: "CANADA").isRecognized)
        #expect(ADIDXCCEntityCode(rawValue: "CANADA").isRecognized == false)
    }

    @Test("An unrecognized entity code keeps the code it was built with")
    func unrecognizedRoundTrip() {
        let future = ADIDXCCEntityCode.unrecognized("99999")

        #expect(future.description == "99999")
        #expect(future.name == "99999")
        #expect(!future.isDeleted)
        #expect(!ADIDXCCEntityCode.allMembers.contains(future))
    }
}