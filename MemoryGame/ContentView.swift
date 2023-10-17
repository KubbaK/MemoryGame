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
    
    var addButton: some View{
        return adjustCardNumber(by: 2, symbol: "plus.circle")
    }
    
    var subButton: some View{
        adjustCardNumber(by: -2, symbol: "minus.circle")
    }
    
    var cardDisplay: some View{
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))],spacing:10)
            {
                ForEach(0..<ileIkon, id: \.self){ _ in
                    CardView(karta: ikony.randomElement()!)
                }
            }.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            
        }}
    
    var body: some View {
        HStack{
            Spacer(minLength: 25)
            VStack{
                Spacer()
                cardDisplay
                HStack{
                    addButton
                    subButton
                }
                
            }
            Spacer(minLength: 25)
        }
    }
}
    

#Preview {
    ContentView()
}
