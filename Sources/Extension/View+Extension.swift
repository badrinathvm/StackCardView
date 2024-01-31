import Foundation
import SwiftUI


public extension View {
    
    func eraseToAnyView() -> AnyView{
        AnyView(self)
    }
    
    func onRightSwipe(perform action: @escaping (() -> Void)) -> some View {
        self.environment(\EnvironmentValues.rightSwipe, action)
    }
    
    func onLeftSwipe(perform action: @escaping (() -> Void)) -> some View {
        self.environment(\EnvironmentValues.leftSwipe, action)
    }
    
    func onRightButtonTap(perform action: @escaping (() -> Void)) -> some View {
        self.environment(\EnvironmentValues.rightButton, action)
    }
    
    func onLeftButtonTap(perform action: @escaping (() -> Void)) -> some View {
        self.environment(\EnvironmentValues.leftButton, action)
    }
    
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
    
    func embedInZStack() -> some View {
        self.modifier(EmbedInZStackModifier())
    }
    
    func bind(model: [any StackCardModelProtocol]) -> some View {
        self.environment(\EnvironmentValues.stackCardModels, model)
    }
}
