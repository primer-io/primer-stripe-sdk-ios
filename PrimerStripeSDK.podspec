# Be sure to run `pod lib lint PrimerIPay88SDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |spec|
  spec.name                   = 'PrimerStripeSDK'
  spec.version                = '0.0.1'
  spec.swift_version          = '5.0'
  spec.summary                = 'A wrapper around the Stripe SDK for Primer.'
  spec.homepage               = 'https://github.com/primer-io/primer-stripe-sdk-ios'
  spec.license                = { :type => 'MIT', :file => __dir__ + '/LICENSE' }
  spec.author                 = { 'Primer DX Team' => 'dx@primer.io' }
  spec.platform               = :ios, '13.0'
  spec.ios.deployment_target  = '13.0'
  spec.source                 = { :git => 'https://github.com/primer-io/primer-sdk-ios', :tag => spec.version.to_s }
  spec.dependency             'Stripe'
  spec.dependency             'StripeFinancialConnections'
end
