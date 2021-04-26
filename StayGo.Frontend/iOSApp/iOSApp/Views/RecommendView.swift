import SwiftUI

struct RecommendView: View {
    @State private var showSomeBarView = false
    var _bar: Bar
    
    var body: some View {
        SectionTabTitleView(title: "Recommended")
        ScrollView(.horizontal){
            HStack{
                Button(action: {
                    
                    if(self.showSomeBarView == false){
                        self.showSomeBarView = true
                    }
                    else {
                        self.showSomeBarView = false
                    }
                    
                } ){
                    BigCardBarView(isLiked: false, bar: _bar)
                }
                .sheet(isPresented: $showSomeBarView) {
                    BarView(isLiked: true, bar: _bar)
                }
            }
        }
    }
}
