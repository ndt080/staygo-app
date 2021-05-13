import SwiftUI

struct HeaderView: View {
    @EnvironmentObject var str: Storage
    
    var body: some View {
        Text("Hello, " + str.userInfo[1])
            .font(.headline)
            .fontWeight(.medium)
            .foregroundColor(Color("GrayColor"))
        
        Text("Where do you wanna go today?")
            .font(.title)
            .fontWeight(.bold)
    }
}
