//
//  TemperatureScale.swift
//  enums
//
//  Created by Luat on 8/10/21.
//

import Foundation

/**
 1) Have Temperature Enum Adopt the TempConvertable protocol
 2) Implement getTempInFarnheit func
 3) Implement tempInFahren property
 */

enum TemperatureScale : TempConvertable {
    func getTempInFahrenheit() -> Int {
        switch self {
        case .fahrenheit(let temp) :
            return temp
        case .celcius(let temp) :
            let farenheit = ((temp * 9)/5) + 32
            return farenheit
        case .kelvin(let temp) :
            let farenheit = (temp - 273) * 9/5 + 32
            return farenheit
        }
    }
    var tempInFahren: Int {
        return self.getTempInFahrenheit()
    }
    
    
    case fahrenheit(Int)
    case celcius(Int)
    case kelvin(Int)
}

protocol TempConvertable {
    func getTempInFahrenheit() -> Int
    var tempInFahren: Int { get }
}
