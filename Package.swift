// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NovaCore",
    products: [
        .library(name: "NovaCore", targets: ["NovaCore"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "NovaCore", dependencies: [])
    ]
)
