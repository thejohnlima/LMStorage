// swift-tools-version:5.1

import PackageDescription

let package = Package(
  name: "LMStorage",
  platforms: [
    .macOS(.v10_13),
    .iOS(.v9),
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
    .package(url: "https://github.com/evgenyneu/keychain-swift.git", from: "19.0.0")
  ],
  targets: [
    .target(
      name: "LMStorage",
      dependencies: ["KeychainSwift"]
    ),
    .testTarget(
      name: "LMStorageTests",
      dependencies: ["LMStorage"]
    )
  ]
)
