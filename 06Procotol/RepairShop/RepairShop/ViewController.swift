//
//  ViewController.swift
//  RepairShop
//
//  Created by Rave Bizz on 1/21/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var wheels: UITextField!
    @IBOutlet weak var acceleration: UITextField!
    @IBOutlet weak var braking: UITextField!
    @IBOutlet weak var make: UITextField!
    @IBOutlet weak var model: UITextField!
    
    var inspectionList: [Vehicle] = []


    
    @IBAction func submitData(_ sender: UIButton) {
        print(inspectionList)
        var car = Vehicle(wheels: Int(wheels.text!) ?? 0, acceleration: Int(acceleration.text!) ?? 0, braking: Int(braking.text!) ?? 0, id: Int.random(in: 1..<100), make: make.text!, model: model.text!)
        inspectionList.append(car)
        for element in inspectionList{
            if element.id == car.id{
                car.newId()
                inspectionList.append(car)
            }else{
                inspectionList.append(car)
            }
        }
        print(inspectionList, "1")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = self.navigationController?.viewControllers.first(where: {
            c in
            return c.title == "Inspection List"
        })
        vc.inList = inspectionList
    }
    
}

