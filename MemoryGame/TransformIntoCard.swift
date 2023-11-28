//
//  TransformIntoCard.swift
//  MemoryGame
//
//  Created by student on 28/11/2023.
//

import SwiftUI

struct TransformIntoCard: ViewModifier, Animatable {
    init(isFacedUp: Bool){
        rotation = isFacedUp ? 0 : 180
    }
    var isFacedUp: Bool{
        rotation < 90
    }
    var rotation: Double
    var animatableData: Double{
        get{rotation}
        set{rotation = newValue}
    }
    
    func body(content: Content) -> some View {
        let base = RoundedRectangle(cornerRadius: 12)
        Group{
            base.fill(.white)
            base.strokeBorder(lineWidth: 2)
                .overlay(content)
                .opacity(isFacedUp ? 1 : 0)
            base.fill()
                .opacity(isFacedUp ? 0 : 1)
        }.rotation3DEffect(
            .degrees(rotation),
                                  axis: (x: 0.0, y: 1.0, z: 0.0)
        )
    }
}

extension View{
    func transformIntoCard(isFacedUp: Bool) -> some View{
        modifier(TransformIntoCard(isFacedUp: isFacedUp))
    }
}
