# SwiftADIFLib

A Swift package library for parsing, generating, and working with the Amateur Data Interchange Format (ADIF) as used by amateur radio logging software.

## Features

- Parse ADI-format log files with a lenient reader that reports problems without stopping
- Access parsed header metadata and individual QSO records
- Serialize records and headers back to ADI format
- Strongly-typed models for ADIF fields, data types, and enumerations
- Foundation-only, no external dependencies

## Usage

### Reading an ADI log file

```swift
import Foundation
import SwiftADIFLib

let url = URL(fileURLWithPath: "path/to/log.adi")
let reader = try ADILogReader(contentsOf: url)

print("ADIF Version:", reader.header.adifVersion?.rawValue ?? "unknown")
print("Records:", reader.records.count)

if !reader.problems.isEmpty {
    for problem in reader.problems {
        print("Problem:", problem)
    }
}
```

### Reading from data or string

```swift
let text = "<EOH>\n<CALL:5>W5ITR <QSO_DATE:8>20251008 <TIME_ON:4>1234 <BAND:3>40m <MODE:3>SSB <EOR>"
let reader = ADILogReader(parsing: text)
let record = reader.records.first
```

### Creating and serializing a record

```swift
var record = ADIRecord()
record.call = "N0KAH"
record.qsoDate = ADIDate(year: 2025, month: 10, day: 8)
record.timeOn = ADITime(hour: 12, minute: 34)
record.band = .band40m
record.mode = .ssb

let adi = try record.serialized() // "<CALL:5>N0KAH <QSO_DATE:8>20251008 <TIME_ON:4>1234 <BAND:3>40m <MODE:3>SSB <EOR>"
```

## Documentation

- [ADIF Specification](https://adif.org/adif) - The normative source for ADIF format rules
- API documentation is available via Swift's documentation comments in the source code
