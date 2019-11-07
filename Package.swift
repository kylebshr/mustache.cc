// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "mustache",
    dependencies: [
        .package(url: "https://github.com/IBM-Swift/Kitura", from: "2.8.0"),
        .package(url: "https://github.com/IBM-Swift/Kitura-Compression.git", from: "2.2.2"),
        .package(url: "https://github.com/IBM-Swift/Kitura-StencilTemplateEngine.git", from: "1.11.1"),
        .package(url: "https://github.com/IBM-Swift/Kitura-OpenAPI.git", from: "1.3.0"),
        .package(url: "https://github.com/IBM-Swift/Swift-Kuery-ORM", from: "0.6.0"),
        .package(url: "https://github.com/IBM-Swift/Swift-Kuery-PostgreSQL", from: "2.1.1"),
        .package(url: "https://github.com/IBM-Swift/Kitura-CredentialsHTTP.git", from: "2.1.3"),
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
