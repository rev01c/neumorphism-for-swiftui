// Project: neumorphism-for-swiftui
// License: MIT
// Deployment Target: iOS 18

// Sources/SoftUIKit/Components/SoftToggleStyle.swift

import SwiftUI

/// A neumorphic ToggleStyle where the track has outer shadows and the thumb has inner shadows.
public struct SoftToggleStyle: ToggleStyle {
    public var baseColor: Color
    public var cornerRadius: CGFloat
    public var size: CGSize
    public var intensity: CGFloat
    
    /// Creates a SoftToggleStyle.
    /// - Parameters:
    ///   - baseColor: The background color for the track and thumb.
    ///   - cornerRadius: The corner radius for the track.
    ///   - size: The size of the toggle track.
    ///   - intensity: The shadow intensity for both track and thumb.
    public init(
        baseColor: Color = Color(.systemBackground),
        cornerRadius: CGFloat = 16,
        size: CGSize = CGSize(width: 60, height: 30),
        intensity: CGFloat = 6
    ) {
        self.baseColor = baseColor
        self.cornerRadius = cornerRadius
        self.size = size
        self.intensity = intensity
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        let trackDepth: SoftDepth = configuration.isOn ? .pressed(intensity * 0.5) : .flat
        let thumbDepth: SoftDepth = configuration.isOn ? .raised(intensity * 0.8) : .raised(intensity)
        
        let track = RoundedRectangle(cornerRadius: cornerRadius)
            .fill(configuration.isOn ? baseColor.opacity(0.95) : baseColor)
            .softShadow(
                baseColor: baseColor,
                depth: trackDepth,
                cornerRadius: cornerRadius
            )
            .frame(width: size.width, height: size.height)
        
        let thumbDiameter = size.height * 0.8
        let offsetX = configuration.isOn
        ? (size.width - size.height) / 2
        : -(size.width - size.height) / 2
        
        let thumb = Circle()
            .fill(baseColor)
            .softShadow(
                baseColor: baseColor,
                depth: thumbDepth,
                cornerRadius: thumbDiameter / 2
            )
            .frame(width: thumbDiameter, height: thumbDiameter)
            .offset(x: offsetX)
        
        return Button(action: {
            withAnimation(.easeInOut(duration: 0.2)) {
                configuration.isOn.toggle()
            }
        }) {
            ZStack {
                track
                thumb
            }
        }
        .buttonStyle(PlainButtonStyle())
        .accessibilityRole(.switch)
        .accessibilityValue(configuration.isOn ? "On" : "Off")
        .accessibilityAddTraits(configuration.isOn ? .isSelected : [])
    }
}
