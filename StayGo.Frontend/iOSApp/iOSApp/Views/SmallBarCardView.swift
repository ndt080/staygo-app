import SwiftUI
import SDWebImageSwiftUI

struct SmallBarCardView : View {
    var image: String
    var title: String
    var type: String
    var price: Double
    @State var animated: Bool = false
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        HStack(alignment: .center){
            WebImage(url: URL(string: image), isAnimating: self.$animated)
                .resizable()
                .frame(width: 86, height: 66)
                .aspectRatio(1, contentMode: .fill)
                .clipShape(RoundedRectangle(cornerRadius: 10.0))

            VStack(alignment: .leading){
                VStack(alignment: .leading){
                    Text(title)
                        .font(.title3)
                        .foregroundColor(colorScheme != .dark ? Color.black : Color.white)
                    Text(type)
                        .font(.headline)
                        .fontWeight(.light)
                        .foregroundColor(colorScheme != .dark ? Color.black : Color.white)
                }
            }.padding(.leading, 10)
            VStack{
                HStack(alignment: .center){
                    Image(systemName: "arrow.right")
                        .foregroundColor(colorScheme != .dark ? Color.black : Color.white)
                }
                .padding(.all, 10)
                .background(colorScheme == .dark ? BlurView(style: .systemMaterial) : nil)
                .background(colorScheme == .light ? Color.gray.opacity(0.1) : nil)
                .shadow(radius: 10)
                .cornerRadius(10)
            }
            .padding(.leading, 10)
                
        }.padding(.all, 10)
        .frame(maxWidth: .infinity, maxHeight: 104, alignment: .center)
        .background(BlurView(style: .systemMaterial))
        .cornerRadius(10)
    }
    

//
//    var body: some View {
//        HStack(alignment: .center) {
//            Image(image)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 100)
//                .cornerRadius(10)
//                .padding(.all, 15)
//
//            VStack(alignment: .leading) {
//                Text(title)
//                    .font(.system(size: 26, weight: .bold, design: .default))
//                    .foregroundColor(.gray)
//                Text(type)
//                    .font(.subheadline)
//                    .foregroundColor(.gray)
//            }.padding(.trailing, 15)
//            .padding(.vertical, 15)
//        }
//        .frame(maxWidth: .infinity, maxHeight: 100, alignment: .center)
//        .background(BlurView(style: .systemMaterial))

//        .padding(.all, 10)
//    }
}
