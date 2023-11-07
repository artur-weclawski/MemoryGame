//
//  ContentView.swift
//  MemoryGame
//
//  Created by student on 17/10/2023.
//

import SwiftUI

struct ContentView: View {
    @State var icons1 : [String] = ["☺️","🥹","😇","🥳","🤓","🥵","🥶","🤢"]
    @State var icons2 : [String] = ["😈","👿","👹","👽","👾","👻","🤖","🎃"]
    @State var icons3 : [String] = ["🐵","🐸","🐝","🐢","🐡","🦋","🐃","🦖"]
    @State var icons : [String] = ["☺️","🥹","😇","🥳","🤓","🥵","🥶","🤢","☺️","🥹","😇","🥳","🤓","🥵","🥶","🤢"]
    @State var cardCount = 16
    @State var kolor : Color = .blue
    var body: some View {
        VStack {
            Text("Memo").font(.largeTitle)
            ScrollView{
                CardDisplay
            }
            Motywy
        }
        .padding()
    }
    
    var CardDisplay: some View{
        LazyVGrid(columns:[GridItem(.adaptive(minimum:80))]){
            ForEach(0..<cardCount, id: \.self){
                index in CardView(icon: icons[index], color: kolor).aspectRatio(2/3, contentMode: .fit)
            }
        }.foregroundColor(kolor)
    }
    
    func adjustCardNumber(by_offset: Int, symbol: String) -> some View{
        return Button(symbol){
            if(by_offset+cardCount >= 0 && by_offset+cardCount <= icons.count){
                cardCount += by_offset
            }
        }.frame(width: 60, height: 40).border(kolor)
    }
    var Motywy: some View{
        HStack{
            MotiveButton(icon: "face.smiling", text: "Motyw 1", color: $kolor, icons: $icons, iconsToChange: icons1)
            Spacer()
            MotiveButton(icon: "moon", text: "Motyw 2", color: $kolor, icons: $icons, iconsToChange: icons2)
            Spacer()
            MotiveButton(icon: "pawprint", text: "Motyw 3", color: $kolor, icons: $icons, iconsToChange: icons3)
        }
    }
//    var addCard: some View{
//        adjustCardNumber(by_offset: 2, symbol: "+").disabled(cardCount == icons.count)
//    }
//    var removeCard: some View{
//        adjustCardNumber(by_offset: -2, symbol: "-").disabled(cardCount < 2)
//    }
}
#Preview {
    ContentView()
}
