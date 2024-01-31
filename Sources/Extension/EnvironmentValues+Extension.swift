import Foundation
import SwiftUI

public enum StackCardDisplayType: CaseIterable {
    case top, bottom
}

/// Environment values configuration for standard size margins, can be used across the app
extension EnvironmentValues {
    
    /// property wrapper  for `StepsKey`
    var cards: [AnyView] {
        get { self[StackCardKey.self] }
        set { self[StackCardKey.self] = newValue }
    }
    
    /// property wrapper  for `StepsKey`
    var stackCardModels: [any StackCardModelProtocol] {
        get { self[StackCardModelKey.self] }
        set { self[StackCardModelKey.self] = newValue }
    }
    
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

struct StackCardKey: EnvironmentKey {
    /// provide a default value for custom dependency
    static var defaultValue = [AnyView]()
}

struct StackCardModelKey: EnvironmentKey {
    /// provide a default value for custom dependency
    static var defaultValue = [any StackCardModelProtocol]()
}
