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
            .exact("15.14.0")
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
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-Pangle/releases/download/15.14.0/TPPangleAdapter-15.14.0.xcframework.zip",
            checksum: "7c958e57c639fdb82526e2da4ce21b659e1ca1bd53eea7a254429a1884dd13b2"
        ),
    ]
)
