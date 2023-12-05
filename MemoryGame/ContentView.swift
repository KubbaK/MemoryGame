//
//  ContentView.swift
//  MemoryGame
//
//  Created by student on 17.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewmodel = MemoGameViewModel()
    @State var ikony = ["😎","🥹","☺️","😁","😂","😇","😡","🥰"]
    @State var ileIkon = 0
    @State var aktualnyKolor = Color.red
    @State var aktualnaIlosc = 8
    
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
        self.aktualnyKolor = k;
        self.aktualnaIlosc = q;
        self.ikony.shuffle()
    }
    
    
    var ButtonDisplay: some View {
        HStack{
            ThemeButtonView(color: Color.green, theme: "1", icon: "circle.fill").onTapGesture{
                changeTheme(k: .green, q: 8)
            }
            ThemeButtonView(color: Color.red, theme: "2", icon: "circle.fill").onTapGesture{
                changeTheme(k: .red, q: 10)
            }
            ThemeButtonView(color: Color.blue, theme: "3", icon: "circle.fill").onTapGesture{
                changeTheme(k: .blue, q: 12)
            }
        }
    }
    
    var cardDisplay: some View{
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))],spacing:0)
            {
                ForEach(0..<viewmodel.karty.count, id: \.self){ _ in
                    CardView(viewmodel.karty[i], viewmodel.kolor)
                }
            }.foregroundColor(aktualnyKolor)
            
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
        .padding()
    }
}

 

#Preview {
    ContentView()
}
















// import SwiftUI

// struct ContentView: View {
//     @ObservedObject var viewModel: MemoGameViewModel
//     var karty : some View {
//         LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0){
//             ForEach(viewModel.karty){karta in
//                 CardView(karta, viewModel)
//                     .opacity(karta.isMatched ? 0 : 1)
//                     .aspectRatio(2/3, contentMode: .fit)
//                     .padding(4)
//                     .onTapGesture {
//                         viewModel.chooseAnimated(karta: karta)
//                     }
//             }
//         }.foregroundColor(viewModel.color)
//     }
    
//     var body: some View {
//         VStack {
//             Text("Memo").font(.largeTitle)
//             ScrollView{
//                 karty
//             }
//             Button("SHUFFLE") {
//                 viewModel.shuffleModel()
//             }.foregroundColor(viewModel.color)
//             Spacer()
//             HStack{
//                 Buttons(symbol: Image(systemName: "star.fill"), text: "Motyw 1", action: {
//                             viewModel.setTheme(current: 1)}).foregroundColor(viewModel.color)
//                 Spacer()
//                 Buttons(symbol: Image(systemName:"star.fill"), text: "Motyw 2", action: {
//                             viewModel.setTheme(current: 2)}).foregroundColor(viewModel.color)
//                 Spacer()
//                 Buttons(symbol: Image(systemName: "star.fill"), text: "Motyw 3", action: {
//                             viewModel.setTheme(current: 3)}).foregroundColor(viewModel.color)
//             }
//             Spacer()
//         }
//         .padding()
//     }
// }
// struct ContentView_Previews: PreviewProvider {
//     static var previews: some View {
//         ContentView(viewModel: MemoGameViewModel())
//     }
// }
