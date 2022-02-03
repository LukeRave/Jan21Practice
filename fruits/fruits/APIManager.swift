//
//  APIManager.swift
//  fruits
//
//  Created by Rave Bizz on 2/1/22.
//

import Foundation
import UIKit

final class APIManager {
    static let shared = APIManager()
    private init(){}
    func getData(for fruit: String, completion: @escaping (Fruit) -> Void){
        guard let url = URL(string: "\(URLConstants.shared.urlString)\(fruit)") else{
            return
        }
        let task = URLSession.shared.dataTask(with: url, completionHandler: { d,r,e in
            if let data = d{
                do {
                    let model = try JSONDecoder().decode(Fruit.self, from: data)
                    completion(model)
                } catch  {
                    print(error.localizedDescription)
                }
            }
        })
        task.resume()
    }
    
}
