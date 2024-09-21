// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "GraphDot",
    products: [
        .library(
            name: "GraphDot",
            targets: ["GraphDot"]),
    ],
    dependencies: [
        .package(url: "https://github.com/WolfMcNally/Graph.git", .upToNextMajor(from: "2.0.0"))
    ],
    targets: [
        .target(
            name: "GraphDot",
            dependencies: ["Graph"]),
        .testTarget(
            name: "GraphDotTests",
            dependencies: ["GraphDot"]),
    ]
)
