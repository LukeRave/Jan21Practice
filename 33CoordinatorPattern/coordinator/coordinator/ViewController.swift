//
//  ViewController.swift
//  coordinator
//
//  Created by Luat on 2/9/21.
//

import UIKit

class ViewController: UIViewController {

    var coordinator: Coordinator?
    
    @IBAction func accountTapped(_ sender: UIButton) {
        coordinator?.pushAccountVC()
    }
    @IBAction func productTapped(_ sender: UIButton) {
        coordinator?.pushProductVC()
    }
    @IBAction func listTapped(_ sender: UIButton) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

