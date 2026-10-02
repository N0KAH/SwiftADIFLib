import Foundation
import Testing

@testable import SwiftADIFLib

@Suite("ADIHeaderTimestamp")
struct ADIHeaderTimestampTests {
    @Suite("init?(parsing:)")
    struct ParsingTests {
        @Test("accepts the form documented by the specification")
        func acceptsDocumentedForm() throws {
            let timestamp = try #require(ADIHeaderTimestamp(parsing: "20240115 143055"))

            #expect(timestamp.year == 2024)
            #expect(timestamp.month == 1)
            #expect(timestamp.day == 15)
            #expect(timestamp.hour == 14)
            #expect(timestamp.minute == 30)
            #expect(timestamp.second == 55)
        }

        @Test("accepts midnight and the end of the day")
        func acceptsBoundariesOfDay() throws {
            let start = try #require(ADIHeaderTimestamp(parsing: "20240101 000000"))
            let end = try #require(ADIHeaderTimestamp(parsing: "20240101 235959"))

            #expect(start.hour == 0 && start.minute == 0 && start.second == 0)
            #expect(end.hour == 23 && end.minute == 59 && end.second == 59)
        }

        @Test(arguments: [
            "",
            "20240115143055",
            "2024011 143055",
            "2024-01-15 14:30:55",
            "20240115-143055",
            "20240115 1430",
            "20240115 1430550",
        ])
        func rejectsMalformedTimestamps(_ text: String) {
            #expect(ADIHeaderTimestamp(parsing: text) == nil)
        }

        @Test("rejects non-ASCII digits")
        func rejectsNonASCIIDigits() {
            #expect(ADIHeaderTimestamp(parsing: "٢٠٢٤٠١١٥ ١٤٣٠٥٥") == nil)
        }

        @Test("rejects a year before 1930")
        func rejectsEarlyYear() {
            #expect(ADIHeaderTimestamp(parsing: "19291231 235959") == nil)
            #expect(ADIHeaderTimestamp(parsing: "19300101 000000") != nil)
        }

        @Test("rejects a month outside 1 through 12", arguments: ["00", "13"])
        func rejectsImpossibleMonth(_ month: String) {
            #expect(ADIHeaderTimestamp(parsing: "2024\(month)15 000000") == nil)
        }

        @Test("rejects a day beyond the length of the month", arguments: [
            "20240230", // February in a non-leap year.
            "20240431", // April has 30 days.
            "20240132", // January has 31 days.
        ])
        func rejectsImpossibleDay(_ day: String) {
            #expect(ADIHeaderTimestamp(parsing: "\(day) 000000") == nil)
        }

        @Test("accepts February 29 in a leap year")
        func acceptsLeapDay() {
            #expect(ADIHeaderTimestamp(parsing: "20240229 000000") != nil)
            #expect(ADIHeaderTimestamp(parsing: "20000229 000000") != nil)
        }

        @Test("rejects February 29 in a century that is not a leap year")
        func rejectsNonLeapCenturyDay() {
            #expect(ADIHeaderTimestamp(parsing: "19000229 000000") == nil)
            #expect(ADIHeaderTimestamp(parsing: "20000229 000000") != nil)
        }

        @Test("rejects an hour, minute, or second beyond its range", arguments: [
            "20240115 243055",
            "20240115 146055",
            "20240115 143060",
        ])
        func rejectsImpossibleTime(_ text: String) {
            #expect(ADIHeaderTimestamp(parsing: text) == nil)
        }
    }

    @Suite("description")
    struct DescriptionTests {
        @Test("renders the form documented by the specification")
        func rendersDocumentedForm() throws {
            let timestamp = try ADIHeaderTimestamp(
                year: 2024,
                month: 1,
                day: 15,
                hour: 14,
                minute: 30,
                second: 55
            )

            #expect(timestamp.description == "20240115 143055")
        }

