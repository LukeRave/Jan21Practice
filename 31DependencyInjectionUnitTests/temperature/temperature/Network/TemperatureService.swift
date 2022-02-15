//
//  TemperatureService.swift
//  temperature
//
//  Created by Luat on 2/15/22.
//

import Foundation

protocol TempService {
    func getData(completion: @escaping (Double) -> ())
}

struct RealService: TempService {
    func getData(completion: @escaping (Double) -> ()) {
        URLSession.shared.dataTask(with: URL(string: "https://www.google.com")!) { data, resp, error in
            guard let _ = data else {
                return
            }
            
            let parsed = 50.0
            completion(parsed)
        }
    }
    
}
