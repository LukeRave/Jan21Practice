//
//  ViewController.swift
//  Calculator
//
//  Created by Cameryn Williams on 2/5/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var text: UILabel!
    var numOnScreen: Double = 0
    var prevNumber: Double = 0
    var operation  = 0
    var performingMath:Bool = false
    
    @IBAction func numbers(_ sender: UIButton) {
        if performingMath == true { //if an operand pressed
            text.text = String(sender.tag-1)
            numOnScreen = Double(text.text!)!
            performingMath = false
        }else{
            text.text = text.text! + String(sender.tag-1)
            numOnScreen = Double(text.text!)!
        }
    }
    
    @IBAction func operationFunc(_ sender: UIButton) {
        if text.text != "" && sender.tag != 11 && sender.tag != 18 {
            prevNumber = Double(text.text!)!//set prev to value of numonscreen b4 operand was pressed
            operation = sender.tag//stores operation for computation
            performingMath = true
        }else if sender.tag == 18{//when the press equals
            if operation == 14 {//division
                text.text = String(Int(prevNumber / numOnScreen))
            }
            else if operation == 15 {//multiplication
                text.text = String(Int(prevNumber * numOnScreen))
            }
            else if operation == 16{//subtraction
                text.text = String(Int(prevNumber - numOnScreen))
            }
            else if operation == 17 {//addition
                text.text = String(Int(prevNumber + numOnScreen))
            }
        }else if sender.tag == 11 {
            text.text = ""
        }
    }
    
    @IBAction func percentage(_ sender: UIButton) {
        let percentNum = (Double(text.text!)!/100)
        text.text = String(percentNum)
    }
    
    @IBAction func switchValue(_ sender: UIButton) {
        //positive or negative
        var newNum = Int(text.text!)!
        if newNum < 0 {
            newNum += (2 * newNum)
            text.text = String(newNum)
        } else if newNum > 0 {
            newNum -= (2 * newNum)
            text.text = String(newNum)
        }
    }
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        }
}
    
    
