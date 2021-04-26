import SwiftUI

struct BigCardBarView: View {
    let image: UIImage
    @State var isLiked : Bool
    @State var bar : Bar
    
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 8){
                VStack(){
                    HStack(){
                        Spacer()
                        Button(action:{
                            isLiked = !isLiked
                        })
                        {
                            Image(systemName: isLiked ? "heart.fill" : "heart" )
                                .imageScale(.large)
                                .scaleEffect(1.5)
                                .foregroundColor(.red)
                        }
                        .padding(.trailing, 0)
                    }
                }
                Spacer()
                VStack(alignment: .leading, spacing: 4){
                    VStack(){
                        Text(bar.name)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        Text(bar.description)
                            .fontWeight(.light)
                            .foregroundColor(.black)
                    }
                    
                    HStack(spacing: 2) {
                        var counter = 0
                        ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                            Image(systemName: bar.rate > counter ? "star" : "star.fill")
                                .renderingMode(.template)
                                .foregroundColor(Color("PrimaryColor"))
                                .onTapGesture {
                                    counter+=1
                                }
                        }
                        
                    }
                }
                .frame(width: 189, height: 104)
                .background(
                    LinearGradient(gradient: Gradient(colors: [.white, Color(.sRGB, red: 1, green: 1, blue: 1, opacity: 0.44)]), startPoint: .leading, endPoint: .center))
                .clipShape(RoundedRectangle(cornerRadius: 15.0))
            }
            .frame(width: 209, height: 270)
            .padding()
            .background(
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            )
            .clipShape(RoundedRectangle(cornerRadius: 15.0))
            .shadow(radius: 7)
        }
        .padding(.trailing)
    }
}

struct BigBarCard_Previews: PreviewProvider {
    static var previews: some View {
        let bar : Bar = Bar.init()
        BigCardBarView(image: #imageLiteral(resourceName: "reco_1"), isLiked: true, bar: bar)
            .previewDevice("iPhone 12 Pro")
    }
}
