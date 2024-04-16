// swift-tools-version: 5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PrimerStripeSDK",
    products: [
        .library(
            name: "PrimerStripeSDK",
            targets: [
                "PrimerStripeSDKFramework",
                "StripeSDKFramework",
                "StripeFinancialConnectionsFramework"
            ]
        )
    ],
    targets: [
        .binaryTarget(
            name: "PrimerStripeSDKFramework",
            path: "./PrimerStripeSDK.xcframework"
        ),
        .binaryTarget(
            name: "StripeSDKFramework",
            path: "./StripeSDK.xcframework"
        ),
        .binaryTarget(
            name: "StripeFinancialConnectionsFramework",
            path: "./StripeFinancialConnections.xcframework"
        )
    ]
)