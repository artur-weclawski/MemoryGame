//
//  CardView.swift
//  MemoryGame
//
//  Created by student on 17/10/2023.
//

import SwiftUI

struct CardView: View {
    var card: MemoGameModel<String>.Card
    init(_ card: MemoGameModel<String>.Card){
        self.card = card
    }
        var body: some View {
            CirclePart(endAngle: .degrees(300))
                .overlay{
                    Text(card.content)
                        .font(.system(size: 200))
                        .minimumScaleFactor(0.01)
                        .aspectRatio(contentMode: .fit)
                        .padding(5)
                        .rotationEffect(.degrees(card.isMatched ? 360 : 0))
                        .animation(.spin(duration:2), value: card.isMatched)
                }
                .padding(4)
                .cardify(isFacedUp: card.isFacedUp)
                .opacity(card.isFacedUp || !card.isMatched ? 1: 0)
        }
}
extension Animation{
    static func spin(duration: TimeInterval) -> Animation{
        .linear(duration: 2).repeatForever(autoreverses: false)
    }
}
//#Preview {
////    CardView(state: true, icon: "☺️", color: .blue)
//}
