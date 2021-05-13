import SwiftUI
import GoogleSignIn

struct LoaderView: View {
    @EnvironmentObject var str: Storage
    
    var body: some View {
        VStack{
            Spinner()
        }.onAppear(){
            Api().getAllBars(){ data in
                str.bars = data
                for obj in data{
                    let object = LandmarkAnnotation(title: "Бар "+obj.name, coordinate: .init(latitude: Double(obj.locationX) ?? 0.0, longitude: Double(obj.locationY) ?? 0.0))
                    str.barAnnotation.append(object)
                }
                str.stateApiLoad[0] = true
                print(str.bars)
            }
            Api().getBarsbyRate(rate: 3){ data in
                str.recommendBars = data
                str.stateApiLoad[1] = true
            }
            if ((GIDSignIn.sharedInstance()?.currentUser) != nil) {
                UserSettings().userInfo = [GIDSignIn.sharedInstance()?.currentUser?.profile.email ?? "none", GIDSignIn.sharedInstance()?.currentUser?.profile.name ?? "none", GIDSignIn.sharedInstance()?.currentUser?.profile.givenName ?? "none"]
            }            
        }.frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height, alignment: .center)
        .background(RadialGradient(gradient: Gradient(colors: [.blue, .purple]), center: .center, startRadius: 2, endRadius: 650))
        .edgesIgnoringSafeArea(.all)
    }
}
