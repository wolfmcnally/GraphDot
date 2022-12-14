// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "GraphDot",
    products: [
        .library(
            name: "GraphDot",
            targets: ["GraphDot"]),
    ],
    dependencies: [
        .package(url: "https://github.com/WolfMcNally/WolfBase.git", .upToNextMajor(from: "5.0.0")),
        .package(url: "https://github.com/WolfMcNally/Graph.git", .upToNextMajor(from: "0.1.0"))
    ],
    targets: [
        .target(
            name: "GraphDot",
            dependencies: ["Graph", "WolfBase"]),
        .testTarget(
            name: "GraphDotTests",
            dependencies: ["GraphDot"]),
    ]
)
