public struct ADILogProblem: Hashable, Sendable, CustomStringConvertible, Error {
    /// The byte offset in the log text at which this problem was detected.
    public let byteOffset: Int

    /// The line number (1-based, counting LF) where this problem occurred.
    ///
    /// - Note: If the input uses CRLF, carriage returns are not counted
    ///   separately; the line number reflects LF-separated lines. Treat this
    ///   as an approximation when the source uses unusual line endings.
    public let line: Int

    /// The index of the QSO record attempt that produced this problem, or
    /// `nil` if the problem occurred while parsing the header.
    ///
    /// This is a 0-based attempt index for records, not a count of valid
    /// records. If an error occurs during a record, no record is produced
    /// and scanning resumes at the next `<EOR>`.
    public let recordIndex: Int?

    /// The underlying parse error.
    public let error: ADIFError

    /// The raw text from which this record was being parsed, or the slice
    /// in which the problem was encountered.
    ///
    /// The reader keeps the offending text so that no information is lost
    /// for logging or repair.
    public let rawText: String

    public init(
        byteOffset: Int,
        line: Int,
        recordIndex: Int?,
        error: ADIFError,
        rawText: String
    ) {
        self.byteOffset = byteOffset
        self.line = line
        self.recordIndex = recordIndex
        self.error = error
        self.rawText = rawText
    }

    public var description: String {
        let recordPart: String
        if let recordIndex {
            recordPart = "record #\(recordIndex)"
        } else {
            recordPart = "header"
        }

        return "At byte \(byteOffset), line \(line) in \(recordPart): \(error)"
    }
}
