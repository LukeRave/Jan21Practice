//
//  updateViewController.swift
//  DelegateProject
//
//  Created by Rave Bizz on 1/31/22.
//

import UIKit

class updateViewController: UIViewController {

    var delegate: PassData?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func updateGreen(_ sender: Any) {
        delegate?.update(text: "Green", color: .green)
        dismiss(animated: true)
    }
    @IBAction func bluePressed(_ sender: Any) {
        delegate?.update(text: "Blue", color: .blue)
        dismiss(animated: true)
    }
    @IBAction func orangePressed(_ sender: Any) {
        delegate?.update(text: "Orange", color: .orange)
        dismiss(animated: true)
    }
    @IBAction func redPressed(_ sender: Any) {
        delegate?.update(text: "Red", color: .red)
        dismiss(animated: true)
    }
    
}
