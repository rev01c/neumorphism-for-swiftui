// Project: neumorphism-for-swiftui
// License: MIT
// Deployment Target: iOS 18

// Sources/SoftUIKit/Components/SoftButtonStyle.swift
import SwiftUI

/// A neumorphic ButtonStyle that applies raised or pressed depth based on press state.
public struct SoftButtonStyle: ButtonStyle {
    public var baseColor: Color
    public var cornerRadius: CGFloat
    public var padding: CGFloat
    public var intensity: CGFloat
    
    /// Creates a SoftButtonStyle.
    /// - Parameters:
    ///   - baseColor: The background color of the button.
    ///   - cornerRadius: The corner radius of the button's background.
    ///   - padding: The padding inside the button.
    ///   - intensity: The shadow intensity for the neumorphic effect.
    public init(
        baseColor: Color = Color(.systemBackground),
        cornerRadius: CGFloat = 12,
        padding: CGFloat = 16,
        intensity: CGFloat = 6
    ) {
        self.baseColor = baseColor
        self.cornerRadius = cornerRadius
        self.padding = padding
        self.intensity = intensity
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        let pressedScale: CGFloat = 0.98
        let animationDuration: Double = 0.15
        
        configuration.label
            .padding(padding)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(configuration.isPressed ? baseColor.opacity(0.95) : baseColor)
                    .softShadow(
                        baseColor: baseColor,
                        depth: configuration.isPressed ? .pressed(intensity) : .raised(intensity),
                        cornerRadius: cornerRadius
                    )
            )
            .scaleEffect(configuration.isPressed ? pressedScale : 1.0)
            .brightness(configuration.isPressed ? -0.02 : 0)
            .animation(.easeInOut(duration: animationDuration), value: configuration.isPressed)
            .contentShape(Rectangle())
            .accessibilityAddTraits(.isButton)
    }
}
