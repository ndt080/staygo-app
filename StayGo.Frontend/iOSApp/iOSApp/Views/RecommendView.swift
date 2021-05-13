import SwiftUI

struct RecommendView: View {
    @State private var showSomeBarView = false
    @EnvironmentObject var str: Storage
    
    var body: some View {
        SectionTabTitleView(title: "Recommended", hiddenBtn: true)
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(str.recommendBars.prefix(5), id: \.self.id){ obj in
                    NavigationLink(destination: BarView(isLiked: true, bar: obj)) {
                        BigCardBarView(isLiked: false, bar: obj)
                    }
                }
            }
        }
    }
}
