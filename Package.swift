// swift-tools-version:5.9
// Binary-only release manifest for AttriloopSDK 0.2.1.
// The signed ZIP at the release URL must match this checksum exactly.
import PackageDescription

let package = Package(
  name: "AttriloopSDK",
  platforms: [.iOS(.v13), .macOS(.v10_15)],
  products: [
    .library(name: "AttriloopSDK", targets: ["AttriloopSDK"])
  ],
  targets: [
    .binaryTarget(
      name: "AttriloopSDK",
      url: "https://github.com/Attriloop/attriloop-ios-spm/releases/download/v0.2.1/AttriloopSDK.xcframework.zip",
      checksum: "1b6622de8470f5a1530df461a517b06738a4e161a1b7022a6cc33e877012beec"
    )
  ]
)
