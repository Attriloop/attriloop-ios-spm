// swift-tools-version:5.9
// Binary-only release manifest for AttriloopSDK 0.3.0.
// The signed ZIP at the release URL must match this checksum exactly.
import PackageDescription

let package = Package(
  name: "AttriloopSDK",
  platforms: [.iOS(.v13), .macOS(.v10_15)],
  products: [
    .library(name: "AttriloopSDK", targets: ["AttriloopSDK", "AttriloopSDKPrivacy"])
  ],
  targets: [
    .binaryTarget(
      name: "AttriloopSDK",
      url: "https://github.com/Attriloop/attriloop-ios-spm/releases/download/v0.3.0/AttriloopSDK.xcframework.zip",
      checksum: "ae950364ff066dd42ab68c75d2cb31668f98c6c8d2581ed339a22863a35492b7"
    ),
    // Privacy manifest as a resource bundle: SwiftPM does not copy resources out of
    // the static binary target (see Sources/AttriloopSDKPrivacy).
    .target(
      name: "AttriloopSDKPrivacy",
      path: "Sources/AttriloopSDKPrivacy",
      resources: [.copy("PrivacyInfo.xcprivacy")]
    )
  ]
)
