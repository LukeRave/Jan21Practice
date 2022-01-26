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
    var repairList: [Vehicle] = []
    
    @IBAction func submitData(_ sender: Any) {
        let wNum: String = wheels.text!
        let aNum: String = acceleration.text!
        let bNum: String = braking.text!
        let carMake: String = make.text!
        let carModel: String = model.text!
        let id: Int = Int.random(in: 1..<100)
        
        
        
        
        var car = Vehicle(wheels: Int(wNum) ?? 0, acceleration: Int(aNum) ?? 0, braking: Int(bNum) ?? 0, id: id, make: carMake, model: carModel)
        
        for element in inspectionList{
            if element.id == car.id{
                car.newId()
                inspectionList.append(car)
            }
        }
        
        let bob = Mechanic(name: "Bob");
        
        bob.viewList(list: inspectionList)
        bob.add(vehicle: car, list: &inspectionList)
        bob.viewList(list: inspectionList)
        bob.inspectVehicle(list: &inspectionList, newList: &repairList)
        bob.viewList(list: repairList)
        bob.viewList(list: inspectionList)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        var inspectionList: [Vehicle] = []
//        var cmodel: String = ""
//        var cmake: String = ""
//        var cid: Int = 0
//        var cwNum: Int = 0
//        var caNum: Int = 0
//        var cbNum: Int = 0
        let mechanicVC = segue.destination as? MechanicViewController
            mechanicVC.myTitle = "Mechanic's ViewPoint"
//            let iList: [String] = inspectionList.map { vehicle in
//                    cmake = vehicle.make
//                    cmodel = vehicle.model
//                    cid = vehicle.id
//                    cwNum = vehicle.wheels
//                    caNum = vehicle.acceleration
//                    cbNum = vehicle.braking
//
//                    return "\nID: \(cid) Make: \(cmake) Model: \(cmodel) Wheels: \(cwNum)"
//            }
//            var x = ""
//            for str in iList{
//                x += str
//            }
//
//            mechanicVC.inList = x
//        }
//        else{
//            // catch errors
//            print("Something went wrong")
//        }
       
        
        
        
        
       
    }
    
}

