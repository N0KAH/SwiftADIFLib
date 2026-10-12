// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "ADIFTool",
    platforms: [
        .macOS(.v13)
    ],
    dependencies: [
        .package(path: "..")
    ],
    targets: [
        .executableTarget(
            name: "ADIFTool",
            dependencies: [
                .product(name: "SwiftADIFLib", package: "SwiftADIFLib")
            ],
            path: "Sources/ADIFTool"
        )
    ]
)
