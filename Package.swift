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
      checksum: "7253039c673fa9ef7ea648f920ed69cf8b127103da70d13d94354c1c2b0088c7"
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
