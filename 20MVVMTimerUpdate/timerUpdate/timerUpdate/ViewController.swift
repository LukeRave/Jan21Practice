//
//  ViewController.swift
//  timerUpdate
//
//  Created by Luat on 2/2/22.
//

import UIKit

class ViewController: UIViewController {

    private var accessCodeLabel = UILabel()
    private var viewModel = AccessCodeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabel()
        viewModel.updateData()
        viewModel.updateUI = { model in
            self.accessCodeLabel.text = model?.getCode()
        }

    }


    func setupLabel() {
        view.addSubview(accessCodeLabel)
        accessCodeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            accessCodeLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            accessCodeLabel.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -15),
            view.trailingAnchor.constraint(equalTo: accessCodeLabel.trailingAnchor, constant: 20),
        ])
        
        accessCodeLabel.text = "Your access code"
        accessCodeLabel.textAlignment = .center
        accessCodeLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 30)
        accessCodeLabel.backgroundColor = .systemTeal
    }

}

