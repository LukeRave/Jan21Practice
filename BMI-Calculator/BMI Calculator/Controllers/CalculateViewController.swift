//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Cameryn Williams on 2/9/22.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var bmiValue = "0.0"

    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let num  = sender.value
        let numText: String = String(format: "%.2f", num)
        let twoPlaces = Double(numText)
        heightLabel.text = ("\(twoPlaces ?? 0.0)m")
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let num  = sender.value
        let numText: String = String(format: "%.2f", num)
        let twoPlaces = Double(numText)
        weightLabel.text = ("\(twoPlaces ?? 0.0)Kg")
    }
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    @IBAction func calculatePressed(_ sender: UIButton)  {
        let height = heightSlider.value
        let weight = weightSlider.value
        let BMI = (weight/(height*height))
        bmiValue = String(format: "%.1f", BMI)
        
        self.performSegue(withIdentifier: "gotoResults", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoResults" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = bmiValue
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

