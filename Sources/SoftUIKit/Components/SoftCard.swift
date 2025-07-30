// Project: neumorphism-for-swiftui
// License: MIT
// Deployment Target: iOS 18

// Sources/SoftUIKit/Components/SoftCard.swift
import SwiftUI

/// Neumorphic Card Container
public struct SoftCard<Content: View>: View {
    public var baseColor: Color
    public var cornerRadius: CGFloat
    public var intensity: CGFloat
    public var padding: CGFloat
    public var content: () -> Content
    
    private let isInteractive: Bool
    private let onTap: (() -> Void)?
    
    @GestureState private var isPressed: Bool = false
    
    public init(
        baseColor: Color = .systemBackgroundColor,
        cornerRadius: CGFloat = 12,
        intensity: CGFloat = 6,
        padding: CGFloat = 16,
        isInteractive: Bool = false,
        onTap: (() -> Void)? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.baseColor = baseColor
        self.cornerRadius = cornerRadius
        self.intensity = intensity
        self.padding = padding
        self.isInteractive = isInteractive
        self.onTap = onTap
        self.content = content
    }
    
    public var body: some View {
        let depth: SoftDepth = (isInteractive && isPressed)
        ? .pressed(intensity)
        : .raised(intensity)
        
        let cardContent = content()
            .padding(padding)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(isPressed ? baseColor.opacity(0.98) : baseColor)
                    .softShadow(
                        baseColor: baseColor,
                        depth: depth,
                        cornerRadius: cornerRadius
                    )
            )
            .scaleEffect((isInteractive && isPressed) ? 0.98 : 1.0)
            .animation(.easeInOut(duration: 0.15), value: isPressed)
        
        if isInteractive {
            cardContent
                .contentShape(Rectangle())
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .updating($isPressed) { _, state, _ in
                            state = true
                        }
                        .onEnded { _ in
                            onTap?()
                        }
                )
                .accessibilityAddTraits(.isButton)
        } else {
            cardContent
        }
    }
}

public extension SoftCard {
    /// Interactive Card Initializer
    static func interactiveCard(
        baseColor: Color = .systemBackgroundColor,
        cornerRadius: CGFloat = 12,
        intensity: CGFloat = 6,
        padding: CGFloat = 16,
        onTap: @escaping () -> Void,
        @ViewBuilder content: @escaping () -> Content
    ) -> SoftCard<Content> {
        SoftCard(
            baseColor: baseColor,
            cornerRadius: cornerRadius,
            intensity: intensity,
            padding: padding,
            isInteractive: true,
            onTap: onTap,
            content: content
        )
    }
    
    /// Static Card Initializer
    static func staticCard(
        baseColor: Color = .systemBackgroundColor,
        cornerRadius: CGFloat = 12,
        intensity: CGFloat = 6,
        padding: CGFloat = 16,
        @ViewBuilder content: @escaping () -> Content
    ) -> SoftCard<Content> {
        SoftCard(
            baseColor: baseColor,
            cornerRadius: cornerRadius,
            intensity: intensity,
            padding: padding,
            isInteractive: false,
            onTap: nil,
            content: content
        )
    }
}
