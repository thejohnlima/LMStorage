// swift-tools-version:5.10.0

import PackageDescription

let package = Package(
  name: "LMStorage",
  platforms: [
    .macOS(.v11),
    .iOS(.v15),
    .watchOS(.v8),
    .tvOS(.v15)
  ],
  products: [
    .library(name: "LMStorage", targets: ["LMStorage"])
  ],
  dependencies: [
    .package(url: "https://github.com/evgenyneu/keychain-swift.git", from: "24.0.0")
  ],
  targets: [
    .target(
      name: "LMStorage",
      dependencies: [
        .product(name: "KeychainSwift", package: "keychain-swift")
      ],
      resources: [
        .copy("PrivacyInfo.xcprivacy")
      ]
    ),
    .testTarget(
      name: "LMStorageTests",
      dependencies: ["LMStorage"],
      resources: [
        .process("Resources")
      ]
    )
  ]
)
