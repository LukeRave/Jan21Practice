//
//  EditViewController.swift
//  delegationApp
//
//  Created by Luat on 1/31/22.
//

import UIKit



class EditViewController: UIViewController {
    
    var delegate: UpdateTextProtocol?
    
    @IBAction func Green(_ sender: UIButton) {
        delegate?.update(color: .green)
        dismiss(animated: true)
    }
    
    @IBAction func Red(_ sender: UIButton) {
        delegate?.update(color: .red)
        dismiss(animated: true)
    }
    
    @IBAction func Blue(_ sender: UIButton) {
        delegate?.update(color: .blue)
        dismiss(animated: true)
    }
    
    @IBAction func Yellow(_ sender: UIButton) {
        delegate?.update(color: .yellow)
        dismiss(animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
