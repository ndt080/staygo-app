import Foundation

struct Bar : Decodable, Identifiable{
    let id : Int
    var name : String
    var address : String
    var description : String
    var type : String
    var rate : Int
    var avgCheck : Double
    var image : String
    init (){
        self.id = 0
        self.address = "Minsk city, Zybitskay street"
        self.type = ""
        self.name = "Bar"
        self.description = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        self.rate = 0
        self.avgCheck = 25.0
        self.image = "TemplateBar"
    }
}
