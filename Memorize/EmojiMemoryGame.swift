//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by DARYA on 2/16/24.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["🐅", "🦓", "🦣", "🦒", "🐄", "🐑", "🐖", "🐫", "🦏", "🐈", "🐩"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame(numberOfPairsOfCards: 11) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
         model.cards
    }
    
    var color: Color {
        .orange
    }
    
    var score: Int {
        model.score
    }
    
    func shuffle() {
        model.shuffle()

    }
    
    func choose(_ card: Card) {
        model.choose(card)
    }
}
