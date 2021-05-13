import SwiftUI

class User : Codable{
    var uid: String
    var email: String?
    var emailVerified: Bool?
    var displayName: String?
    
    init(uid: String, email: String?, emailVerified: Bool?, displayName: String?) {
        self.uid = uid
        self.email = email
        self.emailVerified = emailVerified
        self.displayName = displayName
    }
}
