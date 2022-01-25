//
//  ViewController.swift
//  CalculatorAttempt2
//
//  Created by ravebizz on 1/25/22.
//

import UIKit

class ViewController: UIViewController {
    var calculatorOutputString = ""
    var prevCalculatorValue: Double = 0
    var currentCalculatorValue: Double = 0
    var remainderFlag = false
    var divideFlag = false
    var decimalFlag = false
    var multiplyFlag = false
    var subtractFlag = false
    var addFlag = false
    
    func flagsAreDown() -> Bool {
        return !(remainderFlag || divideFlag || multiplyFlag || subtractFlag || addFlag)
    }
    
    func appendNumber(_ number: Int) {
        if currentCalculatorValue == 0 {
            currentCalculatorValue = Double(number)
        } else {
            if decimalFlag {
                calculatorOutputString += String(number)
                if let num = Double(calculatorOutputString) {
                    currentCalculatorValue = num
                } else {
                    fatalError("Can't determine current value")
                }
            } else {
                currentCalculatorValue *= 10
                currentCalculatorValue += Double(number)
            }
        }
        updateCalculatorOutput("")
    }
    
    func updateCalculatorOutput(_ function: String) {
        if function == "" {
            calculatorOutputString = String(currentCalculatorValue)
            CalculatorOutput.text = calculatorOutputString
        }
    }
    
    @IBAction func acClicked(_ sender: Any) {
        print("AC Clicked")
        calculatorOutputString = ""
        prevCalculatorValue = 0
        currentCalculatorValue = 0
        updateCalculatorOutput("")
    }
    
    @IBAction func InvertClicked(_ sender: Any) {
        print("InvertClicked")
        currentCalculatorValue *= -1
        updateCalculatorOutput("")
    }
    
    @IBAction func RemainderClicked(_ sender: Any) {
        print("RemainderClicked")
        if flagsAreDown() {
            prevCalculatorValue = currentCalculatorValue
            currentCalculatorValue = 0
            remainderFlag = true
            updateCalculatorOutput("")
        }
    }
    
    @IBAction func DivideClicked(_ sender: Any) {
        print("DivideClicked")
        if flagsAreDown() {
            prevCalculatorValue = currentCalculatorValue
            currentCalculatorValue = 0
            divideFlag = true
            updateCalculatorOutput("")
        }
    }
    
    @IBAction func SevenClicked(_ sender: Any) {
        print("SevenClicked")
        appendNumber(7)
    }
    
    @IBAction func EightClicked(_ sender: Any) {
        print("EightClicked")
        appendNumber(8)
    }
    
    @IBAction func NineClicked(_ sender: Any) {
        print("NineClicked")
        appendNumber(9)
    }
    
    @IBAction func MultiplyClicked(_ sender: Any) {
        print("MultiplyClicked")
        if flagsAreDown() {
            prevCalculatorValue = currentCalculatorValue
            currentCalculatorValue = 0
            multiplyFlag = true
            updateCalculatorOutput("")
        }
    }
    
    @IBAction func FourClicked(_ sender: Any) {
        print("FourClicked")
        appendNumber(4)
    }
    
    @IBAction func FiveClicked(_ sender: Any) {
        print("FiveClicked")
        appendNumber(5)
    }
    
    @IBAction func SixClicked(_ sender: Any) {
        print("SixClicked")
        appendNumber(6)
    }
    
    @IBAction func MinusClicked(_ sender: Any) {
        print("MinusClicked")
        if flagsAreDown() {
            prevCalculatorValue = currentCalculatorValue
            currentCalculatorValue = 0
            subtractFlag = true
            updateCalculatorOutput("")
        }
    }
    
    @IBAction func OneClicked(_ sender: Any) {
        print("OneClicked")
        appendNumber(1)
    }
    
    @IBAction func TwoClicked(_ sender: Any) {
        print("TwoClicked")
        appendNumber(2)
    }
    
    @IBAction func ThreeClicked(_ sender: Any) {
        print("ThreeClicked")
        appendNumber(3)
    }
    
    @IBAction func PlusClicked(_ sender: Any) {
        print("PlusClicked")
        if flagsAreDown() {
            prevCalculatorValue = currentCalculatorValue
            currentCalculatorValue = 0
            addFlag = true
            updateCalculatorOutput("")
        }
    }
    
    @IBAction func ZeroClicked(_ sender: Any) {
        print("ZeroClicked")
        appendNumber(0)
    }
    
    @IBAction func DecimalClicked(_ sender: Any) {
        print("DecimalClicked")
        if flagsAreDown() {
            prevCalculatorValue = currentCalculatorValue
            currentCalculatorValue = 0
            decimalFlag = true
            updateCalculatorOutput("")
        }
    }
    
    @IBAction func EqualClicked(_ sender: Any) {
        print("EqualClicked")
        if !flagsAreDown() {
            if(addFlag) {
                currentCalculatorValue += prevCalculatorValue
                addFlag = false
            } else if (divideFlag) {
                currentCalculatorValue = prevCalculatorValue/currentCalculatorValue
                divideFlag = false
            } else if (subtractFlag) {
                currentCalculatorValue = prevCalculatorValue - currentCalculatorValue
                subtractFlag = false
            } else if (multiplyFlag) {
                currentCalculatorValue = prevCalculatorValue * currentCalculatorValue
                multiplyFlag = false
            } else if (remainderFlag) {
                currentCalculatorValue = prevCalculatorValue.truncatingRemainder(dividingBy: currentCalculatorValue)
                remainderFlag = false
            }
        }
        updateCalculatorOutput("")
    }
    
    @IBOutlet weak var CalculatorOutput: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

