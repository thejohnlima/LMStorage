// swift-tools-version:5.7

import PackageDescription

let package = Package(
  name: "LMStorage",
  platforms: [
    .macOS(.v10_13),
    .iOS(.v12),
    .watchOS(.v4),
    .tvOS(.v11)
  ],
  products: [
    .library(name: "LMStorage", targets: ["LMStorage"])
  ],
  dependencies: [
    .package(url: "https://github.com/evgenyneu/keychain-swift.git", from: "20.0.0")
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
