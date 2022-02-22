//
//  FirstFormViewController.swift
//  FormApplication
//
//  Created by Luat on 2/22/22.
//

import UIKit

class FirstFormViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    
    var builder = FormModel.Builder()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = segue.destination as? SecondFormViewController else {
            return
        }
        saveForm()
        sender.builder = builder
    }
    
    func saveForm() {
        guard let firstName = firstNameTextField.text,
              let lastName = lastNameTextField.text,
              let age = ageTextField.text
        else {
            return
        }
        _ = builder.set(firstName: firstName)
            .set(lastName: lastName)
            .set(age: age)
    }

}
