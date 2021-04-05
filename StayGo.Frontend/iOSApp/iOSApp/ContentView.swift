import SwiftUI
import SafariServices

struct ContentView: View {
    

    @State private var search: String = ""
    
    
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
                SectionTabTitleView(title: "Places")
                ScrollView(.horizontal){
                    HStack{
                        BigCardBarView(image: #imageLiteral(resourceName: "reco_1"))
                        BigCardBarView(image: #imageLiteral(resourceName: "fresh_recipe_1"))
                        BigCardBarView(image: #imageLiteral(resourceName: "reco_2"))
                    }
                }
                SectionTabTitleView(title: "Recommended")
                
                SmallCardBarView (image: #imageLiteral(resourceName: "fresh_recipe_2"), title: "Bar")
                SmallCardBarView (image: #imageLiteral(resourceName: "fresh_recipe_2"), title: "Bar")
                SmallCardBarView (image: #imageLiteral(resourceName: "fresh_recipe_2"), title: "Bar")
                
            }
            .padding()
        }

    }
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}


    struct HomeNavBar: View {
        var body: some View {
            HStack{
                Image(uiImage: #imageLiteral(resourceName: "menu")).onTapGesture {
                    
                }
                Spacer()
                
                Image(uiImage: #imageLiteral(resourceName: "notifications")).onTapGesture {
                }
             
            }
        }
    }
    }

    

    struct SectionTabTitleView: View {
        let title: String
        var body: some View {
            HStack{
                Text(title)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.light)
                Spacer()
                Text("See all")
                    .foregroundColor(Color("PrimaryColor"))
                    .onTapGesture {
                    }
            }
        }
    }
