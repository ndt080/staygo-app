import SwiftUI
import MapKit

struct MapSheet: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var str: Storage
    @Binding var isActive: Bool
    @Binding var selectedAnnotation: MKAnnotation?
    @Binding var bar: Bar?
    
    var body: some View {
        if selectedAnnotation != nil{
            ZStack{
                if let obj: Bar = str.bars.first(where: {"Бар "+$0.name == selectedAnnotation?.title}){
                    HStack(alignment: .center){
                        VStack(alignment: .leading){
                            VStack(alignment: .leading){
                                Text("Go to the bar page")
                                    .font(.title3)
                                    .foregroundColor(colorScheme != .dark ? Color.black : Color.white)
                            }
                            Text(obj.name)
                                .font(.headline)
                                .fontWeight(.light)
                                .foregroundColor(colorScheme != .dark ? Color.black : Color.white)
                        }.padding(.leading, 10)
                        
                        NavigationLink(destination: BarView(isLiked: true, bar: obj)) {
                            VStack{
                                HStack(alignment: .center){
                                    Image(systemName: "arrow.right")
                                        .foregroundColor(colorScheme != .dark ? Color.black : Color.white)
                                }
                                .padding(.all, 10)
                                .background(Color.gray.opacity(0.1))
                                .shadow(radius: 10)
                                .cornerRadius(10)
                            }
                            .padding(.leading, 10)
                        }
                        
                    }.padding(.all, 10)
                    .frame(width: 300, height: 104, alignment: .center)
                    .background(BlurView(style: .systemMaterial))
                    .cornerRadius(10)
                }
                
                VStack(alignment: .trailing, spacing: 16) {
                    Button(action: { self.isActive = false }, label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .scaledToFill()
                            .foregroundColor(.black)
                    }).frame(width: 15, height: 15)
                    .padding(.all, 10)
                }
                .frame(width: 300, height: 104, alignment: .topTrailing)
                
            }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-250, alignment: .bottom)
        }
    }
}
