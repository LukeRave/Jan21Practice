//
//  API_Manager.swift
//  PersistFav
//
//  Created by Matthew Flores on 2/7/22.
//

import Foundation

struct APIManager {
    func fetchNasaData(completion: @escaping ((NasaResponse) -> Void) ){
        guard let validURL = Const.url else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: validURL){(data,response,error) in
            guard let data = data else {
                return
            }
            do {
                let parsedData = try JSONDecoder().decode(NasaResponse.self, from: data)
                    completion(parsedData)
            } catch {
                print(error)
            }
            
        }
        task.resume()
    }
}

struct PhotoList {
    static func createList(parsedData: NasaResponse){
        for n in 0...parsedData.photos.count-1{
            Const.list.append(parsedData.photos[n])
        }
    }
}

