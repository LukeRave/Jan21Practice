//
//  FormSummaryViewController.swift
//  FormApplication
//
//  Created by Luat on 2/22/22.
//

import UIKit

class FormSummaryViewController: UIViewController {

    // MARK: IBOutlets
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var DLLabel: UILabel!
    @IBOutlet weak var SSNLabel: UILabel!
    
    // MARK: IBAction
    @IBAction func handleSubmit(_ sender: Any) {
        print(builder?.build() ?? "")
        print("Submitted..")
    }
    
    // MARK: Properties
    var builder: FormModel.Builder?
    
    // MARK: Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels()
    }
    
    // MARK: Private Methods
    private func updateLabels() {
        guard let formModel = builder?.build() else {
            return
        }
        firstNameLabel.text = formModel.firstName
        lastNameLabel.text = formModel.lastName
        ageLabel.text = formModel.age
        cityLabel.text = formModel.city
        stateLabel.text = formModel.state
        addressLabel.text = formModel.address
        phoneNumberLabel.text = formModel.phoneNumber
        SSNLabel.text = formModel.SSN
        DLLabel.text = formModel.DL
    }
}
