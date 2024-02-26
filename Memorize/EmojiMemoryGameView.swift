//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by DARYA on 2/15/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var gameMemory: EmojiMemoryGame
    
    private let aspectRatio: CGFloat = 2/3
    private let spacing: CGFloat = 4
    
    var body: some View {
        VStack {
                cards
                    .animation(.default, value: gameMemory.cards)
            Button("Shuffle") {
                gameMemory.shuffle()
            }
        }
        .padding()
    }
    
    private var cards: some View {
        AspectVGrid(items: gameMemory.cards, aspectRatio: aspectRatio) { card in
            CardView(card)
                .padding(spacing)
                .onTapGesture {
                    gameMemory.choose(card)
                }
        }
        .foregroundColor(.orange)
    }
}


#Preview {
    EmojiMemoryGameView(gameMemory: EmojiMemoryGame())
}
