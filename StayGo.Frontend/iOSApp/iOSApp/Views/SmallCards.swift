import SwiftUI
struct SmallCardBarView : View {
    let image: UIImage
    @State var isLiked : Bool
    @State var bar : Bar
    var body: some View {
        HStack{
            Image(uiImage: image)
                .aspectRatio(1, contentMode: .fill)
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
                .shadow(radius: 8)
            VStack(alignment: .leading, spacing: 4)
            {
                Text(bar.name)
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                HStack(spacing: 2) {
                    ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                        Image(systemName: "star")
                            .renderingMode(.template)
                            .foregroundColor(Color("PrimaryColor"))
                    }
                    Button(action:{
                        isLiked = !isLiked
                    }){
                        if(isLiked){
                            Image(systemName: "heart.fill")
                                .imageScale(.large)
                                .foregroundColor(.red)
                        }
                        else{
                            Image(systemName: "heart")
                                .imageScale(.large)
                                .foregroundColor(.red)
                        }
                    }
                }
                
            }
        }
        .padding()
        .frame(width: 327, height: 104)
        .background(Color("LightGrayColor"))
        .cornerRadius(18.0)
    }
}
