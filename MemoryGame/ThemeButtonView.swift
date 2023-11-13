//
//  ThemeButtonView.swift
//  MemoryGame
//
//  Created by student on 07/11/2023.
//

import SwiftUI

struct ThemeButtonView: View {
    var color : Color;
    var theme : Int;
    var icon : String
    @Binding var cardColor: Color
    @Binding var iconQuantity: Int
    
    var body: some View {
        Button(action: {cardColor = color}, label: {
            VStack{
                Image(systemName: icon).foregroundColor(color)
                Text("Temat nr \(theme)").fontWeight(.semibold).font(.system(size: 15)).foregroundColor(color)
            }
            
        })
        
    }
}

#Preview {
    ThemeButtonView(color: Color.red, theme: 1, icon: "circle", cardColor: .constant(Color.red), iconQuantity: .constant(8))
}






// import SwiftUI

// struct ThemeButton: View {
//     var content: String
//     var color: Color
//     var icon: String
    
//     var body: some View {
//         VStack{
//             Image(systemName: icon)
//                 .font(.system(size: 50.0))
//                 .foregroundColor(color)
//             Text(content)
//                 .font(.system(size: 14))
//                 .foregroundColor(color)
//         }
//     }
// }

// #Preview {
//     ThemeButton(content: "Motyw 1", color: .red, icon: "pencil.circle")
// }
