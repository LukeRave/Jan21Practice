//
//  APIManager.swift
//  colors MVC
//
//  Created by Rave Bizz on 2/1/22.
//

import Foundation

final class APIManager{
    static let shared = APIManager()
    private init() {
        
    }
    func getData(url: URL, completion: @escaping (HexResponse) -> Void){
        let task = URLSession.shared.dataTask(with: url, completionHandler: {
            d,r,e in
            if let data = d{
                do {
                    let model = try JSONDecoder().decode(HexResponse.self, from: data)
                    completion(model)
                } catch  {
                    print(error)
                }
            }
        })
        task.resume()
    }
    
}
