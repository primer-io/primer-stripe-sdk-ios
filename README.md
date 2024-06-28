# PrimerStripeSDK

[![Swift](https://img.shields.io/badge/Swift-5.4_5.5_5.6-orange?style=flat-square)](https://img.shields.io/badge/Swift-5.4_5.5_5.6-Orange?style=flat-square)
[![Platforms](https://img.shields.io/badge/Platforms-iOS-yellowgreen?style=flat-square)](https://img.shields.io/badge/Platforms-iOS-Green?style=flat-square)

![Primer](./Resources/logo.png)

## Description

PrimerStripeSDK is a wrapper of the Stripe iOS SDK that exposes functionality for Stripe-Backed Primer payment methods. It is intended to be used within the PrimerSDK as a seperate module. This repository provides the PrimerStripeSDK as a binary universal framework, which can be integrated manually, or via Cocoapods or Swift Package Manager.

## This repository consists of
- PrimerStripeSDK
- Depenedencies
  - Stripe (core dependencies: StripeCore, Stripe3DS2, StripeApplePay, StripePayments, StripePaymentsUI, StripeUICore)
  - StripeFinancialConnections

## Building locally
run `fastlane build_xcframeworks`
The built `PrimerStripeSDK.xcframework` can be found in the `build` folder, and is also copied to the `Frameworks` directory.

## Updating Dependencies
- Replace the following frameworkd in the `Frameworks` directory with the new versions. Stripe releases all sub dependencies with each new release, so it is important to replace all the dependencies.
  - `Stripe.xcframework`
  - `StripeCore.xcframework`
  - `Stripe3DS2.xcframework`
  - `StripeApplePay.xcframework`
  - `StripePayments.xcframework`
  - `StripePaymentsUI.xcframework`
  - `StripeUICore.xcframework`
  - `StripeFinancialConnections.xcframework`
- Run `fastlane build_xcframeworks`
