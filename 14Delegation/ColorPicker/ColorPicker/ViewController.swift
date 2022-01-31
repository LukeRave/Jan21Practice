//
//  ViewController.swift
//  ColorPicker
//
//  Created by ravebizz on 1/31/22.
//

import UIKit

class ViewController: UIViewController, ChangeBackgroundColorProtocol {

    func ChangeBackgroundColor(color: UIColor) {
        view.backgroundColor = color
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? SecondViewController {
            dest.delegate = self
        }
    }
    
}

protocol ChangeBackgroundColorProtocol {
    func ChangeBackgroundColor(color: UIColor)
}
