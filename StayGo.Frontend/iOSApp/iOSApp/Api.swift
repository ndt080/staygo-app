import SwiftUI

class Api {
    func getAllBars(completion: @escaping ([Bar]) -> ()){
        guard let url = URL(string: "https://staygo-app.herokuapp.com/api/Bar/GetAll") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let barData = try! JSONDecoder().decode([Bar].self, from: data!)
            DispatchQueue.main.async {
                completion(barData)
            }
        }.resume()
    }
    func getBarsbyRate(rate: Int, completion: @escaping ([Bar]) -> ()){
        guard let url = URL(string: "https://staygo-app.herokuapp.com/api/Bar/GetByRate?rate="+String(rate)) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
            let barData = try! JSONDecoder().decode([Bar].self, from: data!)
            DispatchQueue.main.async {
                completion(barData.sorted(by: { Double($0.rating)! > Double($1.rating)! }))
                print("--", barData)
            }
        }.resume()
    }
    
}

