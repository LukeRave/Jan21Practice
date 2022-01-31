//
//  ViewController.swift
//  IsaacsDelegatePattern
//
//  Created by Isaac Farr on 1/31/22.
//

import UIKit

class ViewController: UIViewController, ColorChangeDelegate {
    
    
    func setColor(color: UIColor){
        self.view.backgroundColor = color;
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "OtherVC" {
               let vc: SecondVC = segue.destination as! SecondVC
               vc.delegate = self
           }
       }
}

protocol ColorChangeDelegate {
    func setColor(color: UIColor)
}
