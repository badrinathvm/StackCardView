import Foundation
import SwiftUI
import StackCardView

//Step 1:

// create a model make sure it corresponds to `StackCardModelProtocol`
struct StackCardModel: StackCardModelProtocol, Identifiable {
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
    @State private var stackCardModels:[StackCardModel] = []
    @StateObject private var viewModel = StackCardViewModel<StackCardModel>()
    @StateObject private var stackCardButtonPublisher = StackCardButtonPublisher()
    
    var body: some View {
        VStack {
            /// iterate over the list of cards
            ForEach(stackCardModels.reversed(), id: \.id) { card in
                StackCard(model: card, viewModel: viewModel, stackCardButtonPublisher: stackCardButtonPublisher) {
                    // content
                    Image(card.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                .setCardDisplayType(value: .bottom)
                .setRotationAngle(value: 20)
                .onRightSwipe {
                    print("Right Swipe \(card.id)")
                }
                .onLeftSwipe {
                    print("left Swipe \(card.id)")
                }
                .onLeftButtonTap {
                    print("Left Button Tap \(card.id)")
                }
                .onRightButtonTap {
                    print("Right Button Tap \(card.id)")
                }
            }
            .embedInZStack()
            .bind(model: stackCardModels)
            
            //empty State View
            if viewModel.displayingCards?.isEmpty ?? false {
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
        
        
        HStack {
            Button(action: {
                stackCardButtonPublisher.setDirection(direction: StackCardDirection.left)
            }, label: {
                Text("Keep Unread")
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(Color.black)
                    .cornerRadius(8)
                
            })
            
            Spacer()
            
            Button {
                stackCardButtonPublisher.setDirection(direction: StackCardDirection.right)
            } label: {
                Text("Mark As read")
                    .foregroundColor(.black)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
            }
        }
        .padding(.horizontal, 40)
        .padding(.top)
    }
}
