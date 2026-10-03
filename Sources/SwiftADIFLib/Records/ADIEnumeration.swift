/// A value drawn from one of the ADIF specification's enumerations.
///
/// The specification defines its enumerations as sets of values matched without
/// regard to case, so conformers parse case insensitively and render
/// ``description`` in the canonical form the specification uses.
/// ``CustomStringConvertible/description`` therefore reproduces the value a log
/// file contains, which makes a parse and serialize round trip exact.
///
/// - Note: The specification adds enumeration values between releases. Conformers
///   therefore preserve any value they do not recognize instead of rejecting it,
///   so that a file written against a later revision of the specification survives
///   a round trip.
public protocol ADIEnumeration: Hashable, Sendable, CustomStringConvertible {
    /// Every value the specification defines for this enumeration, in
    /// specification order.
    ///
    /// - Note: Values a conformer preserves as unrecognized are not included,
    ///   because the specification does not define them.
    static var allMembers: [Self] { get }

    /// The values the specification marks as import-only.
    ///
    /// - Note: An import-only value conveys something read from a file rather
    ///   than something a logging station creates. This is empty for
    ///   enumerations that define no import-only values.
    static var importOnlyMembers: Set<String> { get }

    /// Creates a value from its textual form.
    ///
    /// - Parameter rawValue: The value, in any case.
    /// - Returns: The matching member, or ``ADIEnumeration/unrecognized(_:)`` when
    ///   `rawValue` names no value this enumeration defines.
    ///
    /// - Important: This initializer never fails. A value the specification has
    ///   not published yet becomes ``ADIEnumeration/unrecognized(_:)`` so that
    ///   reading and rewriting a file does not discard it. Use
    ///   ``isRecognized`` to reject such a value when a strict reading is
    ///   required.
    init(rawValue: some StringProtocol)
}

extension ADIEnumeration {
    /// Whether the specification defines this value.
    ///
    /// - Note: This answers `false` for a value preserved as unrecognized,
    ///   because the specification does not define it.
    public var isRecognized: Bool {
        Self.allMembers.contains(self)
    }

    /// Whether the specification marks this value as import-only.
    ///
    /// - Note: This compares the canonical ``description``, so it answers `false`
    ///   for a value the specification does not define.
    public var isImportOnly: Bool {
        Self.importOnlyMembers.contains(description)
    }
}