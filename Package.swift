// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "cycling-web",
    dependencies: [
        .package(url: "https://github.com/IBM-Swift/Kitura", from: "2.8.0"),
        .package(url: "https://github.com/IBM-Swift/Kitura-Compression.git", from: "2.2.2"),
        .package(url: "https://github.com/IBM-Swift/Kitura-StencilTemplateEngine.git", from: "1.11.1"),
    ],
    targets: [
        .target(
            name: "cycling-web",
            dependencies: ["Kitura", "KituraStencil", "KituraCompression"]),
        .testTarget(
            name: "cycling-webTests",
            dependencies: ["cycling-web"]),
    ]
)