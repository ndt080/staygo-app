import SwiftUI

struct AllBarView: View {
    @EnvironmentObject var str: Storage
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack{
                ForEach(str.bars, id: \.self.id){ obj in
                    NavigationLink(destination: BarView(isLiked: true, bar: obj)) {
                        SmallBarCardView(image: obj.image, title: obj.name, type: obj.description, price: 25.0)
                    }
                }
                Spacer()
            }.padding()
        }
        .navigationTitle(Text("All places"))
    }
}

struct AllBarView_Previews: PreviewProvider {
    static var previews: some View {
        AllBarView()
    }
}
