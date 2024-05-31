//
//  PrimerStripeCollectorViewController.swift
//  PrimerStripeSDK
//
//  Created by Stefan Vrancianu on 22.04.2024.
//

import UIKit
import Stripe

public protocol PrimerStripeCollectorViewControllerDelegate: AnyObject {
    func primerStripeCollected(_ stripeStatus: PrimerStripeStatus)
}

public class PrimerStripeCollectorViewController: UIViewController {
    
    // MARK: - Delegate
    private weak var delegate: PrimerStripeCollectorViewControllerDelegate?
    
    // MARK: - Properties
    private let bankAccountCollector = STPBankAccountCollector()
    private var params: PrimerStripeParams
    
    // MARK: - Init
    init(params: PrimerStripeParams) {
        self.params = params
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Class function
    public static func getCollectorViewController(params: PrimerStripeParams, delegate: PrimerStripeCollectorViewControllerDelegate) -> PrimerStripeCollectorViewController {
        let viewController = PrimerStripeCollectorViewController(params: params)
        viewController.delegate = delegate
        viewController.view.backgroundColor = .white
        viewController.modalPresentationStyle = .fullScreen
        return viewController
    }
    
    // MARK: - viewDidLoad()
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        initilizeStripeSDK()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        showCollector()
    }
    
    // MARK: - Show the STPBankAccountCollector
    private func showCollector() {
        // Build params
        let collectParams = STPCollectBankAccountParams.collectUSBankAccountParams(with: params.fullName, email: params.emailAddress)
        
        // Calling this method will display a modal for collecting bank account information
        bankAccountCollector.collectBankAccountForPayment(clientSecret: params.clientSecret,
                                                          returnURL: params.returnUrl,
                                                          params: collectParams,
                                                          from: self) { intent, error in
            guard let intent = intent else {
                // Here we catch the error, and call delegation method with failed status
                if let error {
                    let stripeError = PrimerStripeError.stripeSdkError(error: error)
                    self.delegate?.primerStripeCollected(PrimerStripeStatus.failed(error: stripeError))
                }
                return
            }
            
            switch intent.status {
            case .requiresConfirmation:
                // Here we check again for payment method
                // If is nil, we call delegation method with canceled status
                // If not, we proceed with success status
                guard let paymentMethod = intent.paymentMethod,
                      let paymentMethodId = intent.paymentMethodId else {
                    self.delegate?.primerStripeCollected(PrimerStripeStatus.canceled)
                    return
                }
                
                self.delegate?.primerStripeCollected(PrimerStripeStatus.succeeded(paymentMethodId: paymentMethodId))
            case.requiresPaymentMethod:
                // Call delegation method with canceled status
                self.delegate?.primerStripeCollected(PrimerStripeStatus.canceled)
            default:
                break
            }
        }
    }
}

// MARK: - Helpers
extension PrimerStripeCollectorViewController {
    private func initilizeStripeSDK() {
        StripeAPI.defaultPublishableKey = params.publishableKey
    }
}
