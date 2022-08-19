// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StyleFramework",
    defaultLocalization: "es",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "StyleFramework",
            targets: ["StyleFramework"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "StyleFramework",
            dependencies: [],
            path: "Sources",
            resources: [
                .process("Resources")
            ]
        )
    ]
)
