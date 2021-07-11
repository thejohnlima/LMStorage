// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "LMStorage",
  platforms: [
    .macOS(.v10_13),
    .iOS(.v12),
    .watchOS(.v3),
    .tvOS(.v9)
  ],
  products: [
    .library(
      name: "LMStorage",
      targets: ["LMStorage"]
    )
  ],
  dependencies: [
    .package(name: "KeychainSwift", url: "https://github.com/evgenyneu/keychain-swift.git", from: "19.0.0")
  ],
  targets: [
    .target(
      name: "LMStorage",
      dependencies: [
        "KeychainSwift"
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
