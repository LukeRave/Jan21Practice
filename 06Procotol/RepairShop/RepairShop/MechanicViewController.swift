//
//  MechanicViewController.swift
//  RepairShop
//
//  Created by Rave Bizz on 1/25/22.
//

import UIKit

class MechanicViewController: UIViewController {


    @IBOutlet weak var inspectList: UILabel!
//    var inspectionList: [Vehicle] = []
//    var model: String?
//    var make: String?
//    var id: Int?
//    var wNum: Int?
//    var aNum: Int?
//    var bNum: Int?
    var myTitle: String?
    var inList: String?
    
    @IBAction func renderInspectList(_ sender: Any) {
        inspectList.text = "4"
        print(inList)
    
    }
    
//
    override func viewDidLoad() {
        super.viewDidLoad()
        title = myTitle

//        inspectList.text = inList
//        
//        let iList: [String] = inspectionList.map { vehicle in
//                make = vehicle.make
//                model = vehicle.model
//                id = vehicle.id
//                wNum = vehicle.wheels
//                aNum = vehicle.acceleration
//                bNum = vehicle.braking
//                
//                return "\nID: \(id!) Make: \(make!) Model: \(model!) Wheels: \(wNum!)"
//        }
//        var x = ""
//        for str in iList{
//            x = x + str
//        }
//        inspectList.text = x
        // Do any additional setup after loading the view.
    }
    
    
    
    
    

}
