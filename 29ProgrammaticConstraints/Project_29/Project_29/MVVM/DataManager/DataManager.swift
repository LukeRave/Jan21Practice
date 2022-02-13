//
//  DataManager.swift
//  Project_29
//
//  Created by Rave Bizz on 2/13/22.
//

import Foundation

struct DataManager{
    
    static let shared = DataManager()
    
    func getData() -> [Album]?{
        NetworkManger.shared.fetchData()
        
        let musicData = UserDefaults().data(forKey: "musicData")
        let resp = DataDecoder.shared.decode(for: musicData ?? Data())
        let arr = resp.feed?.results
        
        return arr
    }
}
