import SwiftUI

struct HeaderView: View {
    var body: some View {
        HomeNavBar()
        
        Text("Hello, Emma")
            .font(.caption)
            .fontWeight(.medium)
            .foregroundColor(Color("GrayColor"))
        
        Text("Where do you wanna go today?")
            .font(.title)
            .fontWeight(.bold)
    }
}
