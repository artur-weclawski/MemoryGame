//
//  MemoGameModel.swift
//  MemoryGame
//
//  Created by student on 07/11/2023.
//

import Foundation
struct MemoGameModel<CardContent>{
    private var cards = Array<CardContent>()
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent){
        for i in 0..<numberOfPairsOfCards{
            cards.append(cardContentFactory(i))
            cards.append(cardContentFactory(i))
        }
    }
    func chooseCard(card: Card<CardContent>){
        
    }
}

struct Card<CardContent>{
    var id : String
    var isFacedUp : Bool
    var isMatched : Bool
    var content : CardContent
}
