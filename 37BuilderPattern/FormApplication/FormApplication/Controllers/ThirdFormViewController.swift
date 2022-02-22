//
//  ThirdFormViewController.swift
//  FormApplication
//
//  Created by Luat on 2/22/22.
//

import UIKit

class ThirdFormViewController: UIViewController {

    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var SSNTextField: UITextField!
    @IBOutlet weak var DLTextField: UITextField!
    
    var builder: FormModel.Builder?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = segue.destination as? FormSummaryViewController else {
            return
        }
        saveForm()
        sender.builder = builder
    }
    
    func saveForm() {
        guard let phoneNumber = phoneNumberTextField.text,
              let SSN = SSNTextField.text,
              let DL = DLTextField.text
        else {
            return
        }
        _ = builder?.set(phoneNumber: phoneNumber)
            .set(SSN: SSN)
            .set(DL: DL)
    }
}
