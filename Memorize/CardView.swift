//
//  CardView.swift
//  Memorize
//
//  Created by DARYA on 2/26/24.
//

import SwiftUI

struct CardView: View {
    typealias Card = MemoryGame<String>.Card
    
    let card: Card
    
    init(_ card: Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: Constants.cornerRadius)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: Constants.lineWidth)
                Pie(endAngle: .degrees(240))
                    .opacity(Constants.Pie.opacity)
                    .overlay(
                        Text(card.content)
                            .font(.system(size: Constants.FontSize.largest))
                            .minimumScaleFactor(Constants.FontSize.scaleFactor)
                            .multilineTextAlignment(.center)
                            .aspectRatio(1, contentMode: .fit)
                    )
                    .padding(Constants.inset)
                
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill().opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}

private struct Constants {
    static let cornerRadius: CGFloat = 12
    static let lineWidth: CGFloat = 2
    static let inset: CGFloat = 5
    struct FontSize {
        static let largest: CGFloat = 200
        static let smallest: CGFloat = 10
        static let scaleFactor = smallest / largest
    }
    struct Pie {
        static let opacity: CGFloat = 0.4
        static let inset: CGFloat = 5
    }
}


#Preview {
    HStack {
        CardView(CardView.Card(isFaceUp: true, content: "X", id: "test1"))
        CardView(CardView.Card(content: "X", id: "test1"))
    }
    .padding()
}
