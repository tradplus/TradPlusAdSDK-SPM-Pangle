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
            .exact("15.13.0")
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
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-Pangle/releases/download/15.13.0/TPPangleAdapter-15.13.0.xcframework.zip",
            checksum: "406bee54e7553a936bd478b9ae9680d0a33b3999343c88fb59d33652afeb4fc7"
        ),
    ]
)
