//
//  NetworkManager.swift
//  Project_29
//
//  Created by Rave Bizz on 2/11/22.
//

import Foundation

class NetworkManger{
    static let shared = NetworkManger()
    
    let defaults = UserDefaults()
    
    var musicData: Response?
    let imgStr = Constants()
    var data: [Album] {
        get{
            musicData?.feed?.results ?? []
        }
    }
    
    func fetchData(){
        guard let url = imgStr.imgUrl else{
            return
        }
        URLSession.shared.dataTask(with: url){ data, response, error in
            guard let data = data else{
                return
            }
            do{
                let _ = try ValidationService.shared.inputCheck(response: data)
                self.defaults.set(data, forKey: "musicData")
            }catch{
                print(error)
            }
        }.resume()
    }
}
