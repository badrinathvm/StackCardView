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

struct StackCardKey: EnvironmentKey {
    /// provide a default value for custom dependency
    static var defaultValue = [AnyView]()
}
