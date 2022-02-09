//
//  ViewController.swift
//  autolayout
//
//  Created by Luat on 1/24/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var updateLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var hiddenButton: UIButton!
    @IBAction func updatePressed(_ sender: Any) {
        updateLabel.text = textField.text
        
        hiddenButton.isHidden = !(hiddenButton.isHidden)
    }
    
    @IBAction func operationPressed(_ sender: UIButton) {
        print(sender.titleLabel?.text)
    }
    
    var items: [TodoItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel.text = items.first.debugDescription

    }

}

