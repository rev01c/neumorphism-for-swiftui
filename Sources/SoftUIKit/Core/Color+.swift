// Project: neumorphism-for-swiftui
// License: MIT
// Deployment Target: iOS 18

// Sources/SoftUIKit/Core/Color+.swift

import SwiftUI

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

public extension Color {
    static var systemBackgroundColor: Color {
#if canImport(UIKit)
        Color(UIColor.systemBackground)
#elseif canImport(AppKit)
        Color(NSColor.windowBackgroundColor)
#else
        Color.white
#endif
    }
}
