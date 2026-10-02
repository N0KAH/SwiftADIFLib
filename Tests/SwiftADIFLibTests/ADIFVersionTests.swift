import Testing

@testable import SwiftADIFLib

@Suite("ADIFVersion")
struct ADIFVersionTests {
    @Suite("current")
    struct CurrentTests {
        @Test("is the version this library implements")
        func isTheVersionThisLibraryImplements() {
            #expect(ADIFVersion.current.description == "3.1.7")
        }

        @Test("is accepted by the validating initializer")
        func isAcceptedByValidatingInitializer() throws {
            let version = try ADIFVersion(
                epoch: ADIFVersion.current.epoch,
                major: ADIFVersion.current.major,
                minor: ADIFVersion.current.minor
            )

            #expect(version == ADIFVersion.current)
        }

        @Test("round trips through its textual form")
        func roundTripsThroughTextualForm() {
            let parsed = ADIFVersion(parsing: ADIFVersion.current.description)

            #expect(parsed == ADIFVersion.current)
        }
    }

    @Suite("init(epoch:major:minor:)")
    struct ValidatingInitializerTests {
        @Test(arguments: [
            (epoch: 3, major: 1, minor: 7),
            (epoch: 1, major: 0, minor: 0),
            (epoch: 2, major: 9, minor: 9),
            (epoch: 99, major: 0, minor: 0),
        ])
        func acceptsInRangeComponents(_ components: (epoch: Int, major: Int, minor: Int)) throws {
            let version = try ADIFVersion(
                epoch: components.epoch,
                major: components.major,
                minor: components.minor
            )

            #expect(version.epoch == components.epoch)
            #expect(version.major == components.major)
            #expect(version.minor == components.minor)
        }

        @Test(arguments: [
            (epoch: 0, major: 1, minor: 7),
            (epoch: -1, major: 1, minor: 7),
            (epoch: 3, major: 10, minor: 7),
            (epoch: 3, major: -1, minor: 7),
            (epoch: 3, major: 1, minor: 10),
            (epoch: 3, major: 1, minor: -1),
        ])
        func rejectsOutOfRangeComponents(_ components: (epoch: Int, major: Int, minor: Int)) {
            #expect(throws: ADIFError.self) {
                try ADIFVersion(epoch: components.epoch, major: components.major, minor: components.minor)
            }
        }

        @Test("reports which component was out of range")
        func reportsWhichComponentWasOutOfRange() {
            #expect(throws: ADIFError.invalidVersionComponent(name: "major", value: 10)) {
                try ADIFVersion(epoch: 3, major: 10, minor: 7)
            }
        }
    }

    @Suite("init?(parsing:)")
    struct ParsingTests {
        @Test(arguments: ["3.1.7", "1.0.0", "10.9.9"])
        func acceptsValidVersions(_ text: String) throws {
            let version = try #require(ADIFVersion(parsing: text))

            #expect(version.description == text)
        }

        @Test(arguments: [
            "",
            "3",
            "3.1",
            "3.1.7.1",
            "3.1.7 ",
            " 3.1.7",
            "0.0.0",
            "3.1.10",
            "v3.1.7",
            "3.1.7a",
            "3..7",
            "3.1.",
            ".1.7",
            "abc",
            "+3.1.7",
            "3.1.+7",
            "٣.1.7",
            "3.1.٧",
        ])
        func rejectsMalformedVersions(_ text: String) {
            #expect(ADIFVersion(parsing: text) == nil)
        }

        @Test("normalizes leading zeroes away", arguments: [
            ("03.01.7", 3, 1, 7),
            ("0003.1.7", 3, 1, 7),
            ("3.01.007", 3, 1, 7),
        ])
        func normalizesLeadingZeroes(
            _ text: String,
            _ epoch: Int,
            _ major: Int,
            _ minor: Int
        ) throws {
            let version = try #require(ADIFVersion(parsing: text))

            #expect(version.epoch == epoch)
            #expect(version.major == major)
            #expect(version.minor == minor)
        }
    }

    @Suite("Comparable")
    struct ComparableTests {
        @Test("orders by epoch, then major, then minor")
        func ordersByComponents() throws {
            let older = try ADIFVersion(epoch: 3, major: 1, minor: 6)
            let newer = try ADIFVersion(epoch: 3, major: 1, minor: 7)

            #expect(older < newer)
            #expect(newer > older)

            let laterEpoch = try ADIFVersion(epoch: 4, major: 0, minor: 0)

            #expect(newer < laterEpoch)
        }

        @Test("equal versions are not ordered")
        func equalVersionsAreNotOrdered() {
            #expect(!(ADIFVersion.current < ADIFVersion.current))
        }
    }
}