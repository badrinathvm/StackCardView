//
//  View+Extension.swift
//  StackCardView
//
//  Created by Rani Badri on 1/29/24.
//

import Foundation
import SwiftUI


extension View {
    
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
    
    func setCardOffset(offset: CGFloat) -> some View {
        self.environment(\EnvironmentValues.cardOffset, offset)
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
}
// MARK: - CodeAI Output
    // *** PLEASE SUBSCRIBE TO GAIN CodeAI ACCESS! ***
/// To subscribe, open CodeAI MacOS app and tap SUBSCRIBE
