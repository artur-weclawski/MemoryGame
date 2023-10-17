//
//  ContentView.swift
//  MemoryGame
//
//  Created by student on 17/10/2023.
//

import SwiftUI

struct ContentView: View {
    let icons : [String] = ["☺️","🥹","😇","🥳","🤓","🥵","🥶","👻","🎃","🤢"]
    @State var cardCount = 2
    var body: some View {
        VStack {
            ScrollView{
                CardDisplay
            }
            HStack{
                removeCard
                Spacer()
                addCard
            }
        }
        .padding()
    }
    
    
    
    var CardDisplay: some View{
        LazyVGrid(columns:[GridItem(.adaptive(minimum:120))]){
            ForEach(0..<cardCount, id: \.self){
                index in CardView(icon: icons[index]).aspectRatio(4/1, contentMode: .fit)
            }
        }.foregroundColor(.blue)
    }
    func adjustCardNumber(by_offset: Int, symbol: String) -> some View{
        return Button(symbol){
            if(by_offset+cardCount >= 0 && by_offset+cardCount <= icons.count){
                cardCount += by_offset
            }
        }.frame(width: 60, height: 40).border(.blue)
    }
    var addCard: some View{
        adjustCardNumber(by_offset: 2, symbol: "+").disabled(cardCount == icons.count)
    }
    var removeCard: some View{
        adjustCardNumber(by_offset: -2, symbol: "-").disabled(cardCount < 2)
    }
}


#Preview {
    ContentView()
}
