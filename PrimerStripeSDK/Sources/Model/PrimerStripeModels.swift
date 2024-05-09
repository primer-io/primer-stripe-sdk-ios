//
//  PrimerStripeModels.swift
//  PrimerStripeSDK
//
//  Created by Stefan Vrancianu on 22.04.2024.
//

import Foundation

// MARK: - PrimerStripeParams
public struct PrimerStripeParams {
    var publishableKey: String
    var clientSecret: String
    var returnUrl: String
    var fullName: String
    var emailAddress: String
}

// MARK: - PrimerStripeStatus
public enum PrimerStripeStatus {
    case succeeded(paymentMethodId: String)
    case failed(error: PrimerStripeError)
    case canceled
}
