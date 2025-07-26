// Project: neumorphism-for-swiftui
// License: MIT
// Deployment Target: iOS 18

// Package.swift

targets:
// - SoftUIKit (library)
// - SoftUIKitTests (tests)

import PackageDescription

let package = Package(
    name: "neumorphism-for-swiftui",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v18)
    ],
    products: [
        .library(
            name: "SoftUIKit",
            targets: ["SoftUIKit"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SoftUIKit",
            path: "Sources/SoftUIKit"
        ),
        .testTarget(
            name: "SoftUIKitTests",
            dependencies: ["SoftUIKit"],
            path: "Tests/SoftUIKitTests"
        )
    ]
)
