//
//  ViewController.swift
//  CalculateSomething
//
//  Created by Rave Training on 1/25/22.
//

import UIKit

class ViewController: UIViewController {
    ///global var declarations for view
    let displayLabel = UILabel()
    let rowStackView = UIStackView()
    let buttonArray: [[String]] = [
        ["ln","log","!","√"],
        ["+","-","*","/"],
        ["1","2","3","%"],
        ["4","5","6","^"],
        ["7","8","9","π"],
        ["±","0",".","="]
    ];
    ///instantiate the user input class
    var inputInstance = UserInput()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
//        let edgeOffset = 15
        initDisplayLabel()
        initCalcButtons()
    }
    ///initialize button propogation
    func initCalcButtons() {
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
    ///initialize display label for the calculator
    func initDisplayLabel() {
        displayLabel.backgroundColor = UIColor.lightGray
        self.view.addSubview(displayLabel)
        NSLayoutConstraint.activate([
            displayLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            displayLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            displayLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            displayLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    ///Generic function to handle button clicks
    @objc func handleButtonClick(button: UIButton) {
        inputInstance.handleInput(userInput: (button.titleLabel?.text)!!)
        displayLabel.text = inputInstance.currInput
        print(inputInstance.currInput)
    }
}

