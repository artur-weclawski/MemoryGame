//
//  MotiveButton.swift
//  MemoryGame
//
//  Created by student on 17/10/2023.
//

import SwiftUI

struct MotiveButton: View {
    var icon: String
    var text: String
    @Binding var color: Color
    @Binding var icons: [String]
    var iconsToChange: [String]
    var body: some View {
        Button(action: {
            if(icon == "😀"){
                color = .blue
            }
            if(icon == "👻"){
                color = .red
            }
            if(icon == "🐵"){
                color = .green
            }
            icons = generatePairs(pairs: iconsToChange)
        }){
            VStack{
                Image(systemName: icon)
                Text(text)
            }
                }.frame(width: 100, height: 40)
            .foregroundColor(color).tint(color).frame(height: 15)
    }
}
func generatePairs(pairs: Array<String>) -> Array<String> {
    var emojiPairs : Array<String> = Array()
    
    for pair in pairs {
        emojiPairs.append(pair)
        emojiPairs.append(pair)
    }
    
    return emojiPairs.shuffled()
}
#Preview {
    MotiveButton(icon: "😀", text: "Motyw 1", color: .constant(.blue), icons:.constant(["☺️","🥹","😇","🥳","🤓","🥵","🥶","🤢"]),
        iconsToChange:(["☺️","🥹","😇","🥳","🤓","🥵","🥶","🤢"])
    )
}
