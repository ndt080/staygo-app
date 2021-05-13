import SwiftUI
import Firebase
import GoogleSignIn

struct ProfileView: View {
    @EnvironmentObject var str: Storage
    
    func logOut(){
        do {
            GIDSignIn.sharedInstance().signOut()
            try! Auth.auth().signOut()
        }
    }
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("User info")) {
                    HStack(){
                        Text("Name: " + str.userInfo[1])
                    }
                    HStack(){
                        Text("Given name: " + str.userInfo[2])
                    }
                    HStack(){
                        Text("Email: " + str.userInfo[0])
                    }
                    HStack(){
                        Button(action: {
                            logOut()
                        }){
                            Text("Sign out")
                        }
                    }
                }
            }
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
