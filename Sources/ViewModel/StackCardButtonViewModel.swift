import Foundation
import Combine

public class StackCardButtonProperties: ObservableObject {
    @Published var buttons: (left: String, right: String) = ("", "")
    
    public init(left: String = "", right: String = "") {
        self.buttons = (left, right)
    }
    
    public func setLeftButton(for id: String) {
        self.buttons.left = id
    }
    
    public func setRightButton(for id: String) {
        self.buttons.left = id
    }
}
