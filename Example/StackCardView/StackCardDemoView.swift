//
//  StackCardDemoView.swift
//  StackCardView_Example
//
//  Created by Rani Badri on 1/29/24.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

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
    
    @StateObject var viewModel = StackCardViewModel<StackCardModel>()
    
    var body: some View {
        VStack {
            /// iterate over the list of cards
            ForEach(viewModel.displayingCards?.reversed() ?? [], id: \.id) { card in
                StackCard(model: card) {
                    // content
                    Image(card.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                .setCardOffset(offset: viewModel.getOffset(card: card))
                .setCardDisplayType(value: .bottom)
                .setRotationAngle(value: 20)
                .onRightSwipe {
                    print("Right Swipe \(card.id)")
                    viewModel.removeCard()
                }
                .onLeftSwipe {
                    print("left Swipe \(card.id)")
                    viewModel.removeCard()
                }
            }
            .embedInZStack()
            
            //empty State View
            if viewModel.displayingCards?.isEmpty ?? true {
                Text("Come back later we can find more matches for you!")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding(.all, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .frame(height: UIScreen.main.bounds.size.height - 200)
        .onAppear {
            viewModel.displayingCards = [
                StackCardModel(id: UUID().uuidString, name: "Park1", image: "park1"),
                StackCardModel(id: UUID().uuidString, name: "Park2", image: "park2"),
                StackCardModel(id: UUID().uuidString,name: "Park3", image: "park3"),
                StackCardModel(id: UUID().uuidString,name: "Park4", image: "park4")
            ]
        }
    }
}
