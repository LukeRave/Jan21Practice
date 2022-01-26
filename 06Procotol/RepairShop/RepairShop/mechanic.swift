//
//  mechanic.swift
//  RepairShop
//
//  Created by Rave Bizz on 1/26/22.
//

import Foundation

struct Mechanic {
    var name: String
    
    
    func viewList(list: [Vehicle]) -> String{
        return ""
    }
    
    func add(vehicle: Vehicle,list: inout [Vehicle] ) -> [Vehicle]{
        list.append(vehicle)
        return list
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
    
    func repair(list: inout [Vehicle], inspectList: inout [Vehicle]) -> [Vehicle] {
        for index in 0..<list.count {
            if list[index].braking != 0, list[index].acceleration != 0{
                if list[index].acceleration == 1, list[index].braking == 1{
                    list[index].acceleration = 0
                    list[index].braking = 0
                    inspectList.append(list[index])
                    list.remove(at: index)
                } else if list[index].acceleration == 1{
                    list[index].acceleration = 0
                    inspectList.append(list[index])
                    list.remove(at: index)
                } else if list[index].braking == 1{
                    list[index].braking = 0
                    inspectList.append(list[index])
                    list.remove(at: index)
                }
            }
        }
        return inspectList
    }
    
}
