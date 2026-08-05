// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "TradPlusPangleAdapter",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        .library(
            name: "TradPlusPangleAdapter",
            targets: ["TradPlusPangleAdapter"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM.git",
            .exact("15.12.0")
        ),
        .package(
            url: "https://github.com/bytedance/AdsGlobalPackage.git",
            .exact("8.1.1-release.1")
        ),
    ],
    targets: [
        .target(
            name: "TradPlusPangleAdapter",
            dependencies: [
                .target(name: "TPPangleAdapter"),
                .product(name: "TradPlusAdSDK", package: "TradPlusAdSDK-SPM"),
                .product(name: "AdsGlobalPackage", package: "AdsGlobalPackage"),
            ],
            path: ".",
            sources: ["Sources/TradPlusPangleAdapter/TradPlusPangleAdapter.swift"]
        ),
        .binaryTarget(
            name: "TPPangleAdapter",
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-Pangle/releases/download/15.12.0/TPPangleAdapter-15.12.0.xcframework.zip",
            checksum: "acd6448dee67a56d52fc8dc6e8112412aabcd851d17d5758641ad1475adef112"
        ),
    ]
)
