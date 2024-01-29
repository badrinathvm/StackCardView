//
//  StackCardView.swift
//  StackCardView
//
//  Created by Rani Badri on 1/29/24.
//

import Foundation
import SwiftUI


public struct StackCard<Content: View, T: Identifiable>: View {
    private var content: () -> Content
    private var model: T
    
    @State var offset:CGFloat = 0.0
    @State var endSwipe: Bool = false
    
    @Environment(\.rightSwipe) var onRightSwipe
    
    @Environment(\.leftSwipe) var onLeftSwipe
    
    @Environment(\.cardOffset) var cardOffset
    
    @Environment(\.rotationAngle) var angle
    
    @Environment(\.cardDisplayType) var displayType
    
    @Environment(\.rightButton) var onRightButtonTap
    
    @Environment(\.leftButton) var onLeftButtonTap
    
    @GestureState private var dragState: DragState = DragState.inactive
    
    @ObservedObject private var stackCardButtonPublisher: StackCardButtonProperties
    
    public init(model: T, stackCardButtonPublisher: StackCardButtonProperties? = nil, @ViewBuilder content: @escaping () -> Content) {
        self.model = model
        self.stackCardButtonPublisher = stackCardButtonPublisher ?? StackCardButtonProperties()
        self.content = content
    }
    
    
    public var body: some View {
        GeometryReader { proxy in
            ZStack {
                content()
                    .frame(width: proxy.size.width - cardOffset, height: proxy.size.height)
                    .cornerRadius(Utils.corerRadius)
                    .offset(y: displayType == .bottom ? cardOffset : -cardOffset)
            }
            .offset(x: offset)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .rotationEffect(.init(degrees: getRotationAngle())) //controls the rotation angle.
            .contentShape(Circle().trim(from: 0, to: endSwipe ? 0 : 1)) //Users can enable second card too, so we are setting the shape.
            .gesture(dragGesture)
            .onReceive(stackCardButtonPublisher.$buttons) { buttons in
                let width = UIScreen.main.bounds.width - Utils.defaultValue
                switch true {
                case isIdEqual(to: buttons.left):
                    withAnimation {
                        offset = -width * 2
                        endSwipeActions()
                        onLeftButtonTap?()
                    }
                case isIdEqual(to: buttons.right):
                    withAnimation {
                        offset = width * 2
                        endSwipeActions()
                        onRightButtonTap?()
                    }
                default:
                    break
                }
            }
        }
    }
    
    // Use a generic type for `id` and constrain it to `Equatable`
    private func isIdEqual<IdType: Equatable>(to id: IdType) -> Bool {
        guard let typedId = id as? T.ID else { return false }
        return model.id == typedId
    }
    
    
    private func getRotationAngle()-> Double {
        offset / (UIScreen.main.bounds.width - 50) * angle
    }
    
    private func endSwipeActions() {
        withAnimation(.none) { endSwipe = true }
    }
}


extension StackCard {
    
    private var isDragging: Bool  { dragState.isActive }
    
    private var dragGesture: some Gesture {
        return DragGesture()
            .updating($dragState, body: { value, state, transaction in
                state = .dragging(translation: value.translation)
            })
            .onChanged({ value in
                let transaltion = value.translation.width
                offset = isDragging ? transaltion : .zero
            })
            .onEnded({ value in
                let width = UIScreen.main.bounds.width - Utils.defaultValue
                let translation = value.translation.width
                let checkingStatus = translation > 0 ? translation : -translation
                
                withAnimation {
                    if checkingStatus > (width/2) {
                        offset = (translation > 0 ? width : -width) * 2
                        endSwipeActions()
                        _ = translation > 0 ? onRightSwipe?() : onLeftSwipe?()
                    } else {
                        offset = .zero
                    }
                }
            })
    }
}
