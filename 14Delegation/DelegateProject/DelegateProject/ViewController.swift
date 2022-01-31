//
//  ViewController.swift
//  DelegateProject
//
//  Created by Rave Bizz on 1/31/22.
//

import UIKit

protocol PassData {
    func update(text: String, color: UIColor)
}
class ViewController: UIViewController,PassData {
   
    

    @IBOutlet weak var mainLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if let vc = segue.destination as? updateViewController {
            vc.delegate = self
        }
    }
    
    func update(text: String, color: UIColor) {
        self.mainLabel.text = text
        self.view.backgroundColor = color
    }

}


