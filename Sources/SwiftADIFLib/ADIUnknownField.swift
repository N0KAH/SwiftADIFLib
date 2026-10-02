import Foundation

/// A field that this library does not model explicitly.
///
/// A file may legitimately contain fields this library has no property for:
/// fields added by a later release of the specification, application-defined
/// fields the header did not declare, or fields belonging to a non-standard
/// tool. Rather than discard them or reduce them to a bare string, the library
/// keeps each one in this type, which preserves the field's name, its declared
/// data type, and its data exactly.
///
/// The type is deliberately asymmetric: an ``ADIUnknownField`` comes into
/// existence only by reading content, so a caller cannot invent one when
/// generating a file. A generated header or record carries only the fields this
/// library models.
///
/// - Note: Reading accepts whatever the file contains. Writing is where the
///   restriction to ADI applies, so ``validatedForADI()`` is called when the
///   field is written: a field whose data type the specification reserves for
///   ADX files is rejected then, rather than at parse time.
public struct ADIUnknownField: Hashable, Sendable {
    /// The name the file used for the field.
    public var name: String

    /// The data type the file declared for the field's data, if any.
    public var typeIndicator: DataTypeIndicator?

    /// The field's data.
    public var data: String

    /// The number of characters this field's data occupies when written to an
    /// ADI file.
    public var length: Int {
        ADICalendar.characterCount(of: data)
    }

    /// Creates an unknown field.
    ///
    /// - Parameters:
    ///   - name: The name the file used for the field. It is normalized to
    ///     uppercase, matching the way the library treats every other field
    ///     name.
    ///   - typeIndicator: The data type declared for the field's data, if any.
    ///   - data: The field's data.
    /// - Throws: ``ADIFError/invalidFieldName(name:reason:)`` if `name` is not
    ///   usable as a field name.
    public init(name: String, typeIndicator: DataTypeIndicator? = nil, data: String) throws {
        self.init(try DataSpecifier(name: name, typeIndicator: typeIndicator, data: data))
    }

    /// Creates an unknown field from a data specifier read from a file.
    ///
    /// - Parameter specifier: The data specifier as it appeared in the file.
    public init(_ specifier: DataSpecifier) {
        name = specifier.name
        typeIndicator = specifier.typeIndicator
        data = specifier.data
    }

    /// The field rendered in ADI form, as `<NAME:LENGTH[:TYPE]>DATA`.
    ///
    /// - Note: This renders the field without checking that its data type may
    ///   appear in an ADI file. Use ``validatedForADI()`` when writing a whole
    ///   file.
    ///
    /// - Returns: The rendered field.
    /// - Throws: ``ADIFError/invalidFieldName(name:reason:)`` if the field's
    ///   name is not usable, which can only happen if it was assigned directly
    ///   rather than through an initializer.
    public func serialized() throws -> String {
        try dataSpecifier().serialized()
    }

    /// The field as a data specifier.
    ///
    /// - Returns: The equivalent ``DataSpecifier``.
    /// - Throws: ``ADIFError/invalidFieldName(name:reason:)`` if the field's
    ///   name is not usable.
    public func dataSpecifier() throws -> DataSpecifier {
        try DataSpecifier(name: name, typeIndicator: typeIndicator, data: data)
    }

    /// Converts the field to a data specifier, checking that it may appear in
    /// an ADI file.
    ///
    /// - Returns: The equivalent ``DataSpecifier``.
    /// - Throws: ``ADIFError/unsupportedDataType(dataType:reason:)`` if the
    ///   field's data type may only appear in an ADX file.
    public func validatedForADI() throws -> DataSpecifier {
        try dataSpecifier().validatedForADI()
    }
}