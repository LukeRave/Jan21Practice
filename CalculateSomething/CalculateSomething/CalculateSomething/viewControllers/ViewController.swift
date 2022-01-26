//
//  ViewController.swift
//  CalculateSomething
//
//  Created by Rave Training on 1/25/22.
//

import UIKit
//instantiate the user input class
var inputInstance = UserInput()

class ViewController: UIViewController {
    //        Display Label formatting and constraints
    let displayLabel = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
//        General View formatting and View Variables
        displayLabel.backgroundColor = UIColor.lightGray
        self.view.backgroundColor = UIColor.black
        let buttonArray: [[String]] = [
            ["ln","log","!","√"],
            ["+","-","*","/"],
            ["1","2","3","%"],
            ["4","5","6","^"],
            ["7","8","9","π"],
            ["±","0",".","="]
        ];
//        let edgeOffset = 15

        self.view.addSubview(displayLabel)
        NSLayoutConstraint.activate([
            displayLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            displayLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            displayLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            displayLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
//        Button grid formatting and constraints
        let rowStackView = UIStackView()
        rowStackView.translatesAutoresizingMaskIntoConstraints = false
        for row in buttonArray {
            let buttonStackView = UIStackView()
            buttonStackView.translatesAutoresizingMaskIntoConstraints = false
            for ele in row {
                let button = UIButton()
                button.translatesAutoresizingMaskIntoConstraints = false
                button.setTitle(ele, for: .normal)
                button.backgroundColor = UIColor.blue
                button.titleLabel?.textColor = UIColor.white
                buttonStackView.addArrangedSubview(button)
                button.addTarget(self, action: #selector(handleButtonClick(button: )), for: .touchUpInside)
            }
            buttonStackView.alignment = .fill
            buttonStackView.distribution = .fillEqually
            buttonStackView.spacing = 5.0
            buttonStackView.axis = .horizontal
            rowStackView.addArrangedSubview(buttonStackView)
        }
        rowStackView.alignment = .fill
        rowStackView.distribution = .fillEqually
        rowStackView.spacing = 5.0
        rowStackView.axis = .vertical
        self.view.addSubview(rowStackView)
        NSLayoutConstraint.activate([
            rowStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            rowStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: edgeOffset)
        ])
        
    }
    @objc func handleButtonClick(button: UIButton) {
        inputInstance.handleInput(userInput: (button.titleLabel?.text)!!)
        displayLabel.text = inputInstance.currInput
    }
}

