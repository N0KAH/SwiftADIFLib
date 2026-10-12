import Foundation
import SwiftADIFLib

func main() {
    let arguments = CommandLine.arguments
    guard arguments.count == 2 else {
        print("Usage: ADIFTool <path-to-adi-or-adif-file>")
        exit(1)
    }
    
    let filePath = arguments[1]
    let url = URL(fileURLWithPath: filePath)
    
    let pathExtension = url.pathExtension.lowercased()
    guard pathExtension == "adi" || pathExtension == "adif" else {
        print("Error: File must have .adi or .adif extension")
        exit(1)
    }
    
    do {
        let reader = try ADILogReader(contentsOf: url)
        
        print("Header:")
        print("  Text: \(reader.header.text)")
        if let version = reader.header.adifVersion {
            print("  ADIF Version: \(version.description)")
        }
        print()
        
        print("Records:")
        print("  Total: \(reader.records.count)")
        if !reader.problems.isEmpty {
            print("  Problems: \(reader.problems.count)")
        }
        print()
        
        for (index, record) in reader.records.enumerated() {
            print("  Record \(index + 1):")
            if let call = record.call {
                print("    CALL: \(call)")
            }
            if let qsoDate = record.qsoDate {
                print("    QSO_DATE: \(qsoDate.description)")
            }
            if let timeOn = record.timeOn {
                print("    TIME_ON: \(timeOn.description)")
            }
            if let band = record.band {
                print("    BAND: \(band.description)")
            }
            if let mode = record.mode {
                print("    MODE: \(mode.description)")
            }
            if let freq = record.freq {
                print("    FREQ: \(freq)")
            }
            if let rstSent = record.rstSent {
                print("    RST_SENT: \(rstSent)")
            }
            if let rstRcvd = record.rstRcvd {
                print("    RST_RCVD: \(rstRcvd)")
            }
            print()
        }
        
        if !reader.problems.isEmpty {
            print("Problems:")
            for (index, problem) in reader.problems.enumerated() {
                print("  \(index + 1). \(problem)")
            }
        }
    } catch {
        print("Error: \(error)")
        exit(1)
    }
}

main()
