//
//  shopFunctionality.swift
//  RepairShop
//
//  Created by Rave Bizz on 1/21/22.
//

import Foundation
//"Ben Derhover"
struct Mechanic {
    var name: String
    
    
    
    func viewList(list: [Vehicle]){
        print(list)
    }
    func inspectVehicle(list: inout [Vehicle], newList: inout [Vehicle]) -> [Vehicle]{
        for vehicle in list{
            if newList.contains(vehicle){
                continue
            }else if (vehicle.braking == 0), (vehicle.acceleration == 0) {
                let index = list.firstIndex(of: vehicle)
                list.remove(at: index!)
                print("Vehicle with id number \(vehicle.id) has no issues ")
            }else{
                newList.append(vehicle)
            }
        }
        return newList
    }
    func viewRepairList(){
        
    }
    func add(vehicle: Vehicle,list: inout [Vehicle] ) -> [Vehicle]{
        list.append(vehicle)
        return list
    }
    
}

struct Vehicle: Equatable {
    var wheels: Int
    var acceleration: Int
    var braking: Int
    var id: Int
    var make: String
    var model: String
    
//    func repair(){
//
//    }
    mutating func newId(){
        id = Int.random(in: 1..<100)
    }
}

