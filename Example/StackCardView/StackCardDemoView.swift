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
    @StateObject private var buttonPublisher = StackCardButtonProperties()
    
    var body: some View {
        VStack {
            ZStack {
                if let cards = viewModel.displayingCards, !cards.isEmpty {
                    ForEach(cards.reversed()) { card in
                        StackCard(model: card, stackCardButtonPublisher: buttonPublisher) {
                            // content
                            Image(card.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        }
                        .setCardOffset(offset: viewModel.getOffset(card: card))
                        .setCardDisplayType(value: .top)
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
                } else {
                    //Empty State View
                    Text("Come back later we can find more matches for you!")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .padding(.vertical, 30)
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .frame(height: UIScreen.main.bounds.size.height - 200)
        }.onAppear {
            viewModel.displayingCards = [
                StackCardModel(id: UUID().uuidString, name: "Park1", image: "park1"),
                StackCardModel(id: UUID().uuidString, name: "Park2", image: "park2"),
                StackCardModel(id: UUID().uuidString,name: "Park3", image: "park3"),
                StackCardModel(id: UUID().uuidString,name: "Park4", image: "park4")
            ]
        }
    }
}
