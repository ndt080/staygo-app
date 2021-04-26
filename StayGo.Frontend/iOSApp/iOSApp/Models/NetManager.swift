//
//  NetManager.swift
//  iOSApp
//
//  Created by Alex VARFALAMEYEU on 25.04.21.
//

import SwiftUI
import Combine

class NetworkManager: ObservableObject {
    @State var urlStr : String = ""
    var didChange = PassthroughSubject<NetworkManager, Never>()
    
    var bars = [Bar](){
        didSet {
            didChange.send(self)
        }
    }
    
    init() {
        guard let url = URL(string: self.urlStr)
        else {return}
        URLSession.shared.dataTask(with: url){ (data, _, _) in
            
            guard let data = data else { return }
            let bars = try! JSONDecoder().decode([Bar].self, from: data)
            
            DispatchQueue.main.async {
                self.bars = bars
            }
        }.resume()
    }
}
