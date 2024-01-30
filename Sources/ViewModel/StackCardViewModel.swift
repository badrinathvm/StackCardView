//
//  StackCardViewModel.swift
//  StackCardView
//
//  Created by Rani Badri on 1/29/24.
//

import Foundation
import SwiftUI

public protocol StackCardModelProtocol {
    associatedtype CardType
    var id: String { get set }
}

protocol StackCardViewModelProtocol {
    func removeCard()
}

extension StackCardViewModel: StackCardViewModelProtocol {
    public func removeCard() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            if let _ = self.displayingCards?.first {
                let _ = withAnimation {
                    self.displayingCards?.removeFirst()
                }
            }
        }
    }
}

public class StackCardViewModel<T: StackCardModelProtocol>: ObservableObject {
    @Published var cards: [T] = []
    @Published public var displayingCards: [T]?
    
    public init(cards: [T] = [], displayingCards: [T]? = nil) {
        self.cards = cards
        self.displayingCards = displayingCards
    }
    
    /**
     Returns the index of the specified card within the displayingCards array.

     - Parameters:
        - card: The card for which the index is to be determined.

     - Returns:
        - A CGFloat representing the index of the card. Returns 0 if the card is not found.

     The `getIndex` method searches for the specified card within the displayingCards array and returns its index as a CGFloat. If the card is not found, the method defaults to returning 0.
    */

    public func getIndex(type card: T) -> CGFloat {
        return CGFloat(displayingCards?.firstIndex { $0.id == card.id } ?? 0)
    }
    
    
    /**
     Calculates the vertical offset for a card based on its index.

     - Parameters:
        - card: The card for which the offset is to be determined.

     - Returns:
        - A CGFloat representing the vertical offset for the specified card.

     The `getOffset` method takes a card of type `T` as input and calculates its vertical offset based on its index. The index is obtained by calling the `getIndex` method on the current instance of the class that contains this method. The resulting index is then converted to a CGFloat.

     The `topOffset` is determined by multiplying the index by 15, but with a maximum limit of 30 (2 * 15). This ensures that the offset does not exceed 30 in cases where the index is greater than 2.

     The final calculated offset is returned as a CGFloat, representing the vertical positioning of the card.
    */
    public func getOffset(card: T) -> CGFloat {
        let index = CGFloat(self.getIndex(type: card))
        let topOffset = CGFloat((index <= 2 ? index : 2 ) * Utils.defaultValue)
        return topOffset
    }
}


