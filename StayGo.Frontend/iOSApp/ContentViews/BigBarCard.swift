import SwiftUI
import SafariServices

struct BigCardBarView: View {
    let image: UIImage
    @State var showSafari = false
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 8){
                Image (uiImage: #imageLiteral(resourceName: "like")
                )
                .padding(.bottom,90)
                HStack{
                    Text("Bar")
                    Button(action: {
                        // update the URL if you'd like to
                        
                        // tell the app that we want to show the Safari VC
                        if(self.showSafari == false){
                            self.showSafari = true
                        }
                        else {
                            self.showSafari = false
                        }
                        
                    } ){
                        Text("Learn more")
                    }
                    .sheet(isPresented: $showSafari) {
                        SafariView(url:URL(string: "https://pornhub.com")!)
                    }
                }
                    .font(.caption)
                    .foregroundColor(Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)))
                Text("Bar")
                    .fontWeight(.medium)
                HStack(spacing: 2) {
                    ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                        Image(uiImage: #imageLiteral(resourceName: "star"))
                            .renderingMode(.template)
                            .foregroundColor(Color("PrimaryColor"))
                    }
                }
            }
            .frame(width: 110)
            .padding()
            .background(Color("LightGrayColor"))
            .cornerRadius(20.0)
            //Image
            Image(uiImage: image)
                .offset(x:4,y:-25)
            
        }
        .padding(.trailing)
    }
    struct SafariView: UIViewControllerRepresentable {

        let url: URL

        func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
            return SFSafariViewController(url: url)
        }

        func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {

        }

    }
}


