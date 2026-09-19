# AttriloopSDK for Swift Package Manager

This repository distributes the signed Attriloop iOS XCFramework. The Swift
package product is `AttriloopSDK` and supports iOS 13 or later. The source
repository is private.

The `0.2.1` binary release is being prepared. The package manifest references
the upcoming GitHub release asset; the package will become installable once the
signed ZIP is uploaded with the checksum declared in `Package.swift`.

After publication, add this package in Xcode with:

```text
https://github.com/Attriloop/attriloop-ios-spm.git
```

Call `Attriloop.shared.configure(apiKey:)` before your first paywall, then set
RevenueCat's subscriber attribute `attriloopId` from
`Attriloop.shared.getAttriloopId()` before loading the paywall. For an App Clip
install, follow the Attriloop dashboard's SDK setup guide and share an App
Group between the Clip and full app.
