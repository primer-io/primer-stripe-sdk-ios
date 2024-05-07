// swift-tools-version: 5.3
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
                "PrimerStripeSDK"
            ]
        )
    ],
//    dependencies: [
//        .package(url: "https://github.com/stripe/stripe-ios-spm", from: "23.27.2")
//    ],
    targets: [
       .target(
            name: "PrimerStripeSDK",
            path: "PrimerStripeSDK/Sources"
        )
    ],
    swiftLanguageVersions: [.v5]
)
