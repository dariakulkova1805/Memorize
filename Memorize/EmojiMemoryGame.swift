//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by DARYA on 2/16/24.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
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
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func shuffle() {
        model.shuffle()

    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
