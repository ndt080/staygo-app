import SwiftUI
import SafariServices

struct ContentView: View {
    @State private var search: String = ""
    @State private var showSafari = false
    @State private var showSomeBarView = false
    private var _bar : Bar = Bar.init()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading,spacing: 16) {
                HeaderView()
                SearchAndFilterView(search: $search)
                RecommendView(_bar: _bar)
                SectionTabTitleView(title: "Places")
                VStack{
                    Button(action: {
                        if(self.showSomeBarView == false){
                            self.showSomeBarView = true
                        }
                        else {
                            self.showSomeBarView = false
                        }
                        
                    }){
                        SmallBarCardView(bar: _bar)
                    }
                    .sheet(isPresented: $showSomeBarView) {
                        BarView(isLiked: true, bar: _bar)
                    }
                }
            }
            .padding()
        }
    }
}



struct SectionTabTitleView: View {
    @State var showAllBarView = false
    let title: String
    var body: some View {
        HStack{
            Text(title)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(.light)
            Spacer()
            Button(action:{
                
            }){
                Button(action:{}){
                    Text("See all")
                        .foregroundColor(Color("PrimaryColor"))
                }
                
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
