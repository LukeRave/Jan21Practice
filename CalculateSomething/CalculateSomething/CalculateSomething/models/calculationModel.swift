//
//  calculationModel.swift
//  CalculateSomething
//
//  Created by Rave Training on 1/26/22.
//

import Foundation

enum Operation {
    case singleInput((Double) -> Double)
    case doubleInput((Double, Double) -> Double)
}

let mathOperations: [String: Operation] = [
    "+": Operation.doubleInput( {($0 + $1)} ),
    "-": Operation.doubleInput( {($0 - $1)} ),
    "*": Operation.doubleInput( {($0 * $1)} ),
    "/": Operation.doubleInput( {($0 / $1)} ),
    "%": Operation.doubleInput( {($0.truncatingRemainder(dividingBy: $1))} ),
    "^": Operation.doubleInput( {(pow($0, $1))} ),
    "√": Operation.singleInput( {(sqrt($0))} ),
    "!": Operation.singleInput( {factorial(input: Int($0))} ),
    "ln": Operation.singleInput( {(log($0))} ),
    "log": Operation.singleInput( {(log10($0))})
]

func factorial(input: Int) -> Double {
    var result = input
    while result > 0 {
        result *= result - 1
    }
    return Double(result)
}
