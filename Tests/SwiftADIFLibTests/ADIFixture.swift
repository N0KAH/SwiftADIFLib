import Foundation

/// Locates a fixture in the repository's `TestFiles/` directory.
///
/// `TestFiles/` sits at the repository root rather than inside the test target,
/// so SwiftPM does not copy it into a resource bundle and `Bundle.module` is
/// unavailable. Resolving upward from this file's own `#filePath` is the
/// reliable way to reach it from any suite.
enum ADIFixture {
    /// The repository's `TestFiles/` directory.
    static let directory: URL = {
        // Tests/ -> SwiftADIFLib/ -> repository root.
        URL(fileURLWithPath: #filePath)
            .deletingLastPathComponent()
            .deletingLastPathComponent()
            .deletingLastPathComponent()
            .appendingPathComponent("TestFiles")
    }()

    /// Returns the URL of a fixture.
    ///
    /// - Parameter name: The fixture's file name, including its extension, such
    ///   as `"FromRumlog.adi"`.
    /// - Returns: The fixture's URL, whether or not the file exists, so a test
    ///   can report a missing fixture as a failed expectation.
    static func url(named name: String) -> URL {
        directory.appendingPathComponent(name)
    }

    /// Reads a fixture as text.
    ///
    /// - Parameter name: The fixture's file name, including its extension.
    /// - Returns: The fixture's contents.
    /// - Throws: Any error raised while reading the file.
    static func text(named name: String) throws -> String {
        try String(contentsOf: url(named: name), encoding: .utf8)
    }
}
