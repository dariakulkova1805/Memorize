//
//  MemorizeGame.swift
//  Memorize
//
//  Created by DARYA on 2/16/24.
//

import Foundation

struct MemoryGame<CardContent> {
    private (set) var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
