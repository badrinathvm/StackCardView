import Foundation
import SwiftUI
import StackCardView

//Step 1:

// create a model make sure it corresponds to `StackCardModelProtocol`
struct StackCardModel: Identifiable {
    typealias CardType = StackCardModel
    
    var id: String
    var name:String = ""
    var image: String = ""
    
    init(id: String, name: String, image: String) {
        self.id = id
        self.name = name
        self.image = image
    }
}


struct StackCardDemoView: View {
    @State private var stackCardModels: [StackCardModel] = []
        
    var body: some View {
        ZStack {
            // iterate over the list of cards
            StackCard($stackCardModels) { card in
                Image(card.image)
                    .resizable()
            } overlay: { gesture in
                ZStack {
                    Rectangle()
                        .fill(gesture.swipeDirection == .left ? Color.red : Color.green)
                        .opacity(gesture.offset)
                    
                    if gesture.offset > 0 {
                        Text(gesture.swipeDirection == .left ? "Keep unread" : "Mark as read")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                    }
                }
            }
            .onCardDragged { gesture in
                print("Card swiped in \(gesture.swipeDirection) direction with \(gesture.offset)")
            }
            .onCardSwiped { swipeDirection in
                print("Card swiped to the \(swipeDirection)")
            }
            
            //empty State View
            if stackCardModels.isEmpty {
                Text("Come back later we can find more matches for you!")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding(.all, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .frame(height: UIScreen.main.bounds.size.height - 200)
        .onAppear {
            stackCardModels = [
                StackCardModel(id: UUID().uuidString, name: "Park1", image: "park1"),
                StackCardModel(id: UUID().uuidString, name: "Park2", image: "park2"),
                StackCardModel(id: UUID().uuidString,name: "Park3", image: "park3"),
                StackCardModel(id: UUID().uuidString,name: "Park4", image: "park4")
            ]
        }
    }
}

#Preview {
    StackCardDemoView()
}
