//
//  ContentView.swift
//  MemoryGame
//
//  Created by student on 17/10/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: MemoGameViewModel

    var body: some View {
        VStack {
            Text("Memo").font(.largeTitle)
            ScrollView{
                CardDisplay.foregroundColor(viewModel.themeColor)
                Spacer()
                shuffleButton
            }
            
            Spacer()
            motiveButton
        }
        .padding()
        
    }
    
    var CardDisplay: some View{
        LazyVGrid(columns:[GridItem(.adaptive(minimum:85), spacing: 0)], spacing: 0){
            ForEach(viewModel.cards){
                card in CardView(card).aspectRatio(2/3, contentMode: .fit).padding(4)
                    .onTapGesture{
                        viewModel.choose(card)
                    }
            }
        }
    }
    var motiveButton: some View{
        HStack{
            MotiveButton(viewModel: viewModel, icon: "face.smiling", text: "Motyw 1", color: Color.blue)
            Spacer()
            MotiveButton(viewModel: viewModel, icon: "moon", text: "Motyw 2", color: Color.red)
            Spacer()
            MotiveButton(viewModel: viewModel, icon: "pawprint", text: "Motyw 3", color: Color.green)
        }
    }
    var shuffleButton: some View{
        Button("SHUFFLE"){
            viewModel.shuffle()
        }.foregroundColor(viewModel.themeColor)
        
    }
}
#Preview {
    ContentView(viewModel: MemoGameViewModel())
}
