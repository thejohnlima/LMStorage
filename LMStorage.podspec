Pod::Spec.new do |s|
  s.name = "LMStorage"
  s.version = "1.0.7"
  s.summary = "💾 LMStorage is a framework which reduces the complexity of managing a persistent layer."
  s.requires_arc = true
  s.homepage = "https://github.com/thejohnlima/LMStorage"
  s.license = "MIT"
  s.author = { "John Lima" => "thejohnlima@icloud.com" }
  s.social_media_url = "https://twitter.com/thejohnlima"
  s.ios.deployment_target = "12.1"
  s.tvos.deployment_target = "9.0"
  s.watchos.deployment_target = "4.0"
  s.source = { :git => "https://github.com/thejohnlima/LMStorage.git", :tag => "#{s.version}" }
  s.source_files = "Sources/LMStorage/**/*.{swift}"
  s.resource_bundles = {'LMStorage_Privacy' => 'Sources/LMStorage/PrivacyInfo.xcprivacy'}
  s.swift_version = "5.0"
  s.dependency 'KeychainSwift'
end
