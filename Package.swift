// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ResourcesFramework",
    defaultLocalization: "es",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "ResourcesFramework",
            targets: ["ResourcesFramework"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ResourcesFramework",
            dependencies: [],
            path: "Sources",
            resources: [
                .process("Resources")
            ]
        )
    ]
)
