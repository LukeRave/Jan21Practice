//
//  ViewController.swift
//  App Practice
//
//  Created by Rave Bizz on 1/20/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("View is loading")
        view.backgroundColor = UIColor.yellow
    }

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    
    @IBAction func createPressed(_ sender: Any) {
        print("First Name: \(firstName.text ?? "") \nLast Name: \(lastName.text ?? "")")
    }
    
    
    
}

