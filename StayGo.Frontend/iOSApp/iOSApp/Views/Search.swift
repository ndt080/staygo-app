import SwiftUI
struct SearchAndFilterView: View {
    @Binding var search: String
    @EnvironmentObject var str: Storage
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack{
            HStack{
                Image(uiImage: #imageLiteral(resourceName: "search"))
                TextField("Search for a place", text: $search)
                    .textFieldStyle(PlainTextFieldStyle())
                    .foregroundColor(.black)
            }
            .padding()
            .background(Color("LightGrayColor"))
            .cornerRadius(10.0)
            if search.count != 0 {
                ForEach(str.bars.filter{$0.name.contains(search) || search == ""}, id: \.self.id){ obj in
                    NavigationLink(destination: BarView(isLiked: true, bar: obj)) {
                        SmallBarCardView(image: obj.image, title: obj.name, type: obj.description, price: 25.0)
                    }
                }
            }
        }
    }
}
