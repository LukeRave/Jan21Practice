//
//  functionality.swift
//  temperatureUI
//
//  Created by Rave Bizz on 1/23/22.
//

import Foundation

func calculateCelsius(fahrenheit: Double) -> Double {
    var celsius: Double
    
    celsius = (fahrenheit - 32) * 5 / 9
    
    return celsius
}

func calculateFahrenheit(celsius: Double) -> Double {
    var fahrenheit: Double
    
    fahrenheit = celsius * 9 / 5 + 32
    
    return fahrenheit
}

