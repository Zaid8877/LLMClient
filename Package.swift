// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LLMClient",
    platforms: [
        .iOS(.v14),     // Supports iPhone & iPad
        .macOS(.v11)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "LLMClient",
            targets: ["LLMClient"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "LLMClient"),
        .testTarget(
            name: "LLMClientTests",
            dependencies: ["LLMClient"]
        ),
    ]
)
