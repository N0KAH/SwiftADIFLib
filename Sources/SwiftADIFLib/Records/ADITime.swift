import Foundation

/// A UTC time in the exact form used by the ADIF `Time` data type: either four
/// digits of `HHMM` or six digits of `HHMMSS`.
///
/// The specification defines this data type as "6 Digits representing a UTC
/// time in HHMMSS format or 4 Digits representing a time in HHMM format", where
/// the hour is between `0` and `23`, and the minute and second are between `0`
/// and `59`, all using leading zeroes. Both forms are legal, so a time carries
/// an optional ``second``; a time read as `HHMM` is written back as `HHMM`,
/// because the specification gives no rule preferring one form over the other
/// and inventing a zero second would assert precision the file did not carry.
///
/// - Note: The `Time` data type is used by `TIME_ON` and `TIME_OFF`.
public struct ADITime: Hashable, Sendable, Comparable, CustomStringConvertible {
    /// The hour, between `0` and `23` inclusive.
    public let hour: Int

    /// The minute, between `0` and `59` inclusive.
    public let minute: Int

    /// The second, between `0` and `59` inclusive, or `nil` when the time was
    /// conveyed in the four-digit `HHMM` form.
    public let second: Int?

    /// The current time in UTC, at second resolution.
    public static var now: ADITime {
        ADITime(date: Date())
    }

    /// The time in its `HHMM` or `HHMMSS` form.
    ///
    /// - Note: The seconds are omitted when ``second`` is `nil`, which is how
    ///   a time that was read in the four-digit form is written back.
    public var description: String {
        var result = ADICalendar.padded(hour, width: 2) + ADICalendar.padded(minute, width: 2)

        if let second {
            result += ADICalendar.padded(second, width: 2)
        }

        return result
    }

    /// Whether the time conveys seconds, and so is written in the six-digit
    /// `HHMMSS` form.
    public var includesSeconds: Bool {
        second != nil
    }

    /// Creates a time from its UTC components, omitting the seconds.
    ///
    /// - Parameters:
    ///   - hour: The hour. Must be between `0` and `23` inclusive.
    ///   - minute: The minute. Must be between `0` and `59` inclusive.
    /// - Throws: ``ADIFError/invalidTime(found:)`` if either component is out of
    ///   range.
    public init(hour: Int, minute: Int) throws {
        try self.init(hour: hour, minute: minute, second: nil)
    }

    /// Creates a time from its UTC components.
    ///
    /// - Parameters:
    ///   - hour: The hour. Must be between `0` and `23` inclusive.
    ///   - minute: The minute. Must be between `0` and `59` inclusive.
    ///   - second: The second, between `0` and `59` inclusive, or `nil` to
    ///     convey the time in the four-digit `HHMM` form.
    /// - Throws: ``ADIFError/invalidTime(found:)`` if any component is out of
    ///   range.
    public init(hour: Int, minute: Int, second: Int?) throws {
        let rendered = ADICalendar.padded(hour, width: 2) + ADICalendar.padded(minute, width: 2)
        var candidate = rendered

        if let second {
            candidate += ADICalendar.padded(second, width: 2)
        }

        guard let time = Self(parsing: candidate) else {
            throw ADIFError.invalidTime(found: candidate)
        }

        self = time
    }

    /// Creates a time from components that a calendar has already guaranteed to
    /// be in range.
    private init(uncheckedHour: Int, uncheckedMinute: Int, uncheckedSecond: Int?) {
        hour = uncheckedHour
        minute = uncheckedMinute
        second = uncheckedSecond
    }

    /// Creates a time from a `Date`, using a calendar's components.
    ///
    /// The seconds are always present, because an instant resolves to a
    /// specific second.
    ///
    /// - Parameters:
    ///   - date: The instant whose time components should be read.
    ///   - timeZone: The time zone whose calendar components should be used.
    ///     Defaults to UTC, which is what ADIF specifies.
    public init(date: Date, timeZone: TimeZone = .gmt) {
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = timeZone
        let components = calendar.dateComponents([.hour, .minute, .second], from: date)

        self.init(
            uncheckedHour: components.hour ?? 0,
            uncheckedMinute: components.minute ?? 0,
            uncheckedSecond: components.second ?? 0
        )
    }

    /// Creates a time by parsing the `HHMM` or `HHMMSS` form.
    ///
    /// - Parameter text: The four- or six-character time.
    /// - Returns: The parsed time, or `nil` if `text` is malformed or names a
    ///   time that does not exist.
    public init?(parsing text: some StringProtocol) {
        let characters = Array(text)

        guard characters.count == 4 || characters.count == 6 else {
            return nil
        }

        guard
            let hour = ADICalendar.digits(characters, at: 0, count: 2),
            let minute = ADICalendar.digits(characters, at: 2, count: 2)
        else {
            return nil
        }

        guard
            (0...23).contains(hour),
            (0...59).contains(minute)
        else {
            return nil
        }

        self.hour = hour
        self.minute = minute

        if characters.count == 6 {
            guard
                let second = ADICalendar.digits(characters, at: 4, count: 2),
                (0...59).contains(second)
            else {
                return nil
            }

            self.second = second
        } else {
            self.second = nil
        }
    }

    /// Compares two times by hour, then minute, then second.
    ///
    /// A time that omits its seconds sorts before any time with the same hour
    /// and minute that does carry them, so that ordering stays total.
    ///
    /// - Parameters:
    ///   - lhs: The first time.
    ///   - rhs: The second time.
    /// - Returns: `true` if `lhs` is earlier than `rhs`.
    public static func < (lhs: ADITime, rhs: ADITime) -> Bool {
        (lhs.hour, lhs.minute, lhs.second ?? -1) < (rhs.hour, rhs.minute, rhs.second ?? -1)
    }
}