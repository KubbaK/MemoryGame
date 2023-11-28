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


 
// class MemoGameViewModel: ObservableObject {
    
//     let emojisTheme1 =  ["😃","😆","🙃","😳","😎","😮"]
//     let emojisTheme2 = ["🥕", "🍆", "🌽", "🍅","🥕", "🍆"]
//     let emojisTheme3 = ["🐶", "🐱", "🦁", "🐵", "🐘", "🦊"]
    
    
    
//     private static var emojis:[String] =  ["😃","😆","🙃","😳","😎","😮"]
    
//     private static func createMemoGameModel() -> MemoGameModel<String> {
//         return MemoGameModel<String>(numberOfPairsOfCards: emojis.count) {
//             index in
//             if emojis.indices.contains(index) {
//                 return emojis[index]
//             }else{
//                 return "??"
//             }
//         }
//     }
    
//     @Published private var model = createMemoGameModel()
    
//     var cards: Array<MemoGameModel<String>.Card> {
//         return model.cards
//     }
    
//     private static func setEmojis(newEmojis: [String]){
//         emojis = newEmojis
//     }
    
//     @Published var themeColor  = Color.blue
    
//     func changeTheme(theme: String){
//         if(theme == "Motyw 2"){
//             self.themeColor = Color.red
//             MemoGameViewModel.setEmojis(newEmojis: emojisTheme2)
//             model = MemoGameViewModel.createMemoGameModel()
//             shuffle()
//         }
//         else if(theme == "Motyw 3"){
//             self.themeColor = Color.green
//             MemoGameViewModel.setEmojis(newEmojis: emojisTheme3)
//             model = MemoGameViewModel.createMemoGameModel()
//             shuffle()
//         }
//         else{
//             self.themeColor = Color.blue
//             MemoGameViewModel.setEmojis(newEmojis: emojisTheme1)
//             model = MemoGameViewModel.createMemoGameModel()
//             shuffle();
//         }
//     }
    
//     func shuffle(){
//         model.shuffle()
//     }
    
//     func choose(card: MemoGameModel<String>.Card){
//         model.choose(card)
//     }
    
// }
