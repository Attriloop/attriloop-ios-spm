// Carries the AttriloopSDK privacy manifest as a SwiftPM resource bundle.
//
// AttriloopSDK ships as a static XCFramework. SwiftPM does not copy resources out of
// a static binary target into the app, so the PrivacyInfo.xcprivacy inside the
// framework would not reach the app bundle or Xcode's privacy report. This target
// holds a copy of the same manifest; scripts/verify-release.sh checks that the copy
// is identical to the one in the released ZIP. No code lives here.
