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
    dependencies: [
        .package(url: "https://github.com/airbnb/lottie-ios.git", from: "3.4.2"),
        .package(url: "https://github.com/dotlottie/dotlottie-ios.git", from: "0.1.9")
    ],
    targets: [
        .target(
            name: "ResourcesFramework",
            dependencies: [
                .product(name: "Lottie", package: "lottie-ios"),
                .product(name: "dotLottie", package: "dotlottie-ios")
            ],
            path: "Sources",
            resources: [
                .process("Resources")
            ]
        )
    ]
)
