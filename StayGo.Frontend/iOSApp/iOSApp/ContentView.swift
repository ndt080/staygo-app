import SwiftUI
import SafariServices

struct ContentView: View {
    

    @State private var search: String = ""
    @State private var showSafari = false
    @State private var showSomeBarView = false
    
    private var _bar = Bar()

    var body: some View {
        

        ScrollView {
            VStack(alignment: .leading,spacing: 16) {
                HomeNavBar()
                
                Text("Hello, Emma")
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(Color("GrayColor"))
                
                Text("Where do you wanna go today?")
                    .font(.title)
                    .fontWeight(.bold)
                
                SearchAndFilterView(search: $search)
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
                            BigCardBarView(image: #imageLiteral(resourceName: "reco_1"),isLiked: false, bar: _bar)
                        }
                        .sheet(isPresented: $showSomeBarView) {
                            BarView(bar: _bar)
                        }
                    }
                }
                SectionTabTitleView(title: "Places")
                VStack{
                    Button(action: {
                        
                        if(self.showSomeBarView == false){
                            self.showSomeBarView = true
                        }
                        else {
                            self.showSomeBarView = false
                        }
                        
                    } ){
                        SmallCardBarView(image: #imageLiteral(resourceName: "reco_1"),isLiked: false, bar: _bar)
                    }
                    .sheet(isPresented: $showSomeBarView) {
                        BarView(bar: _bar)
                    }
                }
            }
            .padding()
        }
    }
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 12")
        }
    }
}


    struct HomeNavBar: View {
        var body: some View {
            HStack{
                Image(uiImage: #imageLiteral(resourceName: "menu")).onTapGesture {
                    
                }
                Spacer()
                
                Image(systemName:"bell").onTapGesture {
                }
             
            }
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
