/// The version of the Amateur Data Interchange Format (ADIF) that a file
/// conforms to, or that a library targets.
///
/// ADIF versions are written as `X.Y.Z`, where `X` is an integer designating
/// the ADIF epoch, `Y` is an integer between 0 and 9 designating the major
/// version, and `Z` is an integer between 0 and 9 designating the minor
/// version.
///
/// - Note: The normative source is <https://adif.org/adif>, which always
///   redirects to the most current released specification.
public struct ADIFVersion: Hashable, Comparable, Sendable, CustomStringConvertible {
    /// The ADIF epoch, the major component of the version.
    public let epoch: Int

    /// The major version, between `0` and `9` inclusive.
    public let major: Int

    /// The minor version, between `0` and `9` inclusive.
    public let minor: Int

    /// The version of ADIF that this library implements.
    ///
    /// - Important: This is the single place in the library that pins an ADIF
    ///   version. When a new ADIF release appears, update this constant to
    ///   reflect it.
    ///
    ///   The components are known-good at authoring time, so this constant
    ///   bypasses ``init(epoch:major:minor:)``. A test asserts that the
    ///   validating initializer accepts them, so an out-of-range pin cannot
    ///   go unnoticed.
    public static let current = ADIFVersion(uncheckedEpoch: 3, major: 1, minor: 7)

    /// The version in its `X.Y.Z` representation.
    public var description: String { "\(epoch).\(major).\(minor)" }

    /// Creates an ADIF version from its three components.
    ///
    /// - Parameters:
    ///   - epoch: The ADIF epoch. Must be greater than zero.
    ///   - major: The major version. Must be between `0` and `9` inclusive.
    ///   - minor: The minor version. Must be between `0` and `9` inclusive.
    /// - Throws: ``ADIFError/invalidVersionComponent(name:value:)`` if any
    ///   component is out of range.
    public init(epoch: Int, major: Int, minor: Int) throws {
        try Self.validate(epoch, named: "epoch", range: 1...Int.max)
        try Self.validate(major, named: "major", range: 0...9)
        try Self.validate(minor, named: "minor", range: 0...9)

        self.epoch = epoch
        self.major = major
        self.minor = minor
    }

    /// Creates an ADIF version by parsing its `X.Y.Z` representation.
    ///
    /// Each component must consist of ASCII digits only, and the components
    /// must fall in the ranges the specification defines: the epoch is an
    /// integer greater than zero, and the major and minor versions are each
    /// between `0` and `9` inclusive.
    ///
    /// - Note: The specification does not say whether a component may carry
    ///   leading zeroes, so they are accepted and normalized away — `"03.01.7"`
    ///   parses to `3.1.7`. A sign, a non-ASCII digit, and surrounding
    ///   whitespace are all rejected.
    ///
    /// - Parameter version: The textual version, such as `"3.1.7"`.
    /// - Returns: The parsed version, or `nil` if `version` is not a valid
    ///   `X.Y.Z` representation.
    public init?(parsing version: some StringProtocol) {
        let parts = version.split(separator: ".", omittingEmptySubsequences: false)

        guard
            parts.count == 3,
            parts.allSatisfy({ !$0.isEmpty && $0.allSatisfy({ $0.isASCII && $0.isNumber }) }),
            let epoch = Int(parts[0]),
            let major = Int(parts[1]),
            let minor = Int(parts[2])
        else {
            return nil
        }

        guard
            epoch >= 1,
            (0...9).contains(major),
            (0...9).contains(minor)
        else {
            return nil
        }

        self.epoch = epoch
        self.major = major
        self.minor = minor
    }

    /// Creates an ADIF version from components known to be in range.
    private init(uncheckedEpoch epoch: Int, major: Int, minor: Int) {
        self.epoch = epoch
        self.major = major
        self.minor = minor
    }

    /// Compares two versions by epoch, then major, then minor.
    ///
    /// - Parameters:
    ///   - lhs: The first version.
    ///   - rhs: The second version.
    /// - Returns: `true` if `lhs` is older than `rhs`.
    public static func < (lhs: ADIFVersion, rhs: ADIFVersion) -> Bool {
        (lhs.epoch, lhs.major, lhs.minor) < (rhs.epoch, rhs.major, rhs.minor)
    }

    private static func validate(_ value: Int, named name: String, range: ClosedRange<Int>) throws {
        guard range.contains(value) else {
            throw ADIFError.invalidVersionComponent(name: name, value: value)
        }
    }
}
