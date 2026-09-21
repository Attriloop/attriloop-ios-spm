# AttriloopSDK for Swift Package Manager

This repository distributes the signed Attriloop iOS XCFramework. The Swift
package product is `AttriloopSDK` and supports iOS 13 or later. The source
repository is private.

The `0.2.1` release distributes the signed XCFramework as a GitHub Release
asset, pinned by the checksum in `Package.swift`.

Before publication, run
`scripts/verify-release.sh /path/to/AttriloopSDK.xcframework.zip` on a Mac.
It checks the checksum, privacy manifest, and code signature. Upload those
exact bytes to the `v0.2.1` release while this repository is still private,
then make this binary-only repository public. Keep the SDK source repository
private.

Add this package in Xcode with:

```text
https://github.com/Attriloop/attriloop-ios-spm.git
```

Call `Attriloop.shared.configure(apiKey:)` before your first paywall, then set
RevenueCat's subscriber attribute `attriloopId` from
`Attriloop.shared.getAttriloopId()` before loading the paywall. For an App Clip
install, follow the Attriloop dashboard's SDK setup guide and share an App
Group between the Clip and full app.
