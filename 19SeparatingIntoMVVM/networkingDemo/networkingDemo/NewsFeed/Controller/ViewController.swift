//
//  ViewController.swift
//  networkingDemo
//
//  Created by Luat on 1/27/22.
//

import UIKit
/*
 Incoming Data:
 Server -> Network Object -> ViewModel -> Model
 
 Outgoing Data:
 Model -> ViewModel -> View
 
 Controller shouldn't see data
 */

class ViewController: UIViewController {

    @IBOutlet weak var topLabel: UILabel!
    @IBAction func handleUpdate(_ sender: Any) {

    }
    
    private let viewModel = NewsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.updateData()
        viewModel.updateUI = { model in
            self.topLabel.text = model?.title
        }
    }
    


}
