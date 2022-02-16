//
//  ViewController.swift
//  Project_31
//
//  Created by Rave Bizz on 2/15/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onSubmit(_ sender: UIButton) {
        print("Username: \(userName.text ?? "")\nPassword: \(password.text ?? "")")
    }
    
}

