//
//  PrimerStripeError.swift
//  PrimerStripeSDK
//
//  Created by Stefan Vrancianu on 22.04.2024.
//

import UIKit
import Stripe

// MARK: - PrimerStripeErrorProtocol
public protocol PrimerStripeErrorProtocol {
    var errorId: String { get }
    var userInfo: [String: String] { get }
    var diagnosticsId: String { get }
    var errorDescription: String { get }
    var exposedError: NSError? { get }
}

// MARK: - PrimerStripeError
public enum PrimerStripeError: PrimerStripeErrorProtocol {
    
    case stripeSdkError(error: NSError)
    case unknownSTPPaymentIntentStatusError
    
    // MARK: - errorId
    public var errorId: String {
        switch self {
        case .stripeSdkError:
            return "stripe-sdk-error"
        case .unknownSTPPaymentIntentStatusError:
            return "unknown-STPPaymentIntentStatus-error"
        }
    }
    
    // MARK: - userInfo
    public var userInfo: [String: String] {
        var tmpUserInfo: [String: String] = ["createdAt": Date().toString()]
        switch self {
        case .stripeSdkError(let error):
            let stripeErrorUserInfo = error.userInfo
            tmpUserInfo["userInfo"] = stripeErrorUserInfo.debugDescription
            tmpUserInfo["diagnosticsId"] = self.diagnosticsId
            
        case .unknownSTPPaymentIntentStatusError:
            tmpUserInfo["diagnosticsId"] = self.diagnosticsId
        }
        return tmpUserInfo
    }
    
    // MARK: - diagnosticsId
    public var diagnosticsId: String {
        UUID().uuidString
    }
    
    // MARK: - errorDescription
    public var errorDescription: String {
        switch self {
        case .stripeSdkError(let error):
            let unwrappedError = unwrapErrorDescription(error)
            return "[\(errorId)]: \(unwrappedError)"
            
        case .unknownSTPPaymentIntentStatusError:
            return "[\(errorId)]: Unknown STPPaymentIntentStatus (diagnosticsId: \(diagnosticsId)"
        }
    }
    
    // MARK: - exposedError
    public var exposedError: NSError? {
        switch self {
        case .stripeSdkError(let error):
            return error
            
        case .unknownSTPPaymentIntentStatusError:
            return nil
        }
    }
    
    // MARK: - Helper method
    
    // This method is unwrapping the description of the Stripe NSError object.
    // Since Stripe has nested userInfo in their thrown 'NSError' we have to look for specific error keys.
    // Otherwise we get very generic or not even close error descriptions.
    private func unwrapErrorDescription(_ error: NSError) -> String {
        if let underlyingError = error.userInfo[NSUnderlyingErrorKey] as? NSError {
            // Recursively unwrap the underlying error
            return unwrapErrorDescription(underlyingError)
        } else if let errorMessage = error.userInfo[STPError.hintKey] as? String {
            return errorMessage
        } else if let errorMessage = error.userInfo[STPError.errorMessageKey] as? String {
            return errorMessage
        } else {
            // If there's no underlying error, return the top-level error's description
            return error.description
        }
    }
}
