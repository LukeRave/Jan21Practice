//
//  ViewController.swift
//  calculator
//
//  Created by Rave Bizz on 1/23/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var text: UILabel!
    var numOnScreen: Double = 0
    var prevNum: Double = 0
    var operation = 0
    var performingMath: Bool = false
    
    
    @IBAction func numbers(_ sender: UIButton) {
        if performingMath == true { //if an operand is pressed
            text.text = String(sender.tag-1)
            numOnScreen = Double(text.text!)! 
            performingMath = false
        }else {
            text.text = text.text! + String(sender.tag-1)
            numOnScreen = Double(text.text!)!
        }
    }
    
    
    @IBAction func operationFunc(_ sender: UIButton) {
            if text.text != "" && sender.tag != 11 && sender.tag != 16 && sender.tag != 17{
                prevNum = Double(text.text!)!//Set prevNum var to value of numOnScreen before operand was pressed
                operation = sender.tag //stores operation for computation
                performingMath = true;
            }else if sender.tag == 16 { //When they press =
                ///Operation
                if operation == 12{ //Division
                    text.text = String(Int(prevNum / numOnScreen))
                }else if operation == 13{ //Multiplication
                    text.text = String(Int(prevNum * numOnScreen))
                }
                else if operation == 14{ //Subtraction
                    text.text = String(Int(prevNum - numOnScreen))
                }
                else if operation == 15{ //Addition
                    text.text = String(Int(prevNum + numOnScreen))
                }
            }else if sender.tag == 11{//Clear button
                text.text = ""
                prevNum = 0;
                numOnScreen = 0;
                operation = 0;
            }else if sender.tag == 17{
                var newNum = numOnScreen
                if newNum > 0{
                    newNum -= newNum * 2
                } else if newNum < 0 {
                    newNum += newNum * 2
                }
                text.text = String(Int(newNum))
            }
        
            
        }
    
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        }
    }
    
