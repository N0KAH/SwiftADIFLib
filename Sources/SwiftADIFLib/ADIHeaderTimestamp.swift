import Foundation

/// A UTC date and time in the exact form used by the ADIF `CREATED_TIMESTAMP`
/// header field: fifteen characters of `YYYYMMDD HHMMSS`.
///
/// The first eight characters are an ``ADIDate`` and the last six are an
/// ``ADITime``, joined by a single space character.
///
/// - Note: This type models the `CREATED_TIMESTAMP` header field, whose data
///   type is `String`. It is deliberately restricted to second resolution and
///   to UTC because ADIF conveys no time zone offset. It is a different format
///   from the `Date` and `Time` data types that ADI records use, which is why
///   it is a type of its own rather than an ``ADIDate`` and ``ADITime``
///   composed together.
public struct ADIHeaderTimestamp: Hashable, Sendable, CustomStringConvertible {
    /// The year, between `1930` and `9999` inclusive.
    public let year: Int

    /// The month, between `1` and `12` inclusive.
    public let month: Int

    /// The day of the month, between `1` and the number of days in ``month``.
    public let day: Int

    /// The hour, between `0` and `23` inclusive.
    public let hour: Int

    /// The minute, between `0` and `59` inclusive.
    public let minute: Int

    /// The second, between `0` and `59` inclusive.
    public let second: Int

    /// The current date and time in UTC.
    public static var now: ADIHeaderTimestamp {
        ADIHeaderTimestamp(date: Date())
    }

    /// The timestamp in its `YYYYMMDD HHMMSS` form.
    public var description: String {
        Self.render(
            year: year,
            month: month,
            day: day,
            hour: hour,
            minute: minute,
            second: second
        )
    }

    /// Creates a timestamp from its UTC components.
    ///
    /// - Parameters:
    ///   - year: The year. Must be between `1930` and `9999` inclusive.
    ///   - month: The month. Must be between `1` and `12` inclusive.
    ///   - day: The day of the month. Must be between `1` and the number of
    ///     days in `month` inclusive.
    ///   - hour: The hour. Must be between `0` and `23` inclusive.
    ///   - minute: The minute. Must be between `0` and `59` inclusive.
    ///   - second: The second. Must be between `0` and `59` inclusive.
    /// - Throws: ``ADIFError/invalidTimestamp(found:)`` if any component is out
    ///   of range.
    public init(year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int) throws {
        let rendered = Self.render(year: year, month: month, day: day, hour: hour, minute: minute, second: second)

        guard let timestamp = Self(parsing: rendered) else {
            throw ADIFError.invalidTimestamp(found: rendered)
        }

        self = timestamp
    }

    /// Creates a timestamp from a `Date`.
    ///
    /// - Parameters:
    ///   - date: The instant to convert.
    ///   - timeZone: The time zone whose calendar components should be used.
    ///     Defaults to UTC, which is what ADIF specifies.
    public init(date: Date, timeZone: TimeZone = .gmt) {
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = timeZone
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)

        year = components.year ?? 1970
        month = components.month ?? 1
        day = components.day ?? 1
        hour = components.hour ?? 0
        minute = components.minute ?? 0
        second = components.second ?? 0
    }

    /// Creates a timestamp by parsing the `YYYYMMDD HHMMSS` form.
    ///
    /// - Parameter timestamp: The fifteen-character timestamp.
    /// - Returns: The parsed timestamp, or `nil` if `timestamp` is malformed or
    ///   names a date or time that does not exist.
    public init?(parsing timestamp: some StringProtocol) {
        let characters = Array(timestamp)

        guard
            characters.count == 15,
            characters[8] == " "
        else {
            return nil
        }

        guard
            let year = ADICalendar.digits(characters, at: 0, count: 4),
            let month = ADICalendar.digits(characters, at: 4, count: 2),
            let day = ADICalendar.digits(characters, at: 6, count: 2),
            let hour = ADICalendar.digits(characters, at: 9, count: 2),
            let minute = ADICalendar.digits(characters, at: 11, count: 2),
            let second = ADICalendar.digits(characters, at: 13, count: 2)
        else {
            return nil
        }

        guard
            ADICalendar.isPermittedYear(year),
            (1...12).contains(month),
            (1...ADICalendar.daysInMonth(month, year: year)).contains(day),
            (0...23).contains(hour),
            (0...59).contains(minute),
            (0...59).contains(second)
        else {
            return nil
        }

        self.year = year
        self.month = month
        self.day = day
        self.hour = hour
        self.minute = minute
        self.second = second
    }

    /// The timestamp as a `Date`, interpreted in the given time zone.
    ///
    /// - Parameter timeZone: The time zone in which the components are
    ///   interpreted. Defaults to UTC, which is what ADIF specifies.
    /// - Returns: The corresponding instant.
    public func date(timeZone: TimeZone = .gmt) -> Date {
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = timeZone
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        components.hour = hour
        components.minute = minute
        components.second = second

        return calendar.date(from: components) ?? Date(timeIntervalSince1970: 0)
    }

    private static func render(
        year: Int,
        month: Int,
        day: Int,
        hour: Int,
        minute: Int,
        second: Int
    ) -> String {
        let date = ADICalendar.padded(year, width: 4)
            + ADICalendar.padded(month, width: 2)
            + ADICalendar.padded(day, width: 2)
        let time = ADICalendar.padded(hour, width: 2)
            + ADICalendar.padded(minute, width: 2)
            + ADICalendar.padded(second, width: 2)

        return date + " " + time
    }
}
