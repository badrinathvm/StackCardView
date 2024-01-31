import Foundation
import SwiftUI

struct EmbedInZStackModifier: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            content
        }
    }
}
