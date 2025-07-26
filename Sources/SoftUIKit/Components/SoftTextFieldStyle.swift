// Project: neumorphism-for-swiftui
// License: MIT
// Deployment Target: iOS 18

// Sources/SoftUIKit/Components/SoftTextFieldStyle.swift
import SwiftUI

/// A neumorphic TextFieldStyle that applies neumorphic depth and visual feedback.
public struct SoftTextFieldStyle: TextFieldStyle {
    public var baseColor: Color
    public var cornerRadius: CGFloat
    public var padding: CGFloat
    public var intensity: CGFloat
    
    @FocusState private var isFocused: Bool
    
    /// Creates a SoftTextFieldStyle.
    /// - Parameters:
    ///   - baseColor: The background color of the text field.
    ///   - cornerRadius: The corner radius of the text field's background.
    ///   - padding: The padding inside the text field.
    ///   - intensity: The shadow intensity for the neumorphic effect.
    public init(
        baseColor: Color = Color(.systemBackground),
        cornerRadius: CGFloat = 12,
        padding: CGFloat = 8,
        intensity: CGFloat = 6
    ) {
        self.baseColor = baseColor
        self.cornerRadius = cornerRadius
        self.padding = padding
        self.intensity = intensity
    }
    
    public func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .focused($isFocused)
            .padding(padding)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(isFocused ? baseColor.opacity(0.98) : baseColor)
                    .softShadow(
                        baseColor: baseColor,
                        depth: isFocused ? .pressed(intensity * 0.7) : .raised(intensity),
                        cornerRadius: cornerRadius
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .stroke(
                                isFocused ? Color.accentColor.opacity(0.3) : Color.clear,
                                lineWidth: isFocused ? 1 : 0
                            )
                    )
            )
            .animation(.easeInOut(duration: 0.2), value: isFocused)
    }
}
