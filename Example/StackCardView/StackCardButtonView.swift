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

