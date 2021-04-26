import SwiftUI
struct SearchAndFilterView: View {
        @Binding var search: String
        var body: some View {
            HStack(spacing: 20){
                HStack{
                    Image(uiImage: #imageLiteral(resourceName: "search"))
                    TextField("Search for a place", text: $search)
                }
                .padding()
                .background(Color("LightGrayColor"))
                .cornerRadius(10.0)
                
                
                Image(uiImage: #imageLiteral(resourceName: "filter"))
                    .padding()
                    .background(Color("LightGrayColor"))
                    .cornerRadius(8.0)
                    .onTapGesture {
                    }
            }
        }
    }
