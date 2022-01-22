//
//  ViewController.swift
//  RepairShop
//
//  Created by Rave Bizz on 1/21/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var wheels: UITextField!
    @IBOutlet weak var acceleration: UITextField!
    @IBOutlet weak var braking: UITextField!
    
    @IBAction func submitData(_ sender: Any) {
        let car = Vehicle(wheels: wheels.text, acceleration: acceleration.text, braking: braking.text)
    }
    
}

