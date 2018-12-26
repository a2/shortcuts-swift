// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ShortcutsSwift",
    products: [
        .library(
            name: "ShortcutsSwift",
            targets: ["ShortcutsSwift"]),
    ],
    targets: [
        .target(
            name: "ShortcutsSwift",
            path:  "ShortcutsSwift.playgroundbook/Contents/Sources/",
            exclude: ["UI"]),
        .testTarget(
            name: "shortcutsSwiftTests",
            dependencies: ["ShortcutsSwift"],
            path: "Tests")
    ]
)
