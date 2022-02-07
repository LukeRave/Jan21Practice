//
//  NetworkingManager.swift
//  GenericAPI
//
//  Created by Luat on 2/7/22.
//

import Foundation

class NetworkingManager {
    func fetchData<T: Decodable>(str: String, completion: @escaping (T) -> Void) {
        guard let url = URL(string: str) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            do {
                let decoded = try JSONDecoder().decode(T.self, from: data)
                completion(decoded)
            } catch {}
        }.resume()
    }
}
