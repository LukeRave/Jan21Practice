//
//  ViewController.swift
//  tabBarStates
//
//  Created by Luat on 1/28/22.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    var state: UserInfo?
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBAction func handleUpdate(_ sender: Any) {
        updateData()
        updateUI()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    
    func updateUI() {
        nameTextField.text = state?.name
        emailTextField.text = state?.email
    }
    func updateData() {
        state?.name = nameTextField.text ?? ""
        state?.email = emailTextField.text ?? ""
    }
}

extension UserInfoViewController: UserInfoManager {
    func setState(state: UserInfo) {
        self.state = state
    }
}
