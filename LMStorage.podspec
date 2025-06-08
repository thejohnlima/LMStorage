Pod::Spec.new do |s|
  s.name = "LMStorage"
  s.version = "1.0.8"
  s.summary = "💾 LMStorage is a lightweight Swift framework that simplifies persistent storage and leverages the power of Codable for seamless data serialization and deserialization. It reduces boilerplate and streamlines the management of your app’s data layer."
  s.requires_arc = true
  s.homepage = "https://github.com/thejohnlima/LMStorage"
  s.license = "MIT"
  s.author = { "John Lima" => "thejohnlima@icloud.com" }
  s.social_media_url = "https://x.com/thejohnlima"
  s.ios.deployment_target = "15.0"
  s.tvos.deployment_target = "15.0"
  s.watchos.deployment_target = "8.0"
  s.source = { :git => "https://github.com/thejohnlima/LMStorage.git", :tag => "#{s.version}" }
  s.source_files = "Sources/LMStorage/**/*.{swift}"
  s.resource_bundles = {'LMStorage_Privacy' => 'Sources/LMStorage/PrivacyInfo.xcprivacy'}
  s.swift_version = "5.0"
  s.dependency 'KeychainSwift'
end
