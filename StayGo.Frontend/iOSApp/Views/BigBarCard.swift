import SwiftUI

struct BigCardBarView: View {
    let image: UIImage
    @State var isLiked : Bool
    @State var bar : Bar

    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 8){
                Image(uiImage: image)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    .shadow(radius: 7)
                Spacer()
                HStack(){
                    Text(bar.name)
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                    }
                    
                
                HStack(spacing: 2) {
                    var counter = 0
                    ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                        if (bar.rate>counter){
                            Image(systemName: "star")
                                .renderingMode(.template)
                                .foregroundColor(Color("PrimaryColor"))
                                .onTapGesture {
                                    counter+=1
                                }
                        }
                        else{
                            Image(systemName: "star.fill")
                                .renderingMode(.template)
                                .foregroundColor(Color("PrimaryColor"))
                                .onTapGesture {
                                    counter+=1
                                }
                        }

                    }
                    Button(action:{
                        if(isLiked){
                            isLiked=false
                        }
                        else{
                            isLiked=true
                        }
                    })
                    {
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
            .frame(width: 110)
            .padding()
            .background(Color("LightGrayColor"))
            .cornerRadius(20.0)
        }
        .padding(.trailing)
    }
}

struct BigBarCard_Previews: PreviewProvider {
    static var previews: some View {
        let bar : Bar = Bar.init()
        BigCardBarView(image: #imageLiteral(resourceName: "reco_1"), isLiked: true, bar: bar)
    }
}
