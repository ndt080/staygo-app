import Foundation
import Combine

final class UserSettings: ObservableObject {
    let objectWillChange = PassthroughSubject<Void, Never>()

    @UserDefault("userInfo", defaultValue: ["none", "none", "none"])
    var userInfo: [String] {
        willSet {
            objectWillChange.send()
        }
    }
}
