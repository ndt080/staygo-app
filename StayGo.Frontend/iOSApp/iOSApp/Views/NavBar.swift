import SwiftUI

struct NavBar: View {
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            HomeView().edgesIgnoringSafeArea(.all)
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            MapView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Map")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
        } .background(BlurView(style: .systemMaterial))
    }
}

struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        NavBar()
    }
}
