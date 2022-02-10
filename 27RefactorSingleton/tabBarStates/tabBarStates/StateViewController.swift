//
//  StateViewController.swift
//  tabBarStates
//
//  Created by Luat on 1/28/22.
//

import UIKit

class StateViewController: UIViewController {

    var state: AppData?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dosageLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    
    func updateUI() {
        nameLabel.text = state?.name
        emailLabel.text = state?.email
        timeLabel.text = String(state?.totalTime ?? 0)
        dosageLabel.text = String(state?.dosage ?? 0)
    }

}

extension StateViewController: StateManager {
    func setState(state: AppData) {
        self.state = state
    }
}
