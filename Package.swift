// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "mustache",
    platforms: [
        .macOS(.v10_14),
    ],
    dependencies: [
        .package(url: "https://github.com/IBM-Swift/Kitura", .upToNextMajor(from: "2.9.0")),
        .package(url: "https://github.com/IBM-Swift/Kitura-Compression.git", .upToNextMajor(from: "2.2.2")),
        .package(url: "https://github.com/IBM-Swift/Kitura-StencilTemplateEngine.git", .upToNextMajor(from: "1.11.1")),
        .package(url: "https://github.com/IBM-Swift/Kitura-OpenAPI.git", .upToNextMajor(from: "1.3.0")),
        .package(url: "https://github.com/IBM-Swift/Swift-Kuery-ORM", .upToNextMajor(from: "0.6.1")),
        .package(url: "https://github.com/IBM-Swift/Swift-Kuery-PostgreSQL", .upToNextMajor(from: "2.1.1")),
        .package(url: "https://github.com/IBM-Swift/Kitura-CredentialsHTTP.git", .upToNextMajor(from: "2.1.3")),
        .package(url: "https://github.com/IBM-Swift/HeliumLogger.git", .upToNextMajor(from: "1.9.0")),
    ],
    targets: [
        .target(
            name: "mustache",
            dependencies: [
                "Kitura",
                "KituraStencil",
                "KituraCompression",
                "KituraOpenAPI",
                "CredentialsHTTP",
                "SwiftKueryORM",
                "SwiftKueryPostgreSQL",
                "HeliumLogger",
            ]
        ),
        .testTarget(
            name: "mustacheTests",
            dependencies: [
                "mustache",
            ]
        ),
    ]
)
