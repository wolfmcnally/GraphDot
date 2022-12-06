// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "GraphDot",
    platforms: [.macOS(.v13), .iOS(.v15)],
    products: [
        .library(
            name: "GraphDot",
            targets: ["GraphDot"]),
    ],
    dependencies: [
        .package(url: "https://github.com/WolfMcNally/WolfBase.git", .upToNextMajor(from: "4.0.0")),
        .package(url: "https://github.com/WolfMcNally/Graph.git", branch: "master")
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
