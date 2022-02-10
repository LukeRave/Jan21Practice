//
//  SecondViewController.swift
//  tabBarStates
//
//  Created by Luat on 1/28/22.
//

import UIKit

class QuantityInfoViewController: UIViewController {

    var state: QuantityInfo?
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var dosageTextField: UITextField!
    @IBAction func handleUpdate(_ sender: Any) {
        updateData()
        updateUI()
    }
    
    @IBOutlet weak var emailLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    
    func updateUI() {
        timeTextField.text = String(state?.totalTime ?? 0)
        dosageTextField.text = String(state?.dosage ?? 0)
        emailLabel.text = state?.email
    }
    func updateData() {
        state?.totalTime = Double(timeTextField.text ?? "") ?? 0
        state?.dosage = Double(dosageTextField.text ?? "") ?? 0
    }
    
}

extension QuantityInfoViewController: QuantityInfoManager {
    func setState(state: QuantityInfo) {
        self.state = state
    }
}
