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
        let wNum: String = wheels.text!
        let aNum: String = acceleration.text!
        let bNum: String = braking.text!
        let car = Vehicle(wheels: Int(wNum) ?? 0, acceleration: Int(aNum) ?? 0, braking: Int(bNum) ?? 0)
        
        print(car.wheels, car.acceleration, car.braking)
    }
    
}

