import SwiftUI

struct SectionTabTitleView: View {
    @State var showAllBarView = false
    let title: String
    let hiddenBtn: Bool
    
    var body: some View {
        HStack{
            Text(title)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(.light)
            Spacer()
            if !hiddenBtn {
                NavigationLink(destination: AllBarView()) {
                    Text("See all")
                        .foregroundColor(Color("PrimaryColor"))
                }
            }
            
        }
    }
}
