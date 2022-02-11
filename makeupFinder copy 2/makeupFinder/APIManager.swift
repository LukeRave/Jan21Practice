//
//  APIManager.swift
//  makeupFinder
//
//  Created by Rave Bizz on 2/3/22.
//

import Foundation

final class APIManger{
    static let shared = APIManger()
    let dataClearer: DataClearer = DataManager()
    var url: URL?
    func constructUrl(withqueries querys: [String] = [], searchErrorHandeler: (() -> Void)? = nil){
        var queryItems: [URLQueryItem] = []
        if querys.count == 1 && querys.first == "clear" {
            dataClearer.clearCartAndFavorites()
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadHome"), object: nil)
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadCart"), object: nil)
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadProducts"), object: nil)
            }
            return
        }
        
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
                searchErrorHandeler?()
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
