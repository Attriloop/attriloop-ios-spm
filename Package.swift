// swift-tools-version:5.9
// Release manifest draft for the separate binary-only SwiftPM repository.
// Keep this source repository private. Copy to the distribution repository's
// Package.swift after verifying the exact signed ZIP and checksum.
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
