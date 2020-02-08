Pod::Spec.new do |s|
  s.name               = "LMStorage"
  s.version            = "1.0.0"
  s.summary            = "💾 LMStorage is a framework which reduces the complexity of managing a persistent layer."
  s.requires_arc       = true
  s.homepage           = "https://github.com/thejohnlima/LMStorage"
  s.license            = "MIT"
  s.author             = { "John Lima" => "thejohnlima@icloud.com" }
  s.social_media_url   = "https://twitter.com/thejohnlima"
  s.platform           = :ios, "9.0"
  s.source             = { :git => "https://github.com/thejohnlima/LMStorage.git", :tag => "#{s.version}" }
  s.source_files       = "Sources/LMStorage/**/*.{swift}"
  s.swift_version      = "5.0"
  s.dependency 'KeychainSwift'
end
