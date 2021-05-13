import SwiftUI

struct HomeNavBar: View {
    var body: some View {
        HStack{
            Image(uiImage: #imageLiteral(resourceName: "menu"))
                .onTapGesture { }
            Spacer()
            Image(systemName:"bell")
                .onTapGesture { }
        }
    }
}
