import SwiftUI

struct HomeView: View {
    @EnvironmentObject var str: Storage
    @State private var search: String = ""
    @State private var showSafari = false
    @State private var showSomeBarView = false
    
    var body: some View {
        NavigationView{
            ZStack {
                GeometryReader { geometry in
                    LinearGradient(gradient: Gradient(colors: [Color.orange.opacity(0.8), Color.red]), startPoint: .bottom, endPoint: .top)
                        .frame(width: geometry.size.width * 1.5, height: geometry.size.height)
                        .clipShape(Circle())
                        .offset(x: -geometry.size.width / 4, y: -geometry.size.height / 2)
                }
                ScrollView(showsIndicators: false){
                    VStack(alignment: .leading, spacing: 16) {
                        HeaderView()
                        SearchAndFilterView(search: $search)
                        RecommendView()
                        SectionTabTitleView(title: "Places", hiddenBtn: false)
                        VStack{
                            ForEach(str.bars.prefix(3), id: \.self.id){ obj in
                                NavigationLink(destination: BarView(isLiked: true, bar: obj)) {
                                    SmallBarCardView(image: obj.image, title: obj.name, type: obj.description, price: 25.0)
                                }
                            }
                            
                        }
                    }.padding(.top, 20)
                }
            }.padding()
            .navigationBarHidden(true)
        } .edgesIgnoringSafeArea(.all)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
