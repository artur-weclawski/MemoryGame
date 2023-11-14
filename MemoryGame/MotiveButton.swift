//
//  MotiveButton.swift
//  MemoryGame
//
//  Created by student on 17/10/2023.
//

import SwiftUI

struct MotiveButton: View {
    
    @ObservedObject var viewModel: MemoGameViewModel
    var icon: String
    var text: String
    var color: Color

    var body: some View {
        Button(action: {
                viewModel.changeApplicationTheme(color: color)
        }){
            VStack{
                Image(systemName: icon)
                Text(text)
            }
                }.frame(width: 100, height: 40)
            .foregroundColor(color).tint(color).frame(height: 15)
    }
}

