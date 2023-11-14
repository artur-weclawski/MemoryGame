//
//  MemoGameModel.swift
//  MemoryGame
//
//  Created by student on 07/11/2023.
//

import Foundation
struct MemoGameModel<CardContent> where CardContent : Equatable{
    public var cards: Array<Card>
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent){
        cards = []
        for i in 0..<max(2,numberOfPairsOfCards){
            let content = cardContentFactory(i)
            cards.append(Card(content: content, id: "\(i)a"))
            cards.append(Card(content: content, id: "\(i)b"))
        }
    }
    mutating func chooseCard(_ card: Card){
        if let i = cards.firstIndex(where: {$0.id == card.id}){
            cards[i].isFacedUp.toggle()
        }
    }
    
    mutating func shuffle(){
        cards.shuffle()
    }
    struct Card : Equatable, Identifiable{
        var isFacedUp : Bool = false
        var isMatched : Bool = false
        var content : CardContent
        var id : String
    }
}


