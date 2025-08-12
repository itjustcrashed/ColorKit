# ColorKit
A cross-platform color library for Swift.

## Prerequisites
* Swift 6.2 or later

## Adding the package
### Swift Package Manager
In `Package.swift`:
```swift
// name/products/platforms...
    dependencies: [
        // From a release (Make sure to check the package releases!)
        .package(url: "https://github.com/itjustcrashed/ColorKit.git", from: "1.0.0")
        // Latest commit (Don't use this in production!)
        .package(url: "https://github.com/itjustcrashed/ColorKit.git", branch: "main")
    ],
    targets: [
        .target(
            name: "MyTarget",
            dependencies [
                .product(name: "ColorKit", package: "ColorKit")
            ]
        )
        // ...
    ]
```
### Xcode Project
File → Add Package Dependencies and search `https://github.com/itjustcrashed/ColorKit.git`

## Usage
ColorKit provides two convenient functions to initialize a color: `hsb()` and `rgb`, as well as presets:
```swift
// Creates three identical reds.
let presetRed = Color.red
let rgbRed = rgb(1, 0, 0)
let hsbRed = hsb(0, 1, 1)
presetRed == rgbRed && presetRed == hsbRed // Returns true
```

> [!IMPORTANT]
> Colors are constructed using values between 0 and _1_, **NOT** 360, 255, or 100.
> If you need to use degrees/8-bit/percentages, divide the value by 360, 255, or 100.
