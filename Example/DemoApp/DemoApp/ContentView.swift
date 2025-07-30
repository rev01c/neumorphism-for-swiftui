//
//  ContentView.swift
//  DemoApp
//
//  Created by Shingo Sugiura on 2025/7/30.
//

import SwiftUI
import SoftUIKit

struct ContentView: View {
    @State private var toggleOn = false
    @State private var textInput = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                
                // MARK: SoftButtonStyle
                Button("Neumorphic Button") {
                    print("Button tapped")
                }
                .buttonStyle(
                    SoftButtonStyle(
                        baseColor: .systemBackgroundColor,
                        cornerRadius: 12,
                        padding: 16,
                        intensity: 6
                    )
                )
                
                // MARK: SoftToggleStyle
                Toggle("Neumorphic Toggle", isOn: $toggleOn)
                    .toggleStyle(
                        SoftToggleStyle(
                            baseColor: .systemBackgroundColor,
                            cornerRadius: 10,
                            size: CGSize(width: 60, height: 30),
                            intensity: 8
                        )
                    )
                    .padding(.horizontal)
                
                // MARK: SoftTextFieldStyle
                TextField("Enter text...", text: $textInput)
                    .textFieldStyle(
                        SoftTextFieldStyle(
                            baseColor: .systemBackgroundColor,
                            cornerRadius: 10,
                            padding: 12,
                            intensity: 6
                        )
                    )
                    .padding(.horizontal)
                
                // MARK: SoftCard (static)
                SoftCard.staticCard {
                    VStack {
                        Text("Static Card")
                            .font(.headline)
                        Text("No interaction")
                            .font(.subheadline)
                    }
                }
                
                // MARK: SoftCard (interactive)
                SoftCard.interactiveCard(onTap: {
                    print("Interactive Card tapped")
                }) {
                    VStack {
                        Text("Interactive Card")
                            .font(.headline)
                        Text("Tap me!")
                            .font(.subheadline)
                    }
                }
            }
            .padding()
        }
        .background(Color.systemBackgroundColor.edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    ContentView()
}
