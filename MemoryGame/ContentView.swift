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
