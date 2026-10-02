import Foundation
import Testing

@testable import SwiftADIFLib

@Suite("ADITime")
struct ADITimeTests {
    @Suite("init?(parsing:)")
    struct ParsingTests {
        static let shortForms: [(text: String, hour: Int, minute: Int, second: Int?)] = [
            ("0000", 0, 0, nil),
            ("1200", 12, 0, nil),
            ("2359", 23, 59, nil),
            ("0930", 9, 30, nil),
        ]

        static let longForms: [(text: String, hour: Int, minute: Int, second: Int)] = [
            ("000000", 0, 0, 0),
            ("120000", 12, 0, 0),
            ("235959", 23, 59, 59),
            ("093045", 9, 30, 45),
        ]

        @Test("reads the four-digit form", arguments: shortForms)
        func readsShortForm(_ sample: (text: String, hour: Int, minute: Int, second: Int?)) {
            let time = ADITime(parsing: sample.text)

            #expect(time?.hour == sample.hour)
            #expect(time?.minute == sample.minute)
            #expect(time?.second == sample.second)
        }

        @Test("reads the six-digit form", arguments: longForms)
        func readsLongForm(_ sample: (text: String, hour: Int, minute: Int, second: Int)) {
            let time = ADITime(parsing: sample.text)

            #expect(time?.hour == sample.hour)
            #expect(time?.minute == sample.minute)
            #expect(time?.second == sample.second)
        }

        @Test(
            "rejects text that is neither four nor six digits",
            arguments: [
                "",
                "0",
                "12",
                "123",
                "12000",
                "1200000",
                "12:00",
                "12:00:00",
                "1200 ",
                " 1200",
                "1 200",
            ]
        )
        func rejectsWrongLength(text: String) {
            #expect(ADITime(parsing: text) == nil)
        }

        @Test("rejects an hour above 23", arguments: ["2400", "240000", "9900", "990000"])
        func rejectsImpossibleHour(text: String) {
            #expect(ADITime(parsing: text) == nil)
        }

        @Test("rejects a minute above 59", arguments: ["1260", "126000", "0099", "009900"])
        func rejectsImpossibleMinute(text: String) {
            #expect(ADITime(parsing: text) == nil)
        }

        @Test("rejects a second above 59", arguments: ["120060", "120099"])
        func rejectsImpossibleSecond(text: String) {
            #expect(ADITime(parsing: text) == nil)
        }

        @Test(
            "rejects six characters whose seconds are not digits",
            arguments: ["1230-1", "1230ab", "1230:1", "1230.0", "1230 1"]
        )
        func rejectsNonDigitSeconds(text: String) {
            #expect(ADITime(parsing: text) == nil)
        }

        @Test(
            "requires ASCII digits",
            arguments: ["１２３４", "١٢٣٤", "12٠0", "12:0٠"]
        )
        func rejectsNonASCIIDigits(text: String) {
            #expect(ADITime(parsing: text) == nil)
        }

        @Test("treats the boundary values as valid", arguments: [
            "0000",
            "2359",
            "000000",
            "235959",
        ])
        func acceptsBoundaries(text: String) {
            #expect(ADITime(parsing: text) != nil)
        }
    }

    @Suite("init(hour:minute:)")
    struct ShortInitTests {
        @Test("omits the seconds")
        func omitsSeconds() throws {
            let time = try ADITime(hour: 12, minute: 30)

            #expect(time.second == nil)
            #expect(!time.includesSeconds)
            #expect(time.description == "1230")
        }

        @Test(
            "throws for an out-of-range component",
            arguments: [
                (hour: 24, minute: 0),
                (hour: -1, minute: 0),
                (hour: 0, minute: 60),
                (hour: 0, minute: -1),
            ]
        )
        func throwsForOutOfRange(_ sample: (hour: Int, minute: Int)) {
            #expect(throws: ADIFError.self) {
                try ADITime(hour: sample.hour, minute: sample.minute)
            }
        }

