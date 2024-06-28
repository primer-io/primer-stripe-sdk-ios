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
                "PrimerStripeSDKFramework",
                "StripeFramework",
                "Stripe3DS2Framework",
                "StripeApplePayFramework",
                "StripeCoreFramework",
                "StripePaymentsFramework",
                "StripePaymentsUIFramework",
                "StripeUICoreFramework",
                "StripeFinancialConnectionsFramework"
            ]
        )
    ],
    targets: [
       .binaryTarget(
            name: "PrimerStripeSDKFramework",
            path: "Frameworks/PrimerStripeSDK.xcframework"
        ),
        .binaryTarget(
            name: "StripeFramework",
            path: "Frameworks/Stripe.xcframework"
        ),
        .binaryTarget(
            name: "Stripe3DS2Framework",
            path: "Frameworks/Stripe3DS2.xcframework"
        ),
        .binaryTarget(
            name: "StripeApplePayFramework",
            path: "Frameworks/StripeApplePay.xcframework"
        ),
        .binaryTarget(
            name: "StripeCoreFramework",
            path: "Frameworks/StripeCore.xcframework"
        ),
        .binaryTarget(
            name: "StripePaymentsFramework",
            path: "Frameworks/StripePayments.xcframework"
        ),
        .binaryTarget(
            name: "StripePaymentsUIFramework",
            path: "Frameworks/StripePaymentsUI.xcframework"
        ),
        .binaryTarget(
            name: "StripeUICoreFramework",
            path: "Frameworks/StripeUICore.xcframework"
        ),
        .binaryTarget(
            name: "StripeFinancialConnectionsFramework",
            path: "Frameworks/StripeFinancialConnections.xcframework"
        )
    ],
    swiftLanguageVersions: [.v5]
)
