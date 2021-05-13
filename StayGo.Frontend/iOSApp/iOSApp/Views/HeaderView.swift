import SwiftUI

struct HeaderView: View {
    var body: some View {
        Text("Hello, Emma")
            .font(.headline)
            .fontWeight(.medium)
            .foregroundColor(Color("GrayColor"))
        
        Text("Where do you wanna go today?")
            .font(.title)
            .fontWeight(.bold)
    }
}
