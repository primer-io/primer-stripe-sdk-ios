# PrimerStripeSDK

[![Swift](https://img.shields.io/badge/Swift-5.4_5.5_5.6-orange?style=flat-square)](https://img.shields.io/badge/Swift-5.4_5.5_5.6-Orange?style=flat-square)
[![Platforms](https://img.shields.io/badge/Platforms-iOS-yellowgreen?style=flat-square)](https://img.shields.io/badge/Platforms-iOS-Green?style=flat-square)

![Primer](./Resources/logo.png)

## Description

PrimerStripeSDK is a wrapper of the Stripe iOS SDK that exposes functionality for STripe-Backed Primer payment methods. It is intended to be used within the PrimerSDK as a seperate module. This repository provides the PrimerStripeSDK as a binary universal framework, which can be integrated manually, or via Cocoapods or Swift Package Manager.

## This repository consists of
- PrimerStripeSDK
- Depenedencies
  - Stripe
  - StripeFinancialConnections

## Building locally
run `fastlane build_xcframeworks`
Built frameworks can be found in the `build` folder.

## Updating Dependencies
- Replace `StripeSDK.xcframework` and `StripeFinancialConnections.xcframework` in the `Frameworks` directory with the new versions.
- Run `fastlane build_xcframeworks`