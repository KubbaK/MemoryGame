//
//  MemoryGameModel.swift
//  MemoryGame
//
//  Created by student on 14/11/2023.
//

import Foundation
import SwiftUI

struct MemoGameModel<CardContent : Equatable> {
    private(set) var karty : [Karta]
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int)-> CardContent){
        karty = Array<Karta>()
        for i in 0...max(2,numberOfPairsOfCards){
            let zawartosc: CardContent = cardContentFactory(i)
            karty.append(Karta(id: "\(i)a", zawartosc: zawartosc))
            karty.append(Karta(id: "\(i)a", zawartosc: zawartosc))
        }
    }
    
    mutating func choose(_ karta: Karta) {
        if let i = karty.firstIndex(where: {$0.id == karta.id}) {
            karty[i].odwrocona = true
            
        }
    }
    
    mutating func shuffle() {
        karty.shuffle()
    }
    
    struct Karta: Equatable, Identifiable{
        var id: String
        var odwrocona = false
        var pasujaca = false
        var zawartosc: CardContent
    }
}






// import Foundation

// struct MemoGameModel<CardContent> where CardContent : Equatable {
//     private (set) var karty : Array<Karta>
    
//     init(numberPairsOfCard: Int, cardContentFactory: (Int)->CardContent){
//         karty =  []
        
//         for pairIndex in 0..<max(2,numberPairsOfCard) {
//             let content = cardContentFactory(pairIndex)
//             karty.append(Karta(content: content, id: "\(pairIndex)a"))
//             karty.append(Karta(content: content, id: "\(pairIndex)b"))
//         }
//     }
    
//     private var indexOfOneAndOnlyFaceUpCard: Int? {
//             get {
//                 let allFaceUpCards = karty.indices.filter
//                 {
//                     karty[$0].isFaceUp && !karty[$0].isMatched
//                 }
//                 return allFaceUpCards.count == 1 ? allFaceUpCards.first : nil
//             }
//             set {
//                 for index in karty.indices {
//                     if(!karty[index].isMatched){
//                         karty[index].isFaceUp = (index == newValue)
//                     }
//                 }
//             }
//         }
    
//     func index(of karta: Karta) -> Int {
//         return karty.firstIndex(where: {$0.id == karta.id})!
//     }
    
//     mutating func shuffle() {
//         karty.shuffle()
//     }
    
//     mutating func choose(_ karta: Karta) {
//         let sprawdzanaKarta = index(of: karta)
        
        
//         if !karty[sprawdzanaKarta].isFaceUp, !karty[sprawdzanaKarta].isMatched  {
//         if let potentialMatchIndex = indexOfOneAndOnlyFaceUpCard {
     
//             if karty[sprawdzanaKarta].content == karty[potentialMatchIndex].content {
//                 karty[sprawdzanaKarta].isMatched = true
//                 karty[potentialMatchIndex].isMatched = true
//             }
//             karty[sprawdzanaKarta].isFaceUp = true
//         } else {
//             indexOfOneAndOnlyFaceUpCard = sprawdzanaKarta
//         }}else{
//             return
//         }
//     }

    
    
    
//     struct Karta: Equatable, Identifiable{
       
        
//         var isFaceUp = false
//         var isMatched = false
//         var content: CardContent
        
//         var id: String
//     }
// }

