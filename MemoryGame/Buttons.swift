import SwiftUI
struct Buttons : View {
    
    var symbol: Image
    var text: String = ""
    var action: () -> Void
    
    var body: some View {
        VStack{
            Text(symbol)
            Text(text)
                }.onTapGesture {
            action()}
    }
}
