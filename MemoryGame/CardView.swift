//
//  CardView.swift
//  MemoryGame
//
//  Created by student on 17.10.2023.
//

import Foundation
import SwiftUI

struct CardView: View {
    @State var czyOdkryta = false
    var karta: String
    var body: some View {
        
        Group{
            if(czyOdkryta == false){
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.blue)
                        .stroke(Color.blue, lineWidth: 3)
                        .font(.largeTitle)
                        .frame(height:100)
                        .onTapGesture {
                            czyOdkryta = !czyOdkryta
                        }

            }
        else{
            ZStack{
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white)
                    .stroke(Color.blue, lineWidth: 3)
                    .font(.largeTitle)
                    .frame(height:100)
                    .onTapGesture {
                        czyOdkryta = !czyOdkryta
                    }
                Text(karta)
            }
        }
        }.opacity(czyOdkryta ? 2 : 1)
    }
}

#Preview {
    CardView(karta: "😁")
}
