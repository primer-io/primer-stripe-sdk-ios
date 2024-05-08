// swift-tools-version: 5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PrimerStripeSDK",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "PrimerStripeSDK",
            targets: [
                "PrimerStripeSDKFramework"
            ]
        )
    ],
    targets: [
       .binaryTarget(
            name: "PrimerStripeSDKFramework",
            path: "./PrimerStripeSDK.xcframework"
        )
    ],
    swiftLanguageVersions: [.v5]
)
