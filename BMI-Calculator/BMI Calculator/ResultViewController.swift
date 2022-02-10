//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Cameryn Williams on 2/9/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var bmiValue: String?
    
    @IBOutlet weak var bmiLabel: UILabel!
   
    @IBOutlet weak var adviceLabel: UILabel!
  
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiLabel.text = bmiValue
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
