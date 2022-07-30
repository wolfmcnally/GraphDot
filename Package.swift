// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "GraphDot",
    platforms: [.macOS(.v12), .iOS(.v15)],
    products: [
        .library(
            name: "GraphDot",
            targets: ["GraphDot"]),
    ],
    dependencies: [
        .package(url: "https://github.com/wolfmcnally/WolfBase.git", .upToNextMajor(from: "4.0.0")),
        .package(path: "https://github.com/FlyingLogic/Graph.git")
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
