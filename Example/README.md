# ADIFTool Example

A simple command-line tool that demonstrates reading ADI files with SwiftADIFLib.

## Usage

Build and run with Swift Package Manager:

```bash
cd Example
swift run ADIFTool <path-to-file.adi>
```

Or from the Example directory:

```bash
swift run ADIFTool ../TestFiles/potacat_export.adi
```

## Requirements

- The file must have a `.adi` or `.adif` extension
- File path is passed as a command-line argument

## Output

The tool prints:
- Header information (ADIF version, etc.)
- List of records with key fields (CALL, QSO_DATE, TIME_ON, BAND, MODE, FREQ, RST_SENT, RST_RCVD)
- Any parsing problems encountered
