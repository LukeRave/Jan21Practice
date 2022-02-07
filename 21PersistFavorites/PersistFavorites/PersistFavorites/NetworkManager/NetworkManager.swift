//
//  NetworkManager.swift
//  PersistFavorites
//
//  Created by ravebizz on 2/4/22.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init() {
        
    }
    
    func getNasaFeedData(completion: @escaping (NasaFeed) -> Void) {
        if let url = URL(string: Constants.nasa_url) {
            let task = URLSession.shared.dataTask(with: url) { d, r, e in
                guard let data = d else {
                    print("Failed to load data")
                    return
                }
                do {
                    let model = try JSONDecoder().decode(NasaFeed.self, from: data)
                    completion(model)
                } catch {
                    print(error)
                }
            }
            task.resume()
        }
    }
    
    func getNasaPhoto(url: URL, completion: @escaping (NasaFeed) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { d, r, e in
            guard let data = d else {
                print("Failed to load data")
                return
            }
            do {
                let model = try JSONDecoder().decode(NasaFeed.self, from: data)
                completion(model)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
