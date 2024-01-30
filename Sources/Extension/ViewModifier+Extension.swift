//
//  ViewModifier+Extension.swift
//  StackCardView
//
//  Created by Rani Badri on 1/29/24.
//

import Foundation
import SwiftUI

struct EmbedInZStackModifier: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            content
        }
    }
}
