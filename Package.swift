// swift-tools-version:6.0
// Project: neumorphism-for-swiftui
// License: MIT
// Deployment Target: iOS 18+, macOS 15+

// Package.swift
import PackageDescription

let package = Package(
    name: "neumorphism-for-swiftui",
    platforms: [
        .iOS(.v18),
        .macOS(.v15),
        .tvOS(.v18),
        .watchOS(.v11)
    ],
    products: [
        .library(
            name: "SoftUIKit",
            type: .static,
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
    ],
    swiftLanguageModes: [.v5]
)
