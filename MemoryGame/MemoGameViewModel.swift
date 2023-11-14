//
//  MemoGameViewModel.swift
//  MemoryGame
//
//  Created by student on 14/11/2023.
//

import Foundation

class MemoGameViewModel : ObservableObject{
    @Published private(set) var model: MemoGameModel<String> = createMemoryGame()
    
    private static let ikony1 = ["🍎","🍉","🍊","🍒","🍋","🫐"]
    private static let ikony2 = ["🐱","🐷","🐻‍❄️","🐸","🐼","🦁"]
    private static let ikony3 = ["🧑‍🦰","👨‍🦰","👩‍🦰","🧑‍🦱","👦","👧"]

    private static var ikony = [""]
    
    private static func createMemoryGame() -> MemoGameModel<String>{
        return(
        MemoGameModel<String>(numberOfPairsOfCards: 8){ index in
            if (ikony.indices.contains(index)){
                return ikony[index]
            }
            else{
                return "??"
            }
        })
    }
    
}
