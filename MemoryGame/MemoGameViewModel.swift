//
//  MemoGameViewModel.swift
//  MemoryGame
//
//  Created by student on 14/11/2023.
//

import SwiftUI

class MemoGameViewModel : ObservableObject{
    private static var emojis = ["☺️","🥹","😇","🥳","🤓","🥵","🥶","🤢"]
       private var icons1 : [String] = ["☺️","🥹","😇","🥳","🤓","🥵","🥶","🤢"]
       private var icons2 : [String] = ["😈","👿","👹","👽","👾","👻","🤖","🎃"]
       private var icons3 : [String] = ["🐵","🐸","🐝","🐢","🐡","🦋","🐃","🦖"]
    
    @Published private var model: MemoGameModel<String> = MemoGameViewModel.createMemoGame()
    
    private static func createMemoGame() -> MemoGameModel<String>{
        MemoGameModel<String>(numberOfPairsOfCards: emojis.count){
            index in if emojis.indices.contains(index){
                return emojis[index]
            }else{
                return "??";
            }
        }
    }
    var cards: Array<MemoGameModel<String>.Card>{
        return model.cards
    }
    func shuffle(){
        model.shuffle()
    }
    func choose(_ card: MemoGameModel<String>.Card){
        return model.choose(card)
    }
    @Published var themeColor = Color.blue
    func changeApplicationTheme(color: Color){
        themeColor = color
        switch color{
            case .red: MemoGameViewModel.emojis = icons2
            case .green: MemoGameViewModel.emojis = icons3
            default: MemoGameViewModel.emojis = icons1
        }
        model = MemoGameViewModel.createMemoGame()
    }
    
}

