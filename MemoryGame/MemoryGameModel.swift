//
//  MemoryGameModel.swift
//  MemoryGame
//
//  Created by student on 14/11/2023.
//

import Foundation

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
    func wybor(karta: Karta){
        
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
