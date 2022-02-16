//
//  DetailsVM.swift
//  temperature
//
//  Created by Luat on 2/8/21.
//

import Foundation

class TempViewModel {
    var temp: Double {
        didSet {
            DispatchQueue.main.async {
                self.updateLabel?(self.formatText)
            }
        }
    }
    var scale: TempScale
    var updateLabel: ((String) -> Void)?
    var formatText: String {
        String(temp) + " " + scale.rawValue
    }
    
    var service: TempService
    
    init(temp: Double, scale: TempScale, service: TempService = RealService()) {
        self.temp = temp
        self.scale = scale
        self.service = service
    }
    
    func getData(completion: @escaping (Double) -> ()) {
        service.getData(completion: completion)
    }
        
    func convertToCelcius() {
        temp = (temp - 32) * 5.0/9.0
        scale = .celcius
    }
    
    func convertToFarenheit() {
        temp = (temp * 9/5) + 32
        scale = .farenheit
    }
    
}
