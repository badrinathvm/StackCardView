//
//  EnvironmentValues+Extension.swift
//  StackCardView
//
//  Created by Rani Badri on 1/29/24.
//

import Foundation
import SwiftUI

enum StackCardDisplayType: CaseIterable {
    case top, bottom
}

/// Environment values configuration for standard size margins, can be used across the app
extension EnvironmentValues {
    
    /// property wrapper for `rightSwipe`
    var rightSwipe: (() -> Void)? {
        get { self[RightSwipeKey.self] }
        set { self[RightSwipeKey.self] = newValue }
    }
    
    /// property wrapper for `leftSwipe`
    var leftSwipe: (() -> Void)? {
        get { self[LeftSwipeKey.self] }
        set { self[LeftSwipeKey.self] = newValue }
    }
    
    /// property wrapper for `rightButton`
    var rightButton: (() -> Void)? {
        get { self[RightButtonKey.self] }
        set { self[RightButtonKey.self] = newValue }
    }
    
    /// property wrapper for `leftButton`
    var leftButton: (() -> Void)? {
        get { self[LeftButtonKey.self] }
        set { self[LeftButtonKey.self] = newValue }
    }
    
    /// property wrapper for `cardOffset`
    var cardOffset: CGFloat {
        get { self[CardOffsetKey.self] }
        set { self[CardOffsetKey.self] = newValue }
    }
    
    /// property wrapper for `rotationAngle`
    var rotationAngle: Double {
        get { self[RotationAngleKey.self] }
        set { self[RotationAngleKey.self] = newValue }
    }
    
    /// property wrapper for `cardDisplayType`
    var cardDisplayType: StackCardDisplayType {
        get { self[CardDisplayKey.self] }
        set { self[CardDisplayKey.self] = newValue }
    }
}

/// Environment Key for `CardOffset`
struct CardOffsetKey: EnvironmentKey {
    static var defaultValue: CGFloat = 0.0
}

/// Environment Key for `CardDisplay`
struct CardDisplayKey: EnvironmentKey {
    static var defaultValue: StackCardDisplayType = .bottom
}

/// Environment Key for `Rotation`
struct RotationAngleKey: EnvironmentKey {
    static var defaultValue: Double = 10.0
}

/// Environment Key for `RightSwipe` action
struct RightSwipeKey: EnvironmentKey {
    static var defaultValue: (() -> Void)? {
        get {return nil}
        set {}
    }
}

/// Environment Key for `LeftSwipe` action
struct LeftSwipeKey: EnvironmentKey {
    static var defaultValue: ( () -> Void)? {
        get { return nil}
        set{}
    }
}

/// Environment Key for `LeftButton` action
struct LeftButtonKey: EnvironmentKey {
    static var defaultValue: ( () -> Void)? {
        get { return nil}
        set{}
    }
}

/// Environment Key for `RightButton` action
struct RightButtonKey: EnvironmentKey {
    static var defaultValue: ( () -> Void)? {
        get { return nil}
        set{}
    }
}
