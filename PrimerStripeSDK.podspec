Pod::Spec.new do |spec|
  spec.name                   = "PrimerStripeSDK"
  spec.version                = "1.0.0"
  spec.swift_version          = "5.0"
  spec.summary                = "A wrapper around the Stripe SDK for Primer."
  spec.homepage               = "https://github.com/primer-io/primer-sdk-ios"
  spec.licence                = { :type => "MIT", :file => __dir__ = "/LICENSE" }
  spec.author                 = { 'Primer DX Team' => 'dx@primer.io' }
  spec.platform               = :ios, "13.0"
  spec.ios.deployment_target  = "13.0"
  spec.source                 = { :git => 'https://github.com/primer-io/primer-sdk-ios', :tag => spec.version.to_s }
  spec.vendored_frameworks    = 'PrimerStripeSDK.xcframework', 'StripeSDK.xcframework', 'StripeFinancialConnections.xcframework'
end