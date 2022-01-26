//
//  ViewController.swift
//  calculator
//
//  Created by Luat on 1/1/21.
//

import UIKit
/*
 ViewController Logic:
 1. If the user is pressing a number:
    - User can enter numbers with multiple digits
       - Needs to know if this is a new number or appending number
    - Display the current number
    - Pass the info (current number) to the Model
 2. If the user is pressing an operation:
    - Ask the Model to perform an operation
    - The Model needs to know the number(s) involved, and the operator
    - Display the result
 */

class ViewController: UIViewController {
    
    private var calcLogic = CalculatorLogic()
    var userIsTyping: Bool = false
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    @IBOutlet weak var display: UILabel! = nil

    @IBAction func performOperation(_ sender: UIButton) {
        if userIsTyping {
            calcLogic.setOperand(displayValue)
            userIsTyping = false
        }
        if let mathSymbol = sender.currentTitle {
            calcLogic.performOperation(mathSymbol)
        }
        if let result = calcLogic.result {
            displayValue = result
        }
    }
    @IBAction func handleNumbericButtons(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
            userIsTyping = true
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
