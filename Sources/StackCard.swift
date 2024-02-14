//
//  StackCard.swift
//  StackCardView
//
//  Created by Badarinath Venkatnarayansetty on 1/29/24.
//

import Foundation
import SwiftUI

public struct StackCard<Element, CardContent, OverlayContent>: View where CardContent: View, OverlayContent: View, Element: Identifiable {
    
    // Initializer related
    @Binding private var data: [Element]
    private var cardContent: (Element) -> CardContent
    private var overlayContent: (_ gesture: StackCardGesture) -> OverlayContent
    
    private var enumeratedData: Array<EnumeratedSequence<[Element]>.Element> { Array(data.enumerated()) }
    
    // Gesture related
    @State private var offset: CGFloat = 0
    @State private var rotationDegree: Double = 0
    @State private var cardGesture: StackCardGesture = StackCardGesture(swipeDirection: .left, offset: 0)
    
    // View modifier related
    private var onCardDragged: ((StackCardGesture) -> Void)?
    private var onCardSwiped: ((_ swipeDirection: SwipeDirection) -> Void)?
    
    private var currentIndex: Int? { enumeratedData.last?.offset }
    
    public init(
        _ data: Binding<[Element]>,
        @ViewBuilder cardContent: @escaping (Element) -> CardContent,
        @ViewBuilder overlay overlayContent: @escaping (_ gesture: StackCardGesture) -> OverlayContent = { _ in EmptyView() }
    ) {
        self._data = data
        self.cardContent = cardContent
        self.overlayContent = overlayContent
    }
    
    public var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(enumeratedData, id: \.element.id) { (index, item) in
                    Card(index: index) {
                        ZStack {
                            cardContent(item)
                            
                            if index == currentIndex {
                                overlayContent(cardGesture)
                            }
                        }
                    }
                    .offset(x: getOffset(for: index))
                    .rotationEffect(.degrees(getRotationAngle(for: index)))
                }
            }
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        guard !data.isEmpty else { return }
                        let translationWidth = gesture.translation.width
                        offset = translationWidth
                        
                        let cardGesture = StackCardGesture(
                            swipeDirection: translationWidth > 0 ? .right : .left,
                            offset: getSwipeProgress(translationWidth, in: geometry.size.width)
                        )
                        self.cardGesture = cardGesture
                        onCardDragged?(cardGesture)
                    }
                    .onEnded { gesture in
                        guard !data.isEmpty else { return }
                        if getSwipeProgress(gesture.translation.width, in: geometry.size.width) > 0.5 {
                            withAnimation {
                                data.removeFirst()
                            }
                        }
                        
                        offset = .zero
                        self.cardGesture = StackCardGesture(swipeDirection: .left, offset: 0)
                    }
            )
            .environment(\.swipeCard, SwipeCardAction(action: swipe(_:)))
        }
    }
    
    func swipe(_ direction: SwipeDirection) {
        
    }
}

// MARK: - Drag gesture

private extension StackCard {
    func getOffset(for index: Int) -> CGFloat {
        guard index == currentIndex else { return 0 }
        return offset
    }
    
    func getRotationAngle(for index: Int) -> Double {
        guard index == currentIndex else { return 0 }
        return Double(offset / 40)
    }
    
    func getSwipeProgress(_ offset: CGFloat, in containerWidth: CGFloat) -> CGFloat {
        abs(offset) / containerWidth
    }
}

// MARK: - View modifiers

public extension StackCard {
    /// Adds an action to perform when the top card is dragged.
    /// - Parameter action: The `action` closure's parameter contains the gesture's new value.
    func onCardDragged(perform action: @escaping ((_ gesture: StackCardGesture) -> Void)) -> StackCard {
        var view = self
        view.onCardDragged = action
        return view
    }
    
    /// Adds an action to perform when a card is swiped away.
    /// - Parameter action: The `action` closure's parameter contains the swipe direction.
    func onCardSwiped(perform action: @escaping ((_ swipeDirection: SwipeDirection) -> Void)) -> StackCard {
        var view = self
        view.onCardSwiped = action
        return view
    }
    
    func setRotationAngle(_ value: Double) -> StackCard {
        var view = self
        view.rotationDegree = value
        return view
    }
}
