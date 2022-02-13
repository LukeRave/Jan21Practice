//
//  ViewController.swift
//  delegationApp
//
//  Created by Luat on 1/31/22.
//

import UIKit

class ViewController: UIViewController, UpdateTextProtocol {
    
    @IBOutlet var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navForward()
    }

    func update(color: UIColor) {
        self.view.backgroundColor = color
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? EditViewController {
            vc.delegate = self
        }
    }
    
    func navForward() {
        if let vc = storyboard?.instantiateViewController(identifier: "asdf") as? EditViewController {
                vc.delegate = self
            self.present(vc, animated: true)
        }
    }
}

protocol UpdateTextProtocol {
    func update(color: UIColor)
}
