//
//  Card.swift
//  StackCardView
//
//  Created by Cassandra Zuria on 2/11/24.
//

import SwiftUI

struct Card<Content: View>: View {
    @Environment(\.cardStyle) private var style
    
    var index: Int
    var content: () -> Content
    
    var body: some View {
        AnyView(
            style.makeBody(
                configuration: StackCardStyleConfiguration(
                    index: index,
                    content: StackCardStyleConfiguration.Content(content: content())
                )
            )
        )
    }
}
