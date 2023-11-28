//
//  CardView.swift
//  MemoryGame
//
//  Created by student on 17.10.2023.
//

import Foundation
import SwiftUI

struct CardView: View {
    @State var czyOdkryta = false
    var karta: MemoGameModel<String>.Karta
    var kolor: Color
        
    init(_ karta :MemoGameModel<String>.Karta, _ kolor: Color) {
             self.karta = karta
             self.kolor = kolor
        }
    var body: some View {
             ZStack{
                 let base = RoundedRectangle(cornerRadius: 12)
                 Group {
                     base.fill(Color.white)
                     base.strokeBorder(lineWidth: 3)
                     Text(karta.zawartosc).font(.system(size: 200))
                         .minimumScaleFactor(0.01)
                         .aspectRatio(1,contentMode: .fit)
                        
                 }.opacity(karta.odwrocona ? 1 : 0)
                 base.fill().opacity(karta.odwrocona ? 0 : 1)
                 }
             .opacity(karta.odwrocona || !karta.pasujaca ? 1 : 0)
             .foregroundColor(kolor)
            
         }
}








// import SwiftUI

// struct CardView: View {
//     var card: MemoGameModel<String>.Card
//     var color: Color
//     init(_ card:MemoGameModel<String>.Card, _ color: Color) {
//         self.card = card
//         self.color = color
//     }
//     var body: some View {
//         ZStack{
//             let base = RoundedRectangle(cornerRadius: 12)
//             Group {
//                 base.fill(Color.white)
//                 base.strokeBorder(lineWidth: 3)
//                 Text(card.content).font(.system(size: 200))
//                     .minimumScaleFactor(0.01)
//                     .aspectRatio(1,contentMode: .fit)
                    
//             }.opacity(card.isFaceUp ? 1 : 0)
//             base.fill().opacity(card.isFaceUp ? 0 : 1)
//             }
//         .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
//         .foregroundColor(color)
        
//     }
// }
