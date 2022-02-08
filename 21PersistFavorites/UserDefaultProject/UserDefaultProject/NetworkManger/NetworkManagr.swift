//
//  NetworkManager.swift
//  UserDefaultProject
//
//  Created by Rave Bizz on 2/6/22.
//

import Foundation

struct NetworkManagr{
    static let shared = NetworkManagr()
    
    func getData(completion: @escaping (PhotosResponse) -> Void){
        guard let url = URL(string: Constants.baseUrl) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            if let error = error {print("fetching error Line - 18", error.localizedDescription); return}
            if let data = data {
                do {
                    let model = try JSONDecoder().decode(PhotosResponse.self, from: data)
                    completion(model)
                }catch{
                    print("parsing error Line - 24", error.localizedDescription)
                }
            }
        })
        task.resume()
    }
}
