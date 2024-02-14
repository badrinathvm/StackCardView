//
//  SwipeCardAction.swift
//  StackCardView
//
//  Created by Cassandra Zuria on 2/13/24.
//

import SwiftUI

/// An action that swipes the topmost card in a ``StackCard`` view.
public struct SwipeCardAction {
    let action: (SwipeDirection) -> ()
    
    public func callAsFunction(_ direction: SwipeDirection) {
        action(direction)
    }
}

struct SwipeCardActionKey: EnvironmentKey {
    static var defaultValue: SwipeCardAction? = nil
}

public extension EnvironmentValues {
    var swipeCard: SwipeCardAction? {
        get { self[SwipeCardActionKey.self] }
        set { self[SwipeCardActionKey.self] = newValue }
    }
}
