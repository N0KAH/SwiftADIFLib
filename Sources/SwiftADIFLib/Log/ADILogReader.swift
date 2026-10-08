import Foundation

public struct ADILogReader {
    public let header: ADIHeader
    public let records: [ADIRecord]
    public let problems: [ADILogProblem]

    public init(contentsOf url: URL) throws {
        let data = try Data(contentsOf: url)
        try self.init(data: data)
    }

    public init(data: Data) throws {
        if let string = String(data: data, encoding: .utf8) {
            self.init(parsing: string)
        } else {
            self.init(parsing: String(decoding: data, as: UTF8.self))
        }
    }

    public init(parsing text: String) {
        let bytes = Array(text.utf8)

        var header = ADIHeader()
        var problems: [ADILogProblem] = []
        var records: [ADIRecord] = []

        var rs = ADITagScanner(text)
        _ = rs.consumeLeadingText()

        while !rs.isAtEnd {
            do {
                guard let tag = try rs.scanTag() else { break }
                if case .endOfHeader = tag {
                    break
                }
            } catch {
                break
            }
        }

        var attempt = 0
        while !rs.isAtEnd {
            let start = rs.position
            let lineStart = lineNumber(at: start, bytes: bytes)
            var temp = rs
            var foundEOR = false
            while !temp.isAtEnd {
                do {
                    guard let tag = try temp.scanTag() else { break }
                    if case .endOfRecord = tag {
                        foundEOR = true
                        break
                    }
                } catch {
                    break
                }
            }
            let end = foundEOR ? temp.position : bytes.count
            if start >= end {
                break
            }
            let slice = substring(from: start, to: end, text: text)
            do {
                let record = try ADIRecord(parsing: slice)
                records.append(record)
                rs = temp
            } catch let error as ADIFError {
                let raw = substring(from: start, to: min(start + 4096, bytes.count), text: text)
                problems.append(
                    ADILogProblem(
                        byteOffset: start,
                        line: lineStart,
                        recordIndex: attempt,
                        error: error,
                        rawText: raw
                    )
                )
                if foundEOR {
                    rs = temp
                } else {
                    rs.skipToEndOfRecord()
                }
            } catch {
                if foundEOR {
                    rs = temp
                } else {
                    rs.skipToEndOfRecord()
                }
            }
            attempt += 1
        }

        // Parse header from original text
        do {
            header = try ADIHeader(parsing: text)
        } catch {
            header = ADIHeader()
        }

        self.header = header
        self.records = records
        self.problems = problems
    }

    public func validate() throws {
        if let first = problems.first {
            throw first
        }
    }
}

func lineNumber(at offset: Int, bytes: [UInt8]) -> Int {
    let limit = min(max(offset, 0), bytes.count)
    var count = 1
    var i = 0
    while i < limit {
        if bytes[i] == UInt8(ascii: "\n") {
            count += 1
        }
        i += 1
    }
    return count
}

func substring(from start: Int, to end: Int, text: String) -> String {
    let utf8 = Array(text.utf8)
    let s = max(0, min(start, utf8.count))
    let e = max(s, min(end, utf8.count))
    let slice = utf8[s..<e]
    return String(decoding: Array(slice), as: UTF8.self)
}
