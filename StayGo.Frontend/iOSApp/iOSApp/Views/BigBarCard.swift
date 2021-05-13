import SwiftUI
import SDWebImageSwiftUI

struct BigCardBarView: View {
    @State var isLiked : Bool
    @State var bar : Bar
    @State var animated: Bool = true
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            VStack(){
                WebImage(url: URL(string: bar.image), isAnimating: self.$animated)
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            }.frame(width: 209, height: 254)
            .clipShape(RoundedRectangle(cornerRadius: 15.0))
            .shadow(radius: 7)
            
            VStack(){
                HStack(){
                    Spacer()
                    Button(action: {
                        isLiked = !isLiked
                    })
                    {
                        Image(systemName: isLiked ? "heart.fill" : "heart" )
                            .imageScale(.large)
                            .scaleEffect(1.5)
                            .foregroundColor(.red)
                    }
                    .padding(.all, 20)
                }
                Spacer()
                VStack(alignment: .center){
                    VStack(alignment: .center){
                        Text(bar.name)
                            .font(.title3)
                            .foregroundColor(colorScheme != .dark ? Color.black : Color.white)
                        Text(bar.description)
                            .font(.caption2)
                            .fontWeight(.light)
                            .foregroundColor(colorScheme != .dark ? Color.black : Color.white)
                            .multilineTextAlignment(.center)
                    }.padding(.bottom, 3)
                    HStack(spacing: 0) {
                        ForEach(0 ..< 5) { item in
                            Image(systemName: Int(bar.rating) ?? 5 > item ? "star.fill" : "star")
                                .renderingMode(.template)
                                .foregroundColor(Color("PrimaryColor"))
                        }
                    }
                }
                .padding(.all, 10)
                .frame(width: 189, height: 104)
                .shadow(radius: 50)
                .background(BlurView(style: .systemMaterial).opacity(0.9))
                .clipShape(RoundedRectangle(cornerRadius: 15.0))
                .padding()
            }
            .frame(width: 209, height: 254)
            .clipShape(RoundedRectangle(cornerRadius: 15.0))
            .shadow(radius: 7)
        }
    }
}
