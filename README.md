# neumorphism-for-swiftui

**SoftUIKit** is a collection of Neumorphic-style SwiftUI components. Easily apply neumorphism to Buttons, Toggles, TextFields, and Cards.

## Table of Contents

1. [Installation](#installation)
2. [Usage](#usage)

   * [SoftButtonStyle](#softbuttonstyle)
   * [SoftToggleStyle](#softtogglestyle)
   * [SoftTextFieldStyle](#softtextfieldstyle)
   * [SoftCard](#softcard)
3. [Customization Options](#customization-options)
4. [Demo Application](#demo-application)
5. [License](#license)
6. [Contributing](#contributing)

---

## Installation

### Swift Package Manager

Add the following to your `Package.swift`:

```swift
// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "YourApp", // ← Replace this with your app’s module name
    dependencies: [
        .package(
            url: "https://github.com/rev01c/neumorphism-for-swiftui.git",
            from: "0.1.0"
        ),
    ],
    targets: [
        .target(
            name: "YourApp", // ← And here as well
            dependencies: [
                .product(name: "SoftUIKit", package: "neumorphism-for-swiftui")
            ]
        )
    ]
)
```

Or in Xcode: **File > Add Packages…** and enter the repository URL.

---

## Usage

Import the module where you need it:

```swift
import SoftUIKit
```

### SoftButtonStyle

```swift
Button("Tap Me") {
    // action
}
.buttonStyle(
    SoftButtonStyle(
        baseColor: .systemBackground,
        cornerRadius: 12,
        padding: 16,
        intensity: 6
    )
)
```

### SoftToggleStyle

```swift
Toggle("Enable Feature", isOn: $isOn)
    .toggleStyle(
        SoftToggleStyle(
            baseColor: .systemBackground,
            cornerRadius: 10,
            size: CGSize(width: 60, height: 30),
            intensity: 8
        )
    )
```

### SoftTextFieldStyle

```swift
TextField("Enter text", text: $text)
    .textFieldStyle(
        SoftTextFieldStyle(
            baseColor: .systemBackground,
            cornerRadius: 10,
            padding: 12,
            intensity: 6
        )
    )
```

### SoftCard

Interactive card (with tap callback):

```swift
SoftCard.interactive(onTap: {
    print("Card tapped")
}) {
    VStack {
        Text("Neumorphic Card")
            .font(.headline)
        Text("Tap me")
            .font(.subheadline)
    }
}
```

Static card (no interaction):

```swift
SoftCard.static {
    Text("Static Card")
}
```

---

## Customization Options

All components share these common parameters:

* **baseColor**: Background color
* **cornerRadius**: Corner radius
* **padding**: Inner padding
* **intensity**: Shadow intensity

Some components may expose additional or variant parameters (e.g., `size` for `SoftToggleStyle`).

---

## Demo Application

A demo SwiftUI app is available under `Examples/DemoApp`. To run:

1. Clone the repository.
2. Open `Examples/DemoApp/NeumorphismDemo.xcodeproj` in Xcode.
3. Select the **DemoApp** target and run on a simulator or device.

---

## License

MIT License © rev01c
See [LICENSE](LICENSE) for details.

---

## Contributing

Contributions, issues, and feature requests are welcome!

1. Fork this repository.
2. Create a new branch.
3. Commit your changes and push.
4. Open a Pull Request.

Please ensure your code follows the existing style and includes tests where applicable.
