import Foundation

/// Gregorian calendar arithmetic shared by the ADI date and time types.
///
/// The ADIF specification's `Date` data type constrains the year to
/// `1930 <= YYYY`, so every date in ADI is a Gregorian date in the proleptic
/// calendar and no calendar identity needs to travel with the value.
enum ADICalendar {
    /// Whether `year` is a leap year in the Gregorian calendar.
    ///
    /// - Parameter year: The year to test.
    /// - Returns: `true` if `year` is divisible by four, except that a year
    ///   divisible by one hundred is only a leap year when it is also
    ///   divisible by four hundred.
    static func isLeapYear(_ year: Int) -> Bool {
        (year % 4 == 0 && year % 100 != 0) || year % 400 == 0
    }

    /// The number of days in a month of a given year.
    ///
    /// - Parameters:
    ///   - month: The month, which is expected to be between `1` and `12`.
    ///   - year: The year, consulted only for February.
    /// - Returns: The number of days in the month, or `0` if `month` is out of
    ///   range.
    static func daysInMonth(_ month: Int, year: Int) -> Int {
        switch month {
        case 1, 3, 5, 7, 8, 10, 12:
            31
        case 4, 6, 9, 11:
            30
        case 2:
            isLeapYear(year) ? 29 : 28
        default:
            0
        }
    }

    /// Whether a year is one the ADIF `Date` data type permits.
    ///
    /// - Parameter year: The year to test.
    /// - Returns: `true` if the specification's `1930 <= YYYY` bound holds.
    static func isPermittedYear(_ year: Int) -> Bool {
        (1930...9999).contains(year)
    }

    /// Renders a number in the fixed-width, zero-padded form ADIF requires.
    ///
    /// - Parameters:
    ///   - value: The number to render. Callers are responsible for supplying a
    ///     value whose digit count does not exceed `width`.
    ///   - width: The number of digits to render.
    /// - Returns: The zero-padded rendering.
    static func padded(_ value: Int, width: Int) -> String {
        let digits = String(value)

        guard digits.count < width else {
            return digits
        }

        return String(repeating: "0", count: width - digits.count) + digits
    }

    /// Parses exactly `count` ASCII digits starting at `offset`.
    ///
    /// - Parameters:
    ///   - characters: The characters to read.
    ///   - offset: The index of the first digit.
    ///   - count: The number of digits to read.
    /// - Returns: The parsed value, or `nil` if any of the characters is not an
    ///   ASCII digit.
    static func digits(_ characters: [Character], at offset: Int, count: Int) -> Int? {
        guard offset >= 0, count > 0, offset + count <= characters.count else {
            return nil
        }

        var value = 0

        for index in offset..<(offset + count) {
            guard characters[index].isASCIIDigit else {
                return nil
            }

            value = value * 10 + characters[index].wholeNumberValue!
        }

        return value
    }

    /// Whether `text` is a non-empty run of ASCII digits.
    ///
    /// - Parameter text: The text to test.
    /// - Returns: `true` if `text` is neither empty nor contains anything other
    ///   than the ten ASCII digits.
    static func isAllASCIIDigits(_ text: some StringProtocol) -> Bool {
        !text.isEmpty && text.allSatisfy { $0.isASCIIDigit }
    }

    /// The number of characters in `text`, counting a Unicode scalar value as
    /// one character.
    ///
    /// - Note: This matches the way an ADI data length is defined. It is not the
    ///   same as `String.count`, which counts grapheme clusters, nor as
    ///   `String.utf8.count`, which counts bytes.
    ///
    /// - Parameter text: The text to measure.
    /// - Returns: The number of characters.
    static func characterCount(of text: String) -> Int {
        text.unicodeScalars.count
    }
}

extension Character {
    /// Whether the character is one of the ten ASCII digits.
    ///
    /// This deliberately excludes the many other Unicode characters for which
    /// `isNumber` is true, because ADIF numbers are radix-10 ASCII.
    var isASCIIDigit: Bool {
        isASCII && isNumber
    }
}