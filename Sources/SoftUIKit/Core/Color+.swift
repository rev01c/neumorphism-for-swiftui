//
//  File.swift
//  neumorphism-for-swiftui
//
//  Created by Shingo Sugiura on 2025/7/26.
//

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
