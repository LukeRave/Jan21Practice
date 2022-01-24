//
//  ViewController.swift
//  temperatureUI
//
//  Created by Rave Bizz on 1/23/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var fahrenheit: UITextField!
    @IBOutlet weak var celsius: UITextField!
    
    @IBAction func onSubmit(_ sender: Any) {
        let celStr: String = celsius.text!
        let fahStr: String = fahrenheit.text!
        var fValue: Double = 0
        var cValue: Double = 0
        if let c = Int(celStr){
            fValue = calculateFahrenheit(celsius: Double(c))
            print("\(celsius.text!)˚C is really \(fValue)˚F")
        }
        if let f = Int(fahStr){
            cValue = calculateCelsius(fahrenheit: Double(f))
            print("\(fahrenheit.text!)˚F is really \(cValue)˚C")
        }
        
    }
    
}

