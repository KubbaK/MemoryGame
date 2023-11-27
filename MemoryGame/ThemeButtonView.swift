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

// struct Theme: Identifiable{
//     var id: String
//     var name: String
//     var emojis: [String]
//     var color: Color

// }

// import SwiftUI

// struct ThemeButton: View {
//     var theme: Theme
//         var action: () -> Void

//         var body: some View {
//             Button(action: action) {
//                 VStack {
//                     Image(systemName: "circle.fill") // Zastąp z odpowiednią ikoną
//                         .font(.title)
//                         .foregroundColor(theme.color)
//                     Text(theme.name)
//                         .font(.caption)
//                         .padding(.top, 2)
//                 }
//             }
//         }
// }



// import SwiftUI

// class ThemeManager: ObservableObject, Identifiable {
//     @Published var themes: [Theme] = [
//         Theme(id: "1",name: "Sunny", emojis: ["☀️", "🌻", "🕶", "🍦","☀️", "🌻", "🕶", "🍦"], color: .yellow),
//         Theme(id: "2",name: "Nocturne", emojis: ["🌜", "🦉", "🌌", "🔭","🌜", "🦉", "🌌", "🔭"], color: .gray),
//         Theme(id: "3",name: "Nature", emojis: ["🌿", "🌵", "🍄", "🐞","🌿", "🌵", "🍄", "🐞"], color: .green)
//     ]
    
//     @Published var currentTheme: Theme = Theme(id: "1",name: "Sunny", emojis: ["☀️", "🌻", "🕶", "🍦","☀️", "🌻", "🕶", "🍦","☀️", "🌻", "🕶", "🍦"],color: .yellow)
//     @Published var themeColor: Color = .blue

//     func changeTheme(to theme: Theme) {
//         currentTheme = theme
//         themeColor = theme.color
//     }
// }
