import Foundation
import SwiftUI


public extension View {
    
    func setRotationAngle(value: Double) -> some View {
        self.environment(\EnvironmentValues.rotationAngle, value)
    }
    
    func setCardDisplayType(value: StackCardDisplayType) -> some View {
        self.environment(\EnvironmentValues.cardDisplayType, value)
    }
        
    /// - Parameter log: logging string to be displayed
    func log(_ log: String) -> EmptyView {
        print("** \(log)")
        return EmptyView()
    }
}
