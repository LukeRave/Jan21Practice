//
//  ViewController.swift
//  Basic Data
//
//  Created by Rave Bizz on 1/23/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var fName: UITextField!
    
    @IBOutlet weak var lName: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var question: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var bDay: UITextField!
    @IBOutlet weak var bYear: UITextField!
    
    @IBAction func onSubmit(_ sender: Any) {
        print("First Name: \(fName.text!) \nLast Name: \(lName.text!) \nAddres: \(address.text!) \nSecurity Question Answer: \(question.text!) \nAge: \(age.text!) \nBirth Date: \(bDay.text!) \nBirth Year: \(bYear.text!) ")
    }
    
    
}

