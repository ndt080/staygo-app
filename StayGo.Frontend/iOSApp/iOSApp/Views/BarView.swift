import SwiftUI

struct BarView: View {
    @State var isLiked : Bool
    @State var bar : Bar
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(){
                    VStack(alignment: .leading){
                        HStack(spacing: 0){
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
     
                        Text(bar.name)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color.black)
                        Text(bar.address)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(UIColor.systemGray))
                    }
                    .padding(.all, 20)
                    .frame(width: 327, height: 109, alignment: .leading)
                    .shadow(radius: 50)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [.white, Color(.sRGB, red: 1, green: 1, blue: 1, opacity: 0.75)]), startPoint: .leading, endPoint: .trailing))
                    .clipShape(RoundedRectangle(cornerRadius: 15.0))
                    .padding(.bottom, 100)
  
                    Spacer()
                    
                    HStack(alignment: .center){
                        Image(systemName: "dollarsign.circle")
                            .resizable()
                            .frame(width: 33, height: 33, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.yellow)
                        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                            Text(String(bar.avgCheck) + " BYN")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.black)
                            Text(String("в среднем"))
                                .font(.callout)
                                .fontWeight(.semibold)
                                .foregroundColor(Color(UIColor.systemGray))
                        }

                    }
                    .padding(.horizontal, 20)
                    .frame(width: 327, height: 79, alignment: .leading)
                    .shadow(radius: 50)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [.white, Color(.sRGB, red: 1, green: 1, blue: 1, opacity: 0.75)]), startPoint: .leading, endPoint: .trailing))
                    .clipShape(RoundedRectangle(cornerRadius: 15.0))
                    .padding(.bottom, 20)
                    
                    VStack(alignment: .leading){
                        Text(bar.description)
                            .font(.body)
                            .fontWeight(.light)
                            .foregroundColor(Color.black)
                    }
                    .padding(.all, 20)
                    .frame(minWidth: 327, minHeight: 109, alignment: .leading)
                    .shadow(radius: 50)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [.white, Color(.sRGB, red: 1, green: 1, blue: 1, opacity: 0.75)]), startPoint: .leading, endPoint: .trailing))
                    .clipShape(RoundedRectangle(cornerRadius: 15.0))
                    
                    
                }
                .padding(.all, 30)
       
            }
            .background(
                Image(bar.image)
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            )
            .navigationBarTitle(Text(bar.name), displayMode: .inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct BarView_Previews: PreviewProvider {
    static var previews: some View {
        BarView(isLiked: true, bar: Bar())
    }
}
