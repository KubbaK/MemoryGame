//
//  MemoGameViewModel.swift
//  MemoryGame
//
//  Created by student on 14/11/2023.
//

import Foundation
import SwiftUI

class MemoGameViewModel : ObservableObject{
    @Published private(set) var model: MemoGameModel<String> = createMemoryGame()
    
    private static let ikony1 = ["🍎","🍉","🍊","🍒","🍋","🫐"]
    private static let ikony2 = ["🐱","🐷","🐻‍❄️","🐸","🐼","🦁"]
    private static let ikony3 = ["🧑‍🦰","👨‍🦰","👩‍🦰","🧑‍🦱","👦","👧"]

    private static var ikonyZmienne:[String] = ["🍎","🍉","🍊","🍒","🍋","🫐"]
    
    private static func zmienIkony(noweIkony : [String]){
        ikonyZmienne = noweIkony
    }
    
    @Published var kolor  = Color.blue
    
    func wybor(schemat: String){
             if(schemat == "Motyw 1"){
                 self.kolor = Color.red
                 MemoGameViewModel.zmienIkony(noweIkony: MemoGameViewModel.ikony1)
                 model = MemoGameViewModel.createMemoryGame()
                 shuffle()
             }
             else if(schemat == "Motyw 2"){
                 self.kolor = Color.green
                 MemoGameViewModel.zmienIkony(noweIkony: MemoGameViewModel.ikony2)
                 model = MemoGameViewModel.createMemoryGame()
                 shuffle()
             }
             else{
                 self.kolor = Color.blue
                 MemoGameViewModel.zmienIkony(noweIkony: MemoGameViewModel.ikony3)
                 model = MemoGameViewModel.createMemoryGame()
                 shuffle();
             }
         }
    
    private static func createMemoryGame() -> MemoGameModel<String>{
        return MemoGameModel<String>(numberOfPairsOfCards: ikonyZmienne.count) {
            index in
            if ikonyZmienne.indices.contains(index) {
                return ikonyZmienne[index]
            }
            else{
                return "??"
            }
        }
    }

        
         func shuffle(){
             model.shuffle()
         }
        
         func choose(card: MemoGameModel<String>.Karta){
             model.choose(card)
         }
    
}


 
// import SwiftUI


// class MemoGameViewModel: ObservableObject {
//     private static let ikony1 = ["🍎","🍉","🍊","🍒","🍋","🫐","🍌"]
//     private static let ikony2 = ["🐱","🐷","🐻‍❄️","🐸","🐼","🦁","🐵"]
//     private static let ikony3 = ["🧑‍🦰","👨‍🦰","👩‍🦰","🧑‍🦱","👦","👧","👩‍🦳"]
//     public static var theme: Int = 1
//     var color: Color {
//            switch MemoGameViewModel.theme {
//            case 1:
//                return .red
//            case 2:
//                return .green
//            case 3:
//                return .blue
//            default:
//                return .clear
//            }
//        }
    
    
//     static func createMemoGame(theme: Int)  -> MemoGameModel<String> {
        
//         var arrayByTheme: [String]
//         var pairsByTheme: Int
        
//         switch theme {
//         case 2:
//             arrayByTheme = ikony2
//             pairsByTheme = 7
//         case 3:
//             arrayByTheme = ikony3
//             pairsByTheme = 6
//         default:
//             arrayByTheme = ikony1
//             pairsByTheme = 8
//         }
        
//         return MemoGameModel<String>(
//             numberPairsOfCard: pairsByTheme){index in
//                     if arrayByTheme.indices.contains(index){
//                         return arrayByTheme[index]
//                     }else{
//                         return "❓"
//                     }
//             }
//     }
    
//     @Published private var  model = MemoGameViewModel.createMemoGame(theme: MemoGameViewModel.theme)
    
    
    
    
//     var karty: Array<MemoGameModel<String>.Karta>{
//         return model.karty
//     }
    

//     func shuffleModel() {
//         withAnimation {
//             model.shuffle()
//         }
//     }
    
//     func chooseAnimated(karta: MemoGameModel<String>.Karta) {
//         withAnimation {
//             model.choose(karta)
//         }
//     }
    
    
//     func setTheme(current theme: Int) {
//         MemoGameViewModel.theme = theme
//         model = MemoGameViewModel.createMemoGame(theme: theme)
//         shuffleModel()
//     }

// }
