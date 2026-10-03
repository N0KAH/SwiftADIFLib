import Foundation

/// Conversions between the text of an ADI field and the Swift type modelling it.
///
/// ``ADIRecord`` is generated from the specification's field table, so the shape
/// of its properties follows the document rather than this file. The rules for
/// turning text into a date, a number, or a delimited list are fixed instead,
/// and live here.
///
/// - Note: The specification states a range for some numeric fields. Those ranges
///   are deliberately not enforced when reading, because real logs contain values
///   outside them and a parse that throws would discard an otherwise readable
///   record. The specification's ranges are a constraint on the values a logging
///   station produces, not on the values an importer must accept.
enum ADIRecordCoder {
    /// Parses the text of a field whose type the specification gives as `Date`.
    ///
    /// - Parameters:
    ///   - text: The field's data.
    ///   - field: The field's name, used to report where the value came from.
    /// - Returns: The parsed date.
    /// - Throws: ``ADIFError/invalidFieldValue(name:found:reason:)`` if `text` is
    ///   not a date of the form `YYYYMMDD`.
    static func date(_ text: String, field: String) throws -> ADIDate {
        guard let value = ADIDate(parsing: text) else {
            throw ADIFError.invalidFieldValue(
                name: field,
                found: text,
                reason: "expected a date of the form YYYYMMDD"
            )
        }

        return value
    }

    /// Parses the text of a field whose type the specification gives as `Time`.
    ///
    /// - Parameters:
    ///   - text: The field's data.
    ///   - field: The field's name, used to report where the value came from.
    /// - Returns: The parsed time.
    /// - Throws: ``ADIFError/invalidFieldValue(name:found:reason:)`` if `text` is
    ///   not a time of the form `HHMM` or `HHMMSS`.
    static func time(_ text: String, field: String) throws -> ADITime {
        guard let value = ADITime(parsing: text) else {
            throw ADIFError.invalidFieldValue(
                name: field,
                found: text,
                reason: "expected a time of the form HHMM or HHMMSS"
            )
        }

        return value
    }

    /// Parses the text of a field whose type the specification gives as `Number`.
    ///
    /// - Parameters:
    ///   - text: The field's data.
    ///   - field: The field's name, used to report where the value came from.
    /// - Returns: The parsed number.
    /// - Throws: ``ADIFError/invalidFieldValue(name:found:reason:)`` if `text` is
    ///   not a number.
    static func number(_ text: String, field: String) throws -> Double {
        guard let value = Double(text) else {
            throw ADIFError.invalidFieldValue(
                name: field,
                found: text,
                reason: "expected a number"
            )
        }

        return value
    }

    /// Parses the text of a field whose type the specification gives as
    /// `Integer` or `PositiveInteger`.
    ///
    /// - Parameters:
    ///   - text: The field's data.
    ///   - field: The field's name, used to report where the value came from.
    /// - Returns: The parsed integer.
    /// - Throws: ``ADIFError/invalidFieldValue(name:found:reason:)`` if `text` is
    ///   not an integer.
    static func integer(_ text: String, field: String) throws -> Int {
        guard let value = Int(text) else {
            throw ADIFError.invalidFieldValue(
                name: field,
                found: text,
                reason: "expected a whole number"
            )
        }

        return value
    }

    /// Parses the text of a field whose type the specification gives as `Boolean`.
    ///
    /// The specification writes a Boolean as `Y` or `N`, but loggers in the wild
    /// also spell the value out, so both are accepted.
    ///
    /// - Parameters:
    ///   - text: The field's data.
    ///   - field: The field's name, used to report where the value came from.
    /// - Returns: The parsed flag.
    /// - Throws: ``ADIFError/invalidFieldValue(name:found:reason:)`` if `text` is
    ///   not a recognized spelling of a Boolean.
    static func boolean(_ text: String, field: String) throws -> Bool {
        switch text.trimmingCharacters(in: .whitespaces).lowercased() {
        case "y", "yes", "true", "1":
            true
        case "n", "no", "false", "0":
            false
        default:
            throw ADIFError.invalidFieldValue(
                name: field,
                found: text,
                reason: "expected Y or N"
            )
        }
    }

    /// Splits the text of a field whose type the specification gives as a
    /// delimited list.
    ///
    /// - Parameter text: The field's data, in which elements are separated by
    ///   commas.
    /// - Returns: The elements, with surrounding whitespace removed. Empty text
    ///   yields an empty array.
    static func list(_ text: String) -> [String] {
        text
            .split(separator: ",")
            .map { $0.trimmingCharacters(in: .whitespaces) }
            .filter { !$0.isEmpty }
    }

    /// Parses the text of a field the specification defines as an enumeration.
    ///
    /// - Parameters:
    ///   - text: The field's data.
    ///   - type: The enumeration to parse into.
    /// - Returns: The matching value, or the enumeration's `unrecognized` case
    ///   carrying `text` when the specification does not define it.
    static func enumeration<T: ADIEnumeration>(_ text: String, as type: T.Type) -> T {
        T(rawValue: text)
    }

    /// Parses the text of a delimited list of enumerated values.
    ///
    /// - Parameters:
    ///   - text: The field's data, in which elements are separated by commas.
    ///   - type: The enumeration to parse each element into.
    /// - Returns: One value per element, preserving the order the file used.
    static func enumerationList<T: ADIEnumeration>(_ text: String, as type: T.Type) -> [T] {
        list(text).map { T(rawValue: $0) }
    }
}