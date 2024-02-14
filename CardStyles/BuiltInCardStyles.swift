//
//  BuiltInCardStyles.swift
//  StackCardView
//
//  Created by Cassandra Zuria on 2/13/24.
//

import SwiftUI

/// The default card style.
public struct DefaultStackCardStyle: StackCardStyle {
    public func makeBody(configuration: Configuration) -> some View {
        configuration.content
            .offset(y: -28 * Double(configuration.index))
            .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 1)
            .cornerRadius(16.0)
        //            .scaleEffect(scale(for: configuration.index, currentIndex: configuration.currentIndex), anchor: .center)
    }
    
    private func yOffset(for index: Int) -> CGFloat {
        return -12 * CGFloat(index)
    }
    
    private func scale(for index: Int, currentIndex: Int) -> CGFloat {
        return 1 - (0.05 * CGFloat(currentIndex - index))
    }
    
    private func currentPosition(for index: Int, currentIndex: Int) -> Double {
        Double(currentIndex - index)
    }
}

public extension StackCardStyle where Self == DefaultStackCardStyle {
    /// The default card style.
    static var `default`: Self { .init() }
}
