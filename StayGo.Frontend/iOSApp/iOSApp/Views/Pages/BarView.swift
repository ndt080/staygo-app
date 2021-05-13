import SwiftUI
import SDWebImageSwiftUI

struct BarView: View {
    @State var isLiked : Bool
    @State var animated: Bool = false
    @State var bar : Bar
    
    var body: some View {
        ScrollView {
            GeometryReader { geometry in
                ZStack {
                    if geometry.frame(in: .global).minY <= 0 {
                        WebImage(url: URL(string: bar.image), isAnimating: self.$animated)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .offset(y: geometry.frame(in: .global).minY/9)
                            .clipped()
                    } else {
                        WebImage(url: URL(string: bar.image), isAnimating: self.$animated)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width, height: geometry.size.height + geometry.frame(in: .global).minY)
                            .clipped()
                            .offset(y: -geometry.frame(in: .global).minY)
                    }
                }
            }
            .frame(height: 400)
            VStack(alignment: .leading) {
                Text(bar.name)
                    .font(.custom("AvenirNext-Bold", size: 30))
                    .lineLimit(nil)
                    .padding(.top, 10)
                Text(bar.type)
                    .font(.custom("AvenirNext-Regular", size: 15))
                    .foregroundColor(.gray)
                
                HStack{
                    VStack(alignment: .leading){
                        HStack(spacing: 0){
                            ForEach(0 ..< 5) { item in
                                Image(systemName: Int(bar.rating) ?? 5 > item ? "star.fill" : "star")
                                    .renderingMode(.template)
                                    .foregroundColor(Color("PrimaryColor"))
                            }
                        }.padding(.top, 10)
                    }
                    Spacer()
                    VStack(alignment: .trailing){
                        HStack(alignment: .center){
                            Image(systemName: "dollarsign.circle.fill")
                                .renderingMode(.template)
                            Text(bar.avgPayCheck + " BYN")
                                .font(.custom("AvenirNext-Regular", size: 20))
                                .foregroundColor(.gray)
                        }.padding(.top, 10)
                    }.frame(alignment: .trailing)
                    
                }
                Text(bar.address)
                    .font(.custom("AvenirNext-Regular", size: 15))
                    .foregroundColor(.gray)
                    .padding(.top, 10)
                Text(bar.description)
                    .font(.custom("AvenirNext-Regular", size: 20))
                    .lineLimit(nil)
                    .padding(.top, 30)
            }
            .frame(width: 350)
        }
        .edgesIgnoringSafeArea(.top)
        .navigationTitle("")
    }
}
