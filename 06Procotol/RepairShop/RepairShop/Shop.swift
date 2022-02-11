//
//  shopFunctionality.swift
//  RepairShop
//
//  Created by Rave Bizz on 1/21/22.
//

import Foundation
import UIKit
//"Ben Derhover"

struct Shop {
    var inspectionList: [Vehicle]
    var repairList: [Vehicle]
    
    
}

func update(list: [Vehicle], label: UILabel){
    var x = ""
    let data: [String] = list.map { vehicle in
        let make = vehicle.make
        let model = vehicle.model
        let id = vehicle.id
        let wNum = vehicle.wheels
        
        return "\nID: \(id) Make: \(make) Model: \(model) Wheels: \(wNum)"
    }
    for str in data{
        x += str
    }
    label.text = x
}

