//
//  ThemeButtonView.swift
//  MemoryGame
//
//  Created by student on 07/11/2023.
//

import SwiftUI

struct ThemeButtonView: View {
    var color : Color;
    var theme : String;
    var icon : String;
    
    var body: some View {
        VStack{
            Image(systemName: icon).font(.system(size: 50.0)).foregroundColor(color)
            Text(theme).font(.system(size: 14)).foregroundColor(color)
                 }
        }
}

#Preview {
    ThemeButtonView(color: Color.red, theme: "1", icon: "circle")
}






// import SwiftUI

// struct ButtonView : View {
//     var action: () -> Void
//     var symbol: Image
//     var text: String = ""
//     var body: some View {
//         VStack{
//             Text(symbol)
//             Text(text)
//         }.onTapGesture {
//             action()
//         }
//     }
// }
