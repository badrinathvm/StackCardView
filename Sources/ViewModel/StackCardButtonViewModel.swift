import Foundation
import Combine

public enum StackCardDirection: CaseIterable {
    case left, right
}

public class StackCardButtonPublisher: ObservableObject {
    @Published var direction: StackCardDirection?
    
    public init() { }
    
    public func setDirection(direction: StackCardDirection) {
        self.direction = direction
    }
}
