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






//
//import Foundation
//
//struct MemoGameModel where CardContent : Equatable {
//
//    private(set) var cards: Array
//    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
//        cards=[]
//        for pair in 0.. let content = cardContentFactory(pair)
//                cards.append(Card(id:"\(pair+1)a", content: content))
//                cards.append(Card(id:"\(pair+1)b",content: content))
//    }
//}
//
//
//mutating func choose(_ card: Card) {
//    if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}) {
//
//        cards[chosenIndex].isFaceUp = true
//
//    }
//}
//
//private func index(of card: Card) -> Int? {
//    for index in cards.indices {
//        if cards[index].id == card.id {
//            return index
//        }
//    }
//    return nil
//}
//
//mutating func shuffle(){
//    cards.shuffle()
//}
//
//
//struct Card : Equatable, Identifiable {
//
//    var id: String
//    var isFaceUp: Bool = false
//    var isMatched: Bool = false
//    var content: CardContent
//}
//
//}
//
//extension Array {
//    var only: Element? {
//        count == 1 ? first :nil
//    }
//}
