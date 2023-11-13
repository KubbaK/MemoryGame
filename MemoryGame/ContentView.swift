//
//  ContentView.swift
//  MemoryGame
//
//  Created by student on 17.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var ikony = ["😎","🥹","☺️","😁","😂","😇","😡","🥰"]
    @State var ileIkon = 0
    @State var kolory = Color.red
    @State var iconQuantity = 8
    
    func adjustCardNumber(by offset: Int, symbol: String) -> some View{
        let noweIkony = ileIkon + offset
            if (noweIkony >= 2 && noweIkony <= ikony.count) {
                return Button(action:
                        {ileIkon = noweIkony}
                ){Image(systemName: symbol)}
            }
            else{
                 return Button(action:{}){
                    Image(systemName: symbol)
                }
            }
    }
    
//    var addButton: some View{
//        return adjustCardNumber(by: 2, symbol: "plus.circle")
//    }
//    
//    var subButton: some View{
//        adjustCardNumber(by: -2, symbol: "minus.circle")
//    }
    
    func changeTheme(k : Color,q: Int) {
        kolory = k;
        iconQuantity = q;
    }
    
    
    var ButtonDisplay: some View {
        HStack{
            ThemeButtonView(color: Color.red, theme: 1, icon: "circle.fill", cardColor: .constant(Color.red), iconQuantity: .constant(8)).onTapGesture{
                changeTheme(k: .red, q: 8)
            }
            ThemeButtonView(color: Color.blue, theme: 2, icon: "circle", cardColor: .constant(Color.blue), iconQuantity: .constant(10)).onTapGesture{
                changeTheme(k: .blue, q: 10)
            }
            ThemeButtonView(color: Color.green, theme: 3, icon: "circle.fill", cardColor: .constant(Color.green), iconQuantity: .constant(12)).onTapGesture{
                changeTheme(k: .green, q: 12)
            }
        }
    }
    
    var cardDisplay: some View{
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))],spacing:10)
            {
                ForEach(0..<iconQuantity, id: \.self){ _ in
                    CardView(karta: ikony.randomElement()!).aspectRatio(2/3, contentMode: .fit)
                }
            }.foregroundColor(kolory)
            
        }}
    
    var body: some View {
        VStack{
            Text("Memo").font(.largeTitle)
            Spacer(minLength: 40)
            HStack{
                Spacer(minLength: 25)
                VStack{
                    Spacer()
                    cardDisplay
//                    HStack{
//                        addButton
//                        subButton
//                    }
                    ButtonDisplay
                    
                }
                Spacer(minLength: 25)
            }
        }
        
    }
}

 

#Preview {
    ContentView()
}


















// import SwiftUI


// struct ContentView: View {
//     @State private var cardContents =
//     ["😀", "🐶", "🌞", "🚀", "😂", "😎", "🤓", "⚽️", "🏀", "🏈", "🥎", "⚾️"]
//     @State private var cardsToDisplay =
//     ["😀", "🐶", "🌞", "🚀", "😂", "😎", "🤓", "⚽️", "🏀", "🏈", "🥎", "⚾️"]
//     @State private var numberOfCards = 8
//     @State private var actualTheme = Color.green
    
//     func adjustCardNumber(offset: Int, symbol: String) -> some View {
//         let newNumberOfCards = numberOfCards + offset
        
//         return Group {
//             if newNumberOfCards >= 2 && newNumberOfCards <= cardContents.count {
//                 Button(action: {
//                     numberOfCards = newNumberOfCards
//                 }) {
//                     Image(systemName: symbol)
//                 }
//             } else {
//                 Button(action: {}) {
//                     Image(systemName: symbol)
//                         .foregroundColor(.gray)
//                 }
//                 .disabled(true)
//             }
//         }
//     }
    
//     /*
//     var addCards: some View {
//         return adjustCardNumber(offset: 2, symbol: "plus.rectangle")
//     }
    
//     var removeCards: some View {
//         return adjustCardNumber(offset: -2, symbol: "minus.rectangle")
//     }
//     */
    
//     var cardDisplay: some View {
//         ScrollView {
//             LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], spacing: 20) {
//                 ForEach(0..<numberOfCards, id: \.self) { i in
//                     CardView(content: cardsToDisplay[i], themeColor: actualTheme).aspectRatio(0.63, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
//                 }
//             }
//             .foregroundColor(actualTheme)
//             .padding()
//         }
//     }
    
//     var themeButtonsDisplay: some View {
//         HStack {
//             Spacer()
//             ThemeButton(content: "Motyw 1", color: .blue, icon: "checkmark.circle.fill").onTapGesture {
//                 switchTheme(cardsNum: 12, color: .blue)
//             }
//             Spacer()
//             ThemeButton(content: "Motyw 2", color: .red, icon: "checkmark.circle.fill").onTapGesture {
//                 switchTheme(cardsNum: 10, color: .red)
//             }
//             Spacer()
//             ThemeButton(content: "Motyw 3", color: .green, icon: "checkmark.circle.fill").onTapGesture {
//                 switchTheme(cardsNum: 8, color: .green)
//             }
//             Spacer()
//         }
//     }
    
//     func switchTheme(cardsNum: Int, color: Color){
//         self.numberOfCards = cardsNum
//         self.actualTheme = color
//         self.cardsToDisplay = updateCardsToDisplay()
//         shuffleCards()
//     }
    
//     func shuffleCards(){
//         self.cardContents.shuffle()
//     }
    
//     func updateCardsToDisplay() -> [String] {
//         var updatedCardsToDisplay = [String]()
//         for i in 0..<(numberOfCards / 2) {
//             let emoji = cardContents[i % cardContents.count]
//             updatedCardsToDisplay.append(emoji)
//             updatedCardsToDisplay.append(emoji)
//         }
//         return updatedCardsToDisplay.shuffled()
//     }
    
//     var body: some View {
//         VStack {
//             Text("Memo").font(.largeTitle)
//             cardDisplay
//             Spacer()
//             themeButtonsDisplay
            
            
//             /*
//             HStack {
//                 Spacer()
//                 removeCards
//                     .padding(.trailing, 300)
//                 Spacer()
//                 addCards
//                 Spacer()
//             }
//             */
//         }
//     }
// }

// #Preview {
//     ContentView()
// }
