import Foundation

/// A UTC date in the exact form used by the ADIF `Date` data type: eight digits
/// of `YYYYMMDD`.
///
/// The specification requires a four-digit year with `1930 <= YYYY`, a
/// two-digit month with `1 <= MM <= 12`, and a two-digit day with
/// `1 <= DD <= DaysInMonth(MM)`, all using leading zeroes. Sixteen of the
/// specification's QSO fields use this data type, including `QSO_DATE` and
/// `QSO_DATE_OFF`.
///
/// - Note: ADIF conveys no time zone offset, so a date here carries no
///   reference to an instant. Combine it with an ``ADITime`` to obtain one
///   through ``date(timeZone:)``.
public struct ADIDate: Hashable, Sendable, Comparable, CustomStringConvertible {
    /// The earliest year the ADIF `Date` data type permits.
    public static let minimumYear = 1930

    /// The latest year a four-digit year can express.
    public static let maximumYear = 9999

    /// The year, between ``minimumYear`` and ``maximumYear`` inclusive.
    public let year: Int

    /// The month, between `1` and `12` inclusive.
    public let month: Int

    /// The day of the month, between `1` and the number of days in ``month``.
    public let day: Int

    /// The date in its `YYYYMMDD` form.
    public var description: String {
        ADICalendar.padded(year, width: 4)
            + ADICalendar.padded(month, width: 2)
            + ADICalendar.padded(day, width: 2)
    }

    /// Whether this date is in a leap year of the Gregorian calendar.
    public var isLeapYear: Bool {
        ADICalendar.isLeapYear(year)
    }

    /// The number of days in this date's month.
    public var dayCountOfMonth: Int {
        ADICalendar.daysInMonth(month, year: year)
    }

    /// Creates a date from its UTC components.
    ///
    /// - Parameters:
    ///   - year: The year. Must be between ``minimumYear`` and ``maximumYear``
    ///     inclusive.
    ///   - month: The month. Must be between `1` and `12` inclusive.
    ///   - day: The day of the month. Must be between `1` and the number of days
    ///     in `month` inclusive.
    /// - Throws: ``ADIFError/invalidDate(found:)`` if any component is out of
    ///   range.
    public init(year: Int, month: Int, day: Int) throws {
        let rendered = ADICalendar.padded(year, width: 4)
            + ADICalendar.padded(month, width: 2)
            + ADICalendar.padded(day, width: 2)

        guard let date = Self(parsing: rendered) else {
            throw ADIFError.invalidDate(found: rendered)
        }

        self = date
    }

    /// Creates a date from a `Date`, using a calendar's components.
    ///
    /// - Parameters:
    ///   - date: The instant whose date components should be read.
    ///   - timeZone: The time zone whose calendar components should be used.
    ///     Defaults to UTC, which is what ADIF specifies.
    public init(date: Date, timeZone: TimeZone = .gmt) {
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = timeZone
        let components = calendar.dateComponents([.year, .month, .day], from: date)

        year = components.year ?? 1970
        month = components.month ?? 1
        day = components.day ?? 1
    }

    /// Creates a date by parsing the `YYYYMMDD` form.
    ///
    /// - Parameter text: The eight-character date.
    /// - Returns: The parsed date, or `nil` if `text` is malformed or names a
    ///   date that does not exist.
    public init?(parsing text: some StringProtocol) {
        let characters = Array(text)

        guard
            characters.count == 8,
            let year = ADICalendar.digits(characters, at: 0, count: 4),
            let month = ADICalendar.digits(characters, at: 4, count: 2),
            let day = ADICalendar.digits(characters, at: 6, count: 2)
        else {
            return nil
        }

        guard
            ADICalendar.isPermittedYear(year),
            (1...12).contains(month),
            (1...ADICalendar.daysInMonth(month, year: year)).contains(day)
        else {
            return nil
        }

        self.year = year
        self.month = month
        self.day = day
    }

    /// The date as an instant at the start of the day, in the given time zone.
    ///
    /// - Parameter timeZone: The time zone in which midnight is taken.
    ///   Defaults to UTC, which is what ADIF specifies.
    /// - Returns: The corresponding instant, or the Unix epoch if the calendar
    ///   cannot form one.
    public func date(timeZone: TimeZone = .gmt) -> Date {
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = timeZone
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = day

        return calendar.date(from: components) ?? Date(timeIntervalSince1970: 0)
    }

    /// Compares two dates by year, then month, then day.
    ///
    /// - Parameters:
    ///   - lhs: The first date.
    ///   - rhs: The second date.
    /// - Returns: `true` if `lhs` is earlier than `rhs`.
    public static func < (lhs: ADIDate, rhs: ADIDate) -> Bool {
        (lhs.year, lhs.month, lhs.day) < (rhs.year, rhs.month, rhs.day)
    }
}