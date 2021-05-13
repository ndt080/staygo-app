import SwiftUI
import GoogleSignIn

struct SignInView: View {
    var body: some View {
        VStack{
            Text("Sign In").font(.custom("AvenirNext-Bold", size: 50))
                .lineLimit(nil)
                .padding(.bottom, 30)
            Button(action: {
                do{
                    GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.first?.rootViewController
                    GIDSignIn.sharedInstance()?.signIn()
                }
            }) {
                Text(" Sign in with Google ")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 45)
                    .background(Color.orange)
                    .clipShape(Capsule())
            }
        }.frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height, alignment: .center)
        .background(RadialGradient(gradient: Gradient(colors: [.blue, .purple]), center: .center, startRadius: 2, endRadius: 650))
        .edgesIgnoringSafeArea(.all)

    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
