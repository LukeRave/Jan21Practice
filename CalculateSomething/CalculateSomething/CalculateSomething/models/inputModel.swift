//
//  inputModel.swift
//  CalculateSomething
//
//  Created by Rave Training on 1/26/22.
//

import Foundation

class UserInput {
    var currInput: String
    var mathVals: [Double]
    var calcOperator: String
    var isComplete: Bool
    var numVals: String
    var binaryOps: String
    var singleOps: String
    var inputChar: String
    init() {
        self.currInput = ""
        self.mathVals = []
        self.calcOperator = ""
        self.isComplete = false
        self.numVals = "0123456789"
        self.binaryOps = "+-/*%^"
        self.singleOps = "lnlog!√"
        self.inputChar = ""
    }
    func doMath() -> Void {
        let operation = mathOperations[self.calcOperator]!
        if case Operation.doubleInput(let function) = operation {
            self.currInput = String(function(self.mathVals[0], self.mathVals[1]))
        }
        if case Operation.singleInput(let function) = operation {
            self.currInput = String(function(self.mathVals[0]))
        }
    }
    func handleInput(userInput: String) -> Void {
        self.inputChar = userInput
        if checkPi() {return}
        else if checkDecimal() {return}
        else if checkInverse() {return}
        else if checkNumeric() {return}
        else if (checkOperator() || checkBinaryComplete()) {
            if (self.isComplete) {
                if (!self.currInput.isEmpty) {
                    self.mathVals.append(Double(self.currInput)!)
                }
                self.doMath()
            } else {return}
        } else {return}
    }
    func checkOperator() -> Bool {
        if (self.singleOps.contains(self.inputChar) || self.binaryOps.contains(self.inputChar)) {
            if (self.currInput.isEmpty) {
                return false
            }
            self.mathVals.append(Double(self.currInput)!)
            self.calcOperator = self.inputChar
            self.currInput = ""
            checkSingleOperator()
            return true
        }
        return false
    }
    func checkSingleOperator() {
        if (self.singleOps.contains(self.inputChar)) {
            self.isComplete = true
        }
    }
    func checkBinaryComplete() -> Bool {
        if (self.inputChar == "=") {
            if (!self.currInput.isEmpty || !self.mathVals.isEmpty) {
                self.isComplete = true
            }
            return true
        }
        return false
    }
    func checkPi() -> Bool {
        if (self.inputChar == "π") {
            self.currInput = String(Double.pi)
            return true
        }
        return false
    }
    func checkDecimal() -> Bool {
        if (self.inputChar == ".") {
            if !self.currInput.contains(".") {
                self.currInput += "."
            }
            return true
        }
        return false
    }
    func checkInverse() -> Bool {
        if (self.inputChar == "±") {
            guard let num = Double(self.currInput) else {
                return true
            }
            if (Double(Int(num)) != num) {
                self.currInput = String(-1 * num)
            } else {
                self.currInput = String(Int(-1 * num))
            }
            return true
        }
        return false
    }
    func checkNumeric() -> Bool {
        if (self.numVals.contains(self.inputChar)) {
            self.currInput += self.inputChar
            return true
        }
        return false
    }
}
