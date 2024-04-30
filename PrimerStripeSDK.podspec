Pod::Spec.new do |spec|
  spec.name                   = "PrimerStripeSDK"
  spec.version                = "1.0.0"
  spec.swift_version          = "5.0"
  spec.summary                = "A wrapper around the Stripe SDK for Primer."
  spec.homepage               = "https://github.com/primer-io/primer-sdk-ios"
  spec.license                = { :type => "MIT", :file => __dir__ = "/LICENSE" }
  spec.author                 = { 'Primer DX Team' => 'dx@primer.io' }
  spec.platform               = :ios, "14.0"
  spec.ios.deployment_target  = "14.0"
  spec.source                 = { :git => 'https://github.com/primer-io/primer-sdk-ios', :tag => spec.version.to_s }
  spec.vendored_frameworks    = 'Frameworks/PrimerStripeSDK.xcframework', 'Frameworks/Stripe.xcframework', 'Frameworks/StripeFinancialConnections.xcframework'
end
