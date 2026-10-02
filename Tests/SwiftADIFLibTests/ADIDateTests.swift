import Foundation
import Testing

@testable import SwiftADIFLib

@Suite("ADIDate")
struct ADIDateTests {
    @Suite("init?(parsing:)")
    struct ParsingTests {
        @Test("reads all eight digits", arguments: [
            ("20240229", 2024, 2, 29),
            ("19300101", 1930, 1, 1),
            ("99991231", 9999, 12, 31),
            ("20000101", 2000, 1, 1),
        ])
        func readsComponents(_ sample: (text: String, year: Int, month: Int, day: Int)) {
            let date = ADIDate(parsing: sample.text)

            #expect(date?.year == sample.year)
            #expect(date?.month == sample.month)
            #expect(date?.day == sample.day)
        }

        @Test(
            "rejects text that is not eight digits",
            arguments: [
                "",
                "2",
                "2024010",
                "202401011",
                "2024-01-01",
                "2024/01/01",
                "20240101 ",
                " 20240101",
            ]
        )
        func rejectsWrongLength(text: String) {
            #expect(ADIDate(parsing: text) == nil)
        }

        @Test("rejects years the specification excludes", arguments: [
            "19291231",
            "19290101",
            "00000101",
            "18991231",
        ])
        func rejectsYearsBelowMinimum(text: String) {
            #expect(ADIDate(parsing: text) == nil)
        }

        @Test("requires a real month", arguments: [
            "20240001",
            "20241301",
            "20240100",
            "20240132",
        ])
        func rejectsImpossibleMonths(text: String) {
            #expect(ADIDate(parsing: text) == nil)
        }

        @Test("requires a real day for the month", arguments: [
            "20240100",
            "20240132",
            "20210431",
            "20220631",
            "20230229",
            "19000229",
            "21000229",
        ])
        func rejectsImpossibleDays(text: String) {
            #expect(ADIDate(parsing: text) == nil)
        }

        @Test("accepts February 29 in a Gregorian leap year", arguments: [
            "20240229",
            "20000229",
            "20200229",
            "19960229",
        ])
        func acceptsLeapDay(text: String) {
            #expect(ADIDate(parsing: text) != nil)
        }

        @Test(
            "requires ASCII digits",
            arguments: ["２０２４０１０１", "٢٠٢٤٠١٠١", "2024٠١٠1", "٢0٢40101"]
        )
        func rejectsNonASCIIDigits(text: String) {
            #expect(ADIDate(parsing: text) == nil)
        }
    }

    @Suite("init(year:month:day:)")
    struct ThrowingInitTests {
        @Test("accepts a valid date")
        func acceptsValidDate() throws {
            let date = try ADIDate(year: 2024, month: 2, day: 29)

            #expect(date.year == 2024)
            #expect(date.month == 2)
            #expect(date.day == 29)
        }

        @Test(
            "throws for an out-of-range component",
            arguments: [
                (year: 1929, month: 1, day: 1),
                (year: 2024, month: 0, day: 1),
                (year: 2024, month: 13, day: 1),
                (year: 2024, month: 1, day: 0),
                (year: 2024, month: 1, day: 32),
                (year: 2023, month: 2, day: 29),
            ]
        )
        func throwsForOutOfRange(_ sample: (year: Int, month: Int, day: Int)) {
            #expect(throws: ADIFError.self) {
                try ADIDate(year: sample.year, month: sample.month, day: sample.day)
            }
        }

