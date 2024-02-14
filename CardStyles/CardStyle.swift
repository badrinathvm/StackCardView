//
//  CardStyle.swift
//  StackCardView
//
//  Created by Cassandra Zuria on 2/4/24.
//

import SwiftUI

/// A type that applies custom interaction behavior and appearance to all cards within a `StackCard` view.
public protocol StackCardStyle {
    associatedtype Body: View
    typealias Configuration = StackCardStyleConfiguration

    func makeBody(configuration: Self.Configuration) -> Self.Body
}

/// The properties of a card.
public struct StackCardStyleConfiguration {
    public struct Content: View {
        init<Content: View>(content: Content) {
            body = AnyView(content)
        }

        public var body: AnyView
    }

    /// The index of the card in the collection of data.
    public let index: Int
//    @Binding public var currentIndex: Int
    public let content: StackCardStyleConfiguration.Content
}

struct StackCardStyleKey: EnvironmentKey {
    static var defaultValue: any StackCardStyle = DefaultStackCardStyle()
}

// MARK: - View modifier

extension EnvironmentValues {
    var cardStyle: any StackCardStyle {
        get { self[StackCardStyleKey.self] }
        set { self[StackCardStyleKey.self] = newValue }
    }
}

public extension StackCard {
    /// Sets the style for the cards in ``StackCard`` within this view to a style with a custom appearance.
    func cardStyle(_ style: some StackCardStyle) -> some View {
        environment(\.cardStyle, style)
    }
}
