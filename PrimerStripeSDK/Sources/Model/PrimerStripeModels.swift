//
//  PrimerStripeModels.swift
//  PrimerStripeSDK
//
//  Created by Stefan Vrancianu on 22.04.2024.
//

import Foundation

// MARK: - PrimerStripeParams
public struct PrimerStripeParams {
    public var publishableKey: String
    public var clientSecret: String
    public var returnUrl: String
    public var fullName: String
    public var emailAddress: String
    
    public init(publishableKey: String, clientSecret: String, returnUrl: String, fullName: String, emailAddress: String) {
        self.publishableKey = publishableKey
        self.clientSecret = clientSecret
        self.returnUrl = returnUrl
        self.fullName = fullName
        self.emailAddress = emailAddress
    }
}

// MARK: - PrimerStripeStatus
public enum PrimerStripeStatus {
    case succeeded(paymentMethodId: String)
    case failed(error: PrimerStripeError)
    case canceled
}
