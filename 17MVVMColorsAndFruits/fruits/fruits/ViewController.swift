//
//  ViewController.swift
//  fruits
//
//  Created by Rave Bizz on 2/1/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var sugarLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var fatLabel: UILabel!
    @IBOutlet weak var protienLabel: UILabel!
    @IBOutlet weak var fruitLabel: UILabel!
    
    @IBAction func submitButton(_ sender: Any) {
        if let fruit = textField.text{
            getData(for: fruit)
        }
    }

    let viewModel = ViewModel()
    
    
    func getData(for fruit: String){
        viewModel.getData(for: fruit, completion:{
            [weak self] in
            guard  let welf = self else {
                return
            }
            welf.setFat(with: welf.viewModel.getFat())
            welf.setSugar(with: welf.viewModel.getSugar())
            welf.setProtien(with: welf.viewModel.getProtien())
            welf.setCalories(with: welf.viewModel.getCalories())
            if let name = welf.viewModel.getName(){
                welf.setFruit(with: name)
            }
        })
    }
    
    func setProtien(with name: String){
        protienLabel.text = name
    }
    
    func setFruit(with name: String){
        fruitLabel.text = name
    }
    
    func setFat(with name: String){
        fatLabel.text = name
        
    }
    
    func setCalories(with name: String){
        caloriesLabel.text = name
    }
    
    func setSugar(with name: String){
        sugarLabel.text = name
    }
}

