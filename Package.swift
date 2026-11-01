// swift-tools-version:5.9
// Binary-only release manifest for AttriloopSDK 0.3.0.
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
      url: "https://github.com/Attriloop/attriloop-ios-spm/releases/download/v0.3.0/AttriloopSDK.xcframework.zip",
      checksum: "14ac1a8641bd36359b029228d548c0864c486b81ed9a7f8351661f9be6c0b64d"
    )
  ]
)
