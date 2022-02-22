//
//  SecondFormViewController.swift
//  FormApplication
//
//  Created by Luat on 2/22/22.
//

import UIKit

class SecondFormViewController: UIViewController {

    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var builder: FormModel.Builder?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = segue.destination as? ThirdFormViewController else {
            return
        }
        saveForm()
        sender.builder = builder
        
    }

    func saveForm() {
        guard let city = cityTextField.text,
              let state = stateTextField.text,
              let address = addressTextField.text
        else {
            return
        }
        _ = builder?.set(city: city)
            .set(state: state)
            .set(address: address)
    }

}
