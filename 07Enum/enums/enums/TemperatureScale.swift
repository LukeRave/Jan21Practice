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

enum TemperatureScale: TempConvertable {
    case fahrenheit(Int);
    case celcius(Int);
    case kelvin(Int);
    var tempInFahren: Int {
        switch self {
            default:
                return getTempInFahrenheit()
        }
    }
    func getTempInFahrenheit() -> Int {
        switch self {
        case .celcius(let inputTemp):
            return Int(inputTemp * 9 / 5 + 32)
        case .kelvin(let inputTemp):
            return Int(Double(inputTemp - 273) * 1.8 + 32)
        case .fahrenheit(let inputTemp):
            return inputTemp
        }
    }
}

protocol TempConvertable {
    func getTempInFahrenheit() -> Int
    var tempInFahren: Int { get }
}
