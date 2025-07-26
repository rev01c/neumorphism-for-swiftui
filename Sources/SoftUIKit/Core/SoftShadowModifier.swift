// Project: neumorphism-for-swiftui
// License: MIT
// Deployment Target: iOS 18

// Sources/SoftUIKit/Core/SoftShadowModifier.swift

import SwiftUI

/// Defines the neumorphic depth styles
public enum SoftDepth {
    case flat
    case raised(CGFloat)
    case pressed(CGFloat)
}

/// Applies outer or inner shadows for neumorphic effect
public struct SoftShadowModifier: ViewModifier {
    let baseColor: Color
    let depth: SoftDepth
    let cornerRadius: CGFloat
    
    public init(
        baseColor: Color = Color(.systemBackground),
        depth: SoftDepth = .raised(6),
        cornerRadius: CGFloat = 12
    ) {
        self.baseColor = baseColor
        self.depth = depth
        self.cornerRadius = cornerRadius
    }
    
    public func body(content: Content) -> some View {
        switch depth {
        case .flat:
            content
                .background(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(baseColor)
                )
            
        case .raised(let intensity):
            content
                .background(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(baseColor)
                        .applyShadow(
                            color: Color.black.opacity(0.2),
                            radius: intensity,
                            x: intensity / 2,
                            y: intensity / 2
                        )
                        .applyShadow(
                            color: Color.white.opacity(0.7),
                            radius: intensity,
                            x: -intensity / 2,
                            y: -intensity / 2
                        )
                )
            
        case .pressed(let intensity):
            content
                .background(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(baseColor)
                        .softShadow(
                            color: Color.white.opacity(0.7),
                            radius: intensity,
                            x: intensity / 2,
                            y: intensity / 2,
                            isInner: true
                        )
                        .softShadow(
                            color: Color.black.opacity(0.2),
                            radius: intensity,
                            x: -intensity / 2,
                            y: -intensity / 2,
                            isInner: true
                        )
                )
        }
    }
}

public extension View {
    /// Applies neumorphic shadow effect
    func softShadow(
        baseColor: Color = Color(.systemBackground),
        depth: SoftDepth = .raised(6),
        cornerRadius: CGFloat = 12
    ) -> some View {
        self.modifier(
            SoftShadowModifier(
                baseColor: baseColor,
                depth: depth,
                cornerRadius: cornerRadius
            )
        )
    }
    
    /// Applies individual shadow (for internal use)
    func applyShadow(
        color: Color,
        radius: CGFloat,
        x: CGFloat,
        y: CGFloat
    ) -> some View {
        self.shadow(
            color: color,
            radius: radius,
            x: x,
            y: y
        )
    }
}
