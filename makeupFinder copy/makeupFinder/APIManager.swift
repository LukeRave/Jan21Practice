//
//  APIManager.swift
//  makeupFinder
//
//  Created by Rave Bizz on 2/3/22.
//

import Foundation
import UIKit

final class APIManger{
    static let shared = APIManger()
    var url: URL?
    func constructUrl(withqueries querys: [String] = [], searchErrorHandeler: (() -> Void)? = nil){
        var queryItems: [URLQueryItem] = []
        for query in querys{
            if Contstants.shared.brands.contains(query){
                queryItems.append(URLQueryItem(name: StringConstants.brandQuery.rawValue, value: query))
            }
            if Contstants.shared.productTypes.contains(query){
                queryItems.append(URLQueryItem(name: StringConstants.typeQuery.rawValue, value: query))
            }
            if Contstants.shared.tags.contains(query){
                queryItems.append(URLQueryItem(name: StringConstants.tagQuery.rawValue, value: query))
            }
            if queryItems.isEmpty{
                let invalidSearchAlert = UIAlertController.init(1)
                UIApplication.shared.keyWindow?.rootViewController?.present(invalidSearchAlert, animated: true)
                return
            }

        }
        var components = URLComponents()
        
        components.scheme = Contstants.scheme
        components.host = Contstants.host
        components.path = Contstants.path
        if queryItems.isEmpty == false{
            components.queryItems = queryItems
        }
        url = components.url
    }
    
    func getData<T:Decodable>(model: T.Type, completion: @escaping ([T])-> Void){
        guard let url = url else{
            return
        }
        let task = URLSession.shared.dataTask(with: url, completionHandler: {
            data, request, error in
            if let error = error {
                print(StringConstants.fetchingError.rawValue, error.localizedDescription)
            }
            if let data = data{
                self.decode(data: data, completion: completion)
            }
        })
        task.resume()
    }
    
    func decode<T:Decodable>(data: Data, completion: ([T]) -> Void){
        do {
            let model = try JSONDecoder().decode([T].self, from: data)
            completion(model)
        } catch{
            print(StringConstants.parsingError.rawValue, error.localizedDescription)
        }
    }
}
