import SwiftUI

struct SmallBarCardView : View {
    @Environment(\.colorScheme) var colorScheme
    @State var bar: Bar
    
    var body: some View {
        HStack(alignment: .top){
            Image(bar.image)
                .resizable()
                .frame(width: 66, height: 66)
                .aspectRatio(1, contentMode: .fill)
                .clipShape(RoundedRectangle(cornerRadius: 10.0))

            VStack(alignment: .leading){
                VStack(alignment: .leading){
                    Text(bar.name)
                        .font(.title3)
                        .foregroundColor(colorScheme != .dark ? Color.black : Color.white)
                    Text(bar.description)
                        .font(.headline)
                        .fontWeight(.light)
                        .foregroundColor(colorScheme != .dark ? Color.black : Color.white)
                }
                
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
        }.frame(width: 327, height: 84, alignment: .leading)
    }
}

struct SmallBarCardView_Previews: PreviewProvider {
    static var previews: some View {
        let bar : Bar = Bar.init()
        SmallBarCardView(bar: bar)
            .previewDevice("iPhone 12 Pro")
    }
}
