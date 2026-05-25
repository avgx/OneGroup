// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "OneGroup",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v15),
        .macOS(.v13),
        .tvOS(.v17),
        .visionOS(.v1),
    ],
    products: [
        .library(
            name: "OneGroup",
            targets: ["OneGroup"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/avgx/RequestResponse", from: "2.0.1"),
        .package(url: "https://github.com/avgx/OneWireFormat", from: "1.0.0"),
        .package(url: "https://github.com/avgx/EncodeDecode", from: "1.0.5"),
    ],
    targets: [
        .target(
            name: "OneGroup",
            dependencies: [
                .product(name: "RequestResponse", package: "RequestResponse"),
                .product(name: "OneWireFormat", package: "OneWireFormat"),
            ]
        ),
        .testTarget(
            name: "OneGroupTests",
            dependencies: [
                "OneGroup",
                .product(name: "EncodeDecode", package: "EncodeDecode"),
            ],
            resources: [
                .process("Resources"),
            ]
        ),
    ]
)
