// Project: neumorphism-for-swiftui
// License: MIT
// Deployment Target: iOS 18

// Tests/SoftUIKitTests/SoftUIKitTests.swift

import XCTest
import SwiftUI
@testable import SoftUIKit

final class SoftUIKitTests: XCTestCase {
    
    func testSoftButtonStyleInitialization() {
        let style = SoftButtonStyle()
        XCTAssertNotNil(style)
    }
    
    func testSoftToggleStyleInitialization() {
        let style = SoftToggleStyle()
        XCTAssertNotNil(style)
    }
    
    func testSoftTextFieldStyleInitialization() {
        let style = SoftTextFieldStyle()
        XCTAssertNotNil(style)
    }
    
    func testSoftCardStaticInitialization() {
        // Static イニシャライザで生成できるか
        let card: SoftCard<Text> = .staticCard {
            Text("Test")
        }
        // content クロージャがちゃんと保持されているか確認
        let mirror = Mirror(reflecting: card)
        XCTAssertTrue(mirror.children.contains { $0.label == "content" })
    }
    
    func testSoftCardInteractiveInitialization() {
        // Interactive イニシャライザで生成できるか
        let card: SoftCard<Text> = .interactiveCard(onTap: { })
        {
            Text("Test")
        }
        let mirror = Mirror(reflecting: card)
        XCTAssertTrue(mirror.children.contains { $0.label == "isInteractive" })
    }
    
    func testColorExtensionSystemBackground() {
        // Color.systemBackgroundColor が参照可能か
        let bg = Color.systemBackgroundColor
        // ただコンパイル・アクセスできればよいので、必ずしも描画テストは不要
        XCTAssertNotNil(bg)
    }
}
