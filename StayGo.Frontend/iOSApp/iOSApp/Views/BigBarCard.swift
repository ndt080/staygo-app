import SwiftUI

struct BigCardBarView: View {
    @State var isLiked : Bool
    @State var bar : Bar
    
    var body: some View {
        ZStack {
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
                Spacer()
                VStack(alignment: .center){
                    VStack(alignment: .center){
                        Text(bar.name)
                            .font(.title3)
                            .foregroundColor(.black)
                        Text(bar.description)
                            .font(.caption2)
                            .fontWeight(.light)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                    }.padding(.bottom, 3)
                    HStack(spacing: 0) {
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
                .padding(.all, 10)
                .frame(width: 189, height: 104)
                .shadow(radius: 50)
                .background(
                    LinearGradient(gradient: Gradient(colors: [.white, Color(.sRGB, red: 1, green: 1, blue: 1, opacity: 0.85)]), startPoint: .leading, endPoint: .trailing))
                .clipShape(RoundedRectangle(cornerRadius: 15.0))
            }
            .frame(width: 209, height: 254)
            .padding()
            .background(
                Image(bar.image)
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
        BigCardBarView(isLiked: true, bar: bar)
            .previewDevice("iPhone 12 Pro")
    }
}
