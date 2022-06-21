// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "WolfGraphDot",
    platforms: [.macOS(.v12), .iOS(.v15)],
    products: [
        .library(
            name: "WolfGraphDot",
            targets: ["WolfGraphDot"]),
    ],
    dependencies: [
        .package(url: "https://github.com/wolfmcnally/WolfBase.git", .upToNextMajor(from: "4.0.0")),
        .package(path: "../WolfGraph")
    ],
    targets: [
        .target(
            name: "WolfGraphDot",
            dependencies: ["WolfGraph", "WolfBase"]),
        .testTarget(
            name: "WolfGraphDotTests",
            dependencies: ["WolfGraphDot"]),
    ]
)