        @Test("pads every component to its required width")
        func padsComponents() throws {
            let timestamp = try ADIHeaderTimestamp(
                year: 2001,
                month: 2,
                day: 3,
                hour: 4,
                minute: 5,
                second: 6
            )

            #expect(timestamp.description == "20010203 040506")
        }

        @Test("round trips through its textual form")
        func roundTripsThroughTextualForm() throws {
            let texts = [
                "20240115 143055",
                "19300101 000000",
                "20000229 235959",
            ]

            for text in texts {
                let timestamp = try #require(ADIHeaderTimestamp(parsing: text))

                #expect(timestamp.description == text)
            }
        }
    }

    @Suite("init(year:month:day:hour:minute:second:)")
    struct ValidatingInitializerTests {
        @Test("accepts a valid date and time")
        func acceptsValidDateAndTime() throws {
            let timestamp = try ADIHeaderTimestamp(
                year: 2024,
                month: 6,
                day: 30,
                hour: 23,
                minute: 59,
                second: 59
            )

            #expect(timestamp.description == "20240630 235959")
        }

        @Test("rejects an out-of-range component")
        func rejectsOutOfRangeComponent() {
            #expect(throws: ADIFError.invalidTimestamp(found: "20240001 000000")) {
                try ADIHeaderTimestamp(year: 2024, month: 0, day: 1, hour: 0, minute: 0, second: 0)
            }

            #expect(throws: ADIFError.self) {
                try ADIHeaderTimestamp(year: 2024, month: 1, day: 32, hour: 0, minute: 0, second: 0)
            }
        }
    }

    @Suite("init(date:timeZone:)")
    struct DateInitializerTests {
        @Test("converts an instant to UTC by default")
        func convertsToUTCByDefault() throws {
            let instant = try #require(
                DateComponents(
                    calendar: Calendar(identifier: .gregorian),
                    timeZone: TimeZone.gmt,
                    year: 2024,
                    month: 1,
                    day: 15,
                    hour: 14,
                    minute: 30,
                    second: 55
                ).date
            )

            let timestamp = ADIHeaderTimestamp(date: instant)

            #expect(timestamp.description == "20240115 143055")
        }

        @Test("honors the supplied time zone")
        func honorsSuppliedTimeZone() throws {
            let instant = try #require(
                DateComponents(
                    calendar: Calendar(identifier: .gregorian),
                    timeZone: TimeZone.gmt,
                    year: 2024,
                    month: 1,
                    day: 15,
                    hour: 14,
                    minute: 30,
                    second: 55
                ).date
            )

            let timeZone = try #require(TimeZone(identifier: "GMT+2"))
            let timestamp = ADIHeaderTimestamp(date: instant, timeZone: timeZone)

            #expect(timestamp.description == "20240115 163055")
        }

        @Test("now produces a parseable timestamp")
        func nowIsParseable() {
            let now = ADIHeaderTimestamp.now

            #expect(ADIHeaderTimestamp(parsing: now.description) == now)
            #expect(now.year >= 1930)
        }
    }

    @Suite("date(timeZone:)")
    struct DateAccessorTests {
        @Test("recovers the instant it was created from")
        func recoversInstant() throws {
            let timestamp = try ADIHeaderTimestamp(
                year: 2024,
                month: 1,
                day: 15,
                hour: 14,
                minute: 30,
                second: 55
            )

            #expect(ADIHeaderTimestamp(date: timestamp.date()) == timestamp)
        }
    }

    @Suite("isLeapYear(_:)")
    struct LeapYearTests {
        @Test("follows the Gregorian rule", arguments: [
            (2024, true),
            (2023, false),
            (1900, false),
            (2000, true),
            (2100, false),
        ])
        func followsGregorianRule(_ pair: (year: Int, isLeap: Bool)) {
            #expect(ADIHeaderTimestamp.isLeapYear(pair.year) == pair.isLeap)
        }
    }
}