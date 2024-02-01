import Foundation
import Combine

public enum StackCardDirection: CaseIterable {
    case left, right
}

public class StackCardButtonPublisher: ObservableObject {
   // @Published var buttons: (left: String, right: String) = ("", "")
    @Published var direction: StackCardDirection?
    
    public init() { }
    
    public func setDirection(direction: StackCardDirection) {
        self.direction = direction
    }
    
//    public init(left: String = "", right: String = "") {
//        self.buttons = (left, right)
//    }
    
//    public func setLeftButton(for id: String) {
//        self.buttons.left = id
//    }
//    
//    public func setRightButton(for id: String) {
//        self.buttons.left = id
//    }
}
