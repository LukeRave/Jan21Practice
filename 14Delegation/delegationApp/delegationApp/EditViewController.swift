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
        let colorText = editTextField.text?.uppercased()
            switch colorText  {
            case "GREEN":
                delegate?.update(text: editTextField.text ?? "", color: .green)
                dismiss(animated: true)
            case "RED":
                delegate?.update(text: editTextField.text ?? "", color: .red)
                dismiss(animated: true)
            case "BLUE":
                delegate?.update(text: editTextField.text ?? "", color: .blue)
                dismiss(animated: true)
            case "YELLOW":
                delegate?.update(text: editTextField.text ?? "", color: .yellow)
                dismiss(animated: true)
            default:
                delegate?.update(text: editTextField.text ?? "", color: .systemBackground)
                dismiss(animated: true)
            }
    }
    
    var delegate: UpdateTextProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

  

}
