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
