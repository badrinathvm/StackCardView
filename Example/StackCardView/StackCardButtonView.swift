//
//  StackCardWithButtonsView.swift
//  StackCardView_Example
//
//  Created by Rani Badri on 1/31/24.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import Foundation
import SwiftUI
import StackCardView

struct StackCardButtonView: View {
    @State private var stackCardModels: [StackCardModel] = []
    @Environment(\.swipeCard) private var swipeCard
    
    var body: some View {
        VStack {
            ZStack {
                /// iterate over the list of cards
                StackCard($stackCardModels) { card in
                    Image(card.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
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
            
            
            HStack {
                Button(action: {
                    swipeCard?(.left)
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
                    swipeCard?(.right)
                } label: {
                    Text("Mark As read")
                        .foregroundColor(.black)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                }
            }
            .padding(.all, 10)
            .padding(.top, 30)
        }
        .padding(.all, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .frame(height: UIScreen.main.bounds.size.height - 100)
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

