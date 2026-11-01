# AttriloopSDK for Swift Package Manager

This repository distributes the signed Attriloop iOS XCFramework. The Swift
package product is `AttriloopSDK` and supports iOS 13 or later. The source
repository is private.

The `0.3.0` release distributes the signed XCFramework as a GitHub Release
asset, pinned by the checksum in `Package.swift`.

Before publication, run
`scripts/verify-release.sh /path/to/AttriloopSDK.xcframework.zip` on a Mac.
It checks the checksum, privacy manifest, and code signature. Upload those
exact bytes to the `v0.3.0` release while this repository is still private,
then make this binary-only repository public. Keep the SDK source repository
private.

Add this package in Xcode with:

```text
https://github.com/Attriloop/attriloop-ios-spm.git
```

Call `Attriloop.shared.configure(apiKey:)` at launch. Before your first paywall,
pass the SDK's RevenueCat attributes to RevenueCat:

```swift
let attrs = await Attriloop.shared.getRevenueCatAttributes(timeout: 5)
Purchases.shared.attribution.setAttributes(attrs)
let offerings = try await Purchases.shared.syncAttributesAndOfferingsIfNeeded()
```

The map always contains `attriloop_id`, the key the RevenueCat webhook joins on.
Apps that still set the legacy `attriloopId` attribute keep working. For an App
Clip install, follow the Attriloop dashboard's SDK setup guide and share an App
Group between the Clip and full app.

## 0.3.0

- `getAttributionParams()` async, mint-on-read `getAttriloopId()`,
  `setUserAttributes` / `clearUserAttributes`, `getRevenueCatAttributes()`.
- **Breaking:** before `configure` the match status is `.notConfigured`;
  `.skipped` now means the server will not attempt a match.
- The privacy manifest declares tracking (`NSPrivacyTracking = true`) for the
  user-attribute data types, with `t.attriloop.com` in
  `NSPrivacyTrackingDomains`. User attributes are sent only when ATT is
  `.authorized`; the SDK never shows the prompt.
