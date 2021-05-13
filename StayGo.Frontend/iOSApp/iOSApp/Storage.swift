import SwiftUI
import GoogleSignIn

class Storage: ObservableObject {
    @Published var stateApiLoad = [false, false]
    @Published var bars : [Bar] = []
    @Published var userInfo : [String] = UserSettings().userInfo
    @Published var recommendBars : [Bar] = []
    @Published var barAnnotation : [LandmarkAnnotation] = []
}
