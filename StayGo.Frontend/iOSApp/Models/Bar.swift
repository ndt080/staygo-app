import Foundation

struct Bar : Decodable, Identifiable{
    let id : Int
    var name : String
    var address : String
    var description : String
    var type : String
    var rate : Int
    var avgCheck : Double
    init (){
        self.id = 0
        self.address = ""
        self.type = ""
        self.name = "Bar"
        self.description = "Super puper bar"
        self.rate = 0
        self.avgCheck = 0
    }
}