        @Test("reports the offending value", arguments: [
            (hour: 24, minute: 0, found: "2400"),
            (hour: 12, minute: 60, found: "1260"),
        ])
        func reportsOffendingValue(_ sample: (hour: Int, minute: Int, found: String)) {
            #expect(throws: ADIFError.invalidTime(found: sample.found)) {
                try ADITime(hour: sample.hour, minute: sample.minute)
            }
        }
    }

    @Suite("init(hour:minute:second:)")
    struct LongInitTests {
        @Test("includes the seconds when given")
        func includesSeconds() throws {
            let time = try ADITime(hour: 12, minute: 30, second: 45)

            #expect(time.second == 45)
            #expect(time.includesSeconds)
            #expect(time.description == "123045")
        }

        @Test("omits the seconds when the second is nil")
        func omitsNilSeconds() throws {
            let time = try ADITime(hour: 12, minute: 30, second: nil)

            #expect(time.second == nil)
            #expect(time.description == "1230")
        }

        @Test(
            "throws for an out-of-range second",
            arguments: [60, 99, -1]
        )
        func throwsForImpossibleSecond(second: Int) {
            let rendered = "1230" + ADICalendar.padded(second, width: 2)

            #expect(throws: ADIFError.invalidTime(found: rendered)) {
                try ADITime(hour: 12, minute: 30, second: second)
            }
        }
    }

    @Suite("description")
    struct DescriptionTests {
        @Test("uses the width the specification allows", arguments: [
            (0, 0, nil, "0000"),
            (9, 5, nil, "0905"),
            (23, 59, nil, "2359"),
            (0, 0, 0, "000000"),
            (9, 5, 7, "090507"),
            (23, 59, 59, "235959"),
        ])
        func usesAllowedWidth(
            _ sample: (hour: Int, minute: Int, second: Int?, expected: String)
        ) throws {
            let time = try ADITime(hour: sample.hour, minute: sample.minute, second: sample.second)

            #expect(time.description == sample.expected)
        }

        @Test("produces four characters without seconds and six with them", arguments: [
            (12, 30, nil, 4),
            (12, 30, 45, 6),
        ])
        func producesExpectedCharacterCount(
            _ sample: (hour: Int, minute: Int, second: Int?, count: Int)
        ) throws {
            let time = try ADITime(hour: sample.hour, minute: sample.minute, second: sample.second)

            #expect(time.description.count == sample.count)
        }
    }

    @Suite("round trip")
    struct RoundTripTests {
        @Test("a four-digit time stays four digits", arguments: ["0000", "1200", "2359"])
        func shortFormStaysShort(text: String) throws {
            let time = try #require(ADITime(parsing: text))

            #expect(time.description == text)
            #expect(!time.includesSeconds)
        }

        @Test("a six-digit time stays six digits", arguments: [
            "000000",
            "120000",
            "235959",
        ])
        func longFormStaysLong(text: String) throws {
            let time = try #require(ADITime(parsing: text))

            #expect(time.description == text)
            #expect(time.includesSeconds)
        }

        @Test("components survive a parse and describe cycle", arguments: [
            (0, 0, nil),
            (12, 30, nil),
            (23, 59, 59),
        ])
        func survivesComponentCycle(_ sample: (hour: Int, minute: Int, second: Int?)) throws {
            let original = try ADITime(
                hour: sample.hour,
                minute: sample.minute,
                second: sample.second
            )

            #expect(ADITime(parsing: original.description) == original)
        }
    }

    @Suite("init(date:timeZone:)")
    struct DateConversionTests {
        @Test("reads components in UTC")
        func readsComponentsInUTC() {
            let instant = Date(timeIntervalSince1970: 45_000)
            let time = ADITime(date: instant)

            #expect(time.hour == 12)
            #expect(time.minute == 30)
            #expect(time.second == 0)
        }

        @Test("honours the given time zone")
        func honoursTimeZone() throws {
            let zone = try #require(TimeZone(identifier: "Asia/Tokyo"))
            let instant = Date(timeIntervalSince1970: 45_000)

            #expect(ADITime(date: instant, timeZone: .gmt).description == "123000")
            #expect(ADITime(date: instant, timeZone: zone).description == "213000")
        }
    }

    @Suite("ordering")
    struct ComparableTests {
        @Test("sorts chronologically", arguments: [
            ("0000", "0001"),
            ("1200", "1201"),
            ("120000", "120001"),
            ("1259", "1300"),
            ("235959", "235959"),
        ])
        func sortsChronologically(_ pair: (String, String)) throws {
            let earlier = try #require(ADITime(parsing: pair.0))
            let later = try #require(ADITime(parsing: pair.1))

            #expect(earlier <= later)
            #expect(later >= earlier)
        }

        @Test("a time without seconds sorts before the same time with seconds")
        func shortFormSortsBeforeLongForm() throws {
            let short = try ADITime(hour: 12, minute: 30)
            let long = try ADITime(hour: 12, minute: 30, second: 0)

            #expect(short < long)
            #expect(!(long < short))
        }

        @Test("equal times are not less than each other")
        func equalTimesAreNotLessThan() throws {
            let first = try ADITime(hour: 12, minute: 30, second: 45)
            let second = try ADITime(hour: 12, minute: 30, second: 45)

            #expect(first == second)
            #expect(!(first < second))
        }
    }

    @Suite("now")
    struct NowTests {
        @Test("falls between the instants sampled around it")
        func fallsBetweenSamples() {
            let before = Date()
            let now = ADITime.now
            let after = Date()

            #expect(now.includesSeconds)
            #expect(ADITime(date: before) <= now)
            #expect(now <= ADITime(date: after))
        }

        @Test("uses UTC rather than the machine's zone")
        func usesUTC() {
            #expect(ADITime.now == ADITime(date: Date(), timeZone: .gmt))
        }
    }
}