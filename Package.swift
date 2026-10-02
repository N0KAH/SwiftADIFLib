// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "SwiftADIFLib",
    platforms: [
        .macOS(.v13),
        .iOS(.v16),
        .tvOS(.v16),
        .watchOS(.v9),
    ],
    products: [
        .library(
            name: "SwiftADIFLib",
            targets: ["SwiftADIFLib"]
        ),
    ],
    targets: [
        .target(
            name: "SwiftADIFLib",
            swiftSettings: [
                .enableUpcomingFeature("ApproachableConcurrency"),
            ]
        ),
        .testTarget(
            name: "SwiftADIFLibTests",
            dependencies: ["SwiftADIFLib"],
            swiftSettings: [
                .enableUpcomingFeature("ApproachableConcurrency"),
            ]
        ),
    ]
)
