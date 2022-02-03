//
//  NetworkManager.swift
//  networkingDemo
//
//  Created by Luat on 2/3/22.
//

import Foundation

struct NetworkManager {
    
    let addyStr = "https://hn.algolia.com/api/v1/items/1"

    func getData(completion: @escaping (NewsModel?) -> Void) {
        guard let url = URL(string: addyStr) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("no data from network call")
                return
            }
            self.decodeMyData(data: data, completion: completion)
        }
        task.resume()
        print("end of handle Tap action")
    }
    
    func decodeMyData(data: Data, completion: @escaping (NewsModel?) -> Void) {
        do {
            let model = try JSONDecoder().decode(NewsModel.self, from: data)
                completion(model)
        } catch {
            print(error)
        }
        
    }
}
