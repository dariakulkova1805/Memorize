//
//  MemorizeApp.swift
//  Memorize
//
//  Created by DARYA on 2/15/24.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(gameMemory: game)
        }
    }
}
