// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "GraphDot",
    products: [
        .library(
            name: "GraphDot",
            targets: ["GraphDot"]),
    ],
    dependencies: [
        .package(url: "https://github.com/WolfMcNally/WolfBase.git", .upToNextMajor(from: "6.0.0")),
        .package(url: "https://github.com/WolfMcNally/Graph.git", .upToNextMajor(from: "1.0.0"))
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
