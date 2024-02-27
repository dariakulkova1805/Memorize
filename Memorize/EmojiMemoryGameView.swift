//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by DARYA on 2/15/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    typealias Card = MemoryGame<String>.Card
    
    @ObservedObject var gameMemory: EmojiMemoryGame
    
    private let aspectRatio: CGFloat = 2/3
    private let spacing: CGFloat = 4
    
    var body: some View {
        VStack {
            cards
                .foregroundColor(gameMemory.color)
            HStack {
                score
                Spacer()
                shuffle
            }
            .font(.largeTitle)
        }
        .padding()
    }
    
    private var score: some View {
        Text("Score \(gameMemory.score)")
            .animation(nil)
    }
    
    private var shuffle: some View{
        Button("Shuffle") {
            withAnimation {
                gameMemory.shuffle()
            }
        }
    }
    
    private var cards: some View {
        AspectVGrid(items: gameMemory.cards, aspectRatio: aspectRatio) { card in
            CardView(card)
                .padding(spacing)
                .overlay(FlyingNumber(number: scoreChange(causedBy: card)))
                .zIndex(scoreChange(causedBy: card) != 0 ? 1 : 0)
                .onTapGesture {
                   choose(card)
                }
        }
    }
    
    private func choose(_ card: Card) {
        withAnimation {
            let scoreBeforeChoosing = gameMemory.score
            gameMemory.choose(card)
            let scoreChange = gameMemory.score - scoreBeforeChoosing
            lastScoreChange = (scoreChange, causedByCardId: card.id)
        }
    }
    
    @State private var lastScoreChange = (0, causedByCardId: "")
    
    private func scoreChange(causedBy card: Card) -> Int {
        let (amount, id) = lastScoreChange
        return card.id == id ? amount : 0
    }
}


#Preview {
    EmojiMemoryGameView(gameMemory: EmojiMemoryGame())
}
