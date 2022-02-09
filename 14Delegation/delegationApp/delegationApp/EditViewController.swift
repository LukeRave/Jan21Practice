//
//  EditViewController.swift
//  delegationApp
//
//  Created by Luat on 1/31/22.
//

import UIKit



class EditViewController: UIViewController {

    @IBOutlet weak var editTextField: UITextField!
    @IBAction func handleUpdate(_ sender: Any) {
        delegate?.update(text: editTextField.text ?? "")
        dismiss(animated: true)
    }
    
    var delegate: UpdateTextProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

  

}
