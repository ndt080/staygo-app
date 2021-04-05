import SwiftUI
struct SmallCardBarView : View {
    let image: UIImage
    let title: String
    var body: some View {
        HStack{
            Image(uiImage: image)
                .aspectRatio(1, contentMode: .fill)
            VStack(alignment: .leading, spacing: 4)
            {
                Text("Bar")
                    .font(.caption)
                    .foregroundColor(Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)))
                Text(title)
                    .fontWeight(.medium)
                HStack(spacing: 2) {
                    ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                        Image(uiImage: #imageLiteral(resourceName: "star"))
                            .renderingMode(.template)
                            .foregroundColor(Color("PrimaryColor"))
                    }
                }
                
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color("LightGrayColor"))
        .cornerRadius(18.0)
    }
   
    
}