        @Test("reports the offending value", arguments: [
            (year: 1929, month: 1, day: 1, found: "19290101"),
            (year: 2024, month: 13, day: 1, found: "20241301"),
            (year: 2023, month: 2, day: 29, found: "20230229"),
            (year: 2024, month: 0, day: 1, found: "20240001"),
        ])
        func reportsOffendingValue(_ sample: (year: Int, month: Int, day: Int, found: String)) {
            #expect(throws: ADIFError.invalidDate(found: sample.found)) {
                try ADIDate(year: sample.year, month: sample.month, day: sample.day)
            }
        }
    }

    @Suite("description")
    struct DescriptionTests {
        @Test("pads each component to its fixed width", arguments: [
            (year: 2024, month: 1, day: 1, expected: "20240101"),
            (year: 1930, month: 12, day: 31, expected: "19301231"),
            (year: 9999, month: 9, day: 9, expected: "99990909"),
        ])
        func padsComponents(_ sample: (year: Int, month: Int, day: Int, expected: String)) throws {
            let date = try ADIDate(year: sample.year, month: sample.month, day: sample.day)

            #expect(date.description == sample.expected)
        }

        @Test("always produces eight characters", arguments: [
            (1930, 1, 1),
            (2024, 2, 29),
            (9999, 12, 31),
        ])
        func alwaysProducesEightCharacters(_ sample: (Int, Int, Int)) throws {
            let date = try ADIDate(year: sample.0, month: sample.1, day: sample.2)

            #expect(date.description.count == 8)
        }
    }

    @Suite("round trip")
    struct RoundTripTests {
        @Test("parsing then describing returns the input", arguments: [
            "19300101",
            "20240229",
            "20231231",
            "20240101",
            "99991231",
        ])
        func roundTrips(text: String) {
            #expect(ADIDate(parsing: text)?.description == text)
        }

        @Test("components survive a parse and describe cycle", arguments: [
            (2024, 2, 29),
            (1970, 1, 1),
            (2000, 2, 29),
            (2101, 12, 31),
        ])
        func survivesComponentCycle(_ sample: (Int, Int, Int)) throws {
            let original = try ADIDate(year: sample.0, month: sample.1, day: sample.2)

            #expect(ADIDate(parsing: original.description) == original)
        }
    }

    @Suite("init(date:timeZone:)")
    struct DateConversionTests {
        @Test("reads components in UTC")
        func readsComponentsInUTC() {
            let instant = Date(timeIntervalSince1970: 0)
            let date = ADIDate(date: instant)

            #expect(date == ADIDate(parsing: "19700101"))
        }

        @Test("honours the given time zone, which can shift the UTC day")
        func honoursTimeZone() throws {
            let tokyo = try #require(TimeZone(identifier: "Asia/Tokyo"))
            var tokyoCalendar = Calendar(identifier: .gregorian)
            tokyoCalendar.timeZone = tokyo

            let instant = try #require(
                tokyoCalendar.date(from: DateComponents(year: 1970, month: 1, day: 1))
            )

            #expect(ADIDate(date: instant, timeZone: .gmt).description == "19691231")
            #expect(ADIDate(date: instant, timeZone: tokyo).description == "19700101")
        }
    }

    @Suite("date(timeZone:)")
    struct InstantTests {
        @Test("returns the start of the day")
        func returnsStartOfDay() throws {
            let date = try ADIDate(year: 2024, month: 2, day: 29)
            let instant = date.date()

            #expect(instant == Date(timeIntervalSince1970: 1_709_164_800))
        }

        @Test("round trips through an instant", arguments: [
            (1970, 1, 1),
            (2024, 2, 29),
            (2038, 1, 19),
        ])
        func roundTripsThroughInstant(_ sample: (Int, Int, Int)) throws {
            let date = try ADIDate(year: sample.0, month: sample.1, day: sample.2)

            #expect(ADIDate(date: date.date()) == date)
        }
    }

    @Suite("ordering")
    struct ComparableTests {
        @Test("sorts chronologically", arguments: [
            ("19300101", "19300102"),
            ("20240131", "20240201"),
            ("20231231", "20240101"),
            ("20240101", "20240101"),
        ])
        func sortsChronologically(_ pair: (String, String)) throws {
            let earlier = try #require(ADIDate(parsing: pair.0))
            let later = try #require(ADIDate(parsing: pair.1))

            #expect(earlier <= later)
            #expect(later >= earlier)
        }

        @Test("a repeated date is neither less nor greater")
        func equalDatesAreNotLessThan() throws {
            let first = try #require(ADIDate(parsing: "20240229"))
            let second = try #require(ADIDate(parsing: "20240229"))

            #expect(first == second)
            #expect(!(first < second))
        }
    }

    @Suite("derived values")
    struct DerivedValueTests {
        @Test("follows the Gregorian leap year rule", arguments: [
            (2024, true),
            (2023, false),
            (1900, false),
            (2000, true),
            (2100, false),
            (2400, true),
        ])
        func followsGregorianRule(_ pair: (year: Int, isLeap: Bool)) throws {
            let date = try ADIDate(year: max(pair.year, ADIDate.minimumYear), month: 1, day: 1)

            #expect(date.isLeapYear == pair.isLeap)
        }

        @Test("reports the number of days in the month", arguments: [
            (2024, 1, 31),
            (2024, 2, 29),
            (2023, 2, 28),
            (2024, 4, 30),
            (2024, 12, 31),
        ])
        func reportsDayCount(_ sample: (year: Int, month: Int, days: Int)) throws {
            let date = try ADIDate(year: sample.year, month: sample.month, day: 1)

            #expect(date.dayCountOfMonth == sample.days)
        }

        @Test("exposes the specification's year bounds")
        func exposesYearBounds() {
            #expect(ADIDate.minimumYear == 1930)
            #expect(ADIDate.maximumYear == 9999)
        }
    }
}