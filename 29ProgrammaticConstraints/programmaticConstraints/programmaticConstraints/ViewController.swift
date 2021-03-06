//
//  ViewController.swift
//  programmaticConstraints
//
//  Created by Luat on 2/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    let labelOne = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    
    lazy var labelTwo: UILabel = {
        let label = UILabel()
        label.text = "Label Two"
        label.textAlignment = .center
        label.backgroundColor = .gray
        label.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: 100)
        return label
    }()
    
    let labelThree = UILabel(),
        labelFour = UILabel(),
        scrollView = UIScrollView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelOne.text = "Label one"
        labelThree.text = "Label three"
        labelFour.text = "Label four"

        view.addSubview(labelOne)
        view.addSubview(labelTwo)
        view.addSubview(scrollView)

        scrollView.addSubview(labelThree)
        scrollView.addSubview(labelFour)
        
        labelThree.backgroundColor = .systemTeal
        labelFour.backgroundColor = .yellow
        scrollView.backgroundColor = .magenta
        
        setupConstraints()
    }
    
    
    func setupConstraints() {
        setupScrollViewConstraints()
        setupLabelThreeConstraints()
        setupLabelFourConstraints()
    }
    
    func setupScrollViewConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: labelTwo.bottomAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    func setupLabelThreeConstraints() {
        labelThree.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelThree.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            labelThree.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 100),
            labelThree.widthAnchor.constraint(equalToConstant: 300),
            labelThree.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    func setupLabelFourConstraints() {
        labelFour.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelFour.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            labelFour.topAnchor.constraint(equalTo: labelThree.bottomAnchor, constant: 400),
            labelFour.widthAnchor.constraint(equalToConstant: 300),
            labelFour.heightAnchor.constraint(equalToConstant: 100),
            labelFour.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])
    }
}

