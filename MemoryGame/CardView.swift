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

// struct CardView : View {
//     var karta: MemoGameModel<String>.Karta
//     var viewModel: MemoGameViewModel
    
//     init(_ karta: MemoGameModel<String>.Karta, _ viewModel: MemoGameViewModel) {
//         self.karta  = karta
//         self.viewModel = viewModel
//     }
    
    
//     var body: some View {
//         let rectangle = RoundedRectangle(cornerRadius: 12)
//         ZStack {
//                 rectangle
//                 .fill(karta.isFaceUp ? Color.white : viewModel.color)
//                 .overlay(
//                     rectangle
//                         .strokeBorder(lineWidth: 3)
//                         .opacity(karta.isFaceUp ? 1 : 0)
//                 )
//                 .overlay(
//                     Text(karta.content)
//                         .font(.system(size: 200))
//                         .minimumScaleFactor(0.01)
//                         .aspectRatio(1, contentMode: .fit)
//                         .opacity(karta.isFaceUp ? 1 : 0)

//                 )
//         }
//         .onTapGesture {
//             viewModel.chooseWithAnimation(karta: karta)
//         }
        
//     }
// }






//                        .rotation3DEffect(
//                            .degrees(karta.isFaceUp ? 0 : 180),
//                            axis: (x: 0.0, y: 1.0, z: 0.0)
//                        )


