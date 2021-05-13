import SwiftUI
import SafariServices
import GoogleSignIn

struct ContentView: View {
    @ObservedObject var session = SessionStore()
    @EnvironmentObject var str: Storage

    var body: some View {
        if !session.isLoggedIn {
            SignInView()
        } else {
            if str.stateApiLoad[0] && str.stateApiLoad[1]{
                NavBar()
            } else {
                LoaderView()
            }
       }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
