//
//  CalculatorLogic.swift
//  calculator
//
//  Created by Luat on 1/2/21.
//

import Foundation

/// Model's public API: what does this model allows the user to do
/// Application programming Interface: all the methods and properties of the class

private func changeSign(operand: Double) -> Double {
    return -operand
}

struct CalculatorLogic {
    
    private var accumulator: Double?
    
    private enum Operation {
        case constant(Double)
        case unaryOperation((Double) -> Double)
        case binaryOperation((Double, Double) -> Double)
        case equals
    }
    
    private struct PendingBinaryOperation {
        let function: (Double, Double) -> Double
        let firstOperand: Double
        
        func perfom(with secondOperand: Double) -> Double {
            return function(firstOperand, secondOperand)
        }
    }
    
    private var pendingBinaryOperation: PendingBinaryOperation?
    
    private var opertaions: Dictionary<String, Operation> = [
        "𝛑": Operation.constant(Double.pi),
        "e": Operation.constant(M_E),
        "√": Operation.unaryOperation(sqrt),
        "cos": Operation.unaryOperation(cos),
        "±" : Operation.unaryOperation({ -$0 }),
        "x" : Operation.binaryOperation({ $0 * $1 }),
        "-" : Operation.binaryOperation({ $0 - $1 }),
        "+" : Operation.binaryOperation({ $0 + $1 }),
        "/" : Operation.binaryOperation({ $0 / $1 }),
        "=" : Operation.equals
    ]
    
    private mutating func performPendingBinaryOperation() {
        if pendingBinaryOperation != nil && accumulator != nil {
            accumulator = pendingBinaryOperation!.perfom(with: accumulator!)
            pendingBinaryOperation = nil
        }
    }
    
    mutating func performOperation(_ symbol: String) {
        if let operation = opertaions[symbol] {
            switch operation {
            case .constant(let value):
                accumulator = value
            case .unaryOperation(let function):
                if accumulator != nil {
                    accumulator = function(accumulator!)
                }
            case .binaryOperation(let function):
                if accumulator != nil {
                    pendingBinaryOperation = PendingBinaryOperation(function: function, firstOperand: accumulator!)
                    accumulator = nil
                }
            case .equals:
                performPendingBinaryOperation()
                break
            }
        }
    }
    
    mutating func setOperand(_ operand: Double) {
        accumulator = operand
    }
    
    var result: Double? {
        get {
            return accumulator
        }
    }
}
