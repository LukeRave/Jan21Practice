//
//  Logic.swift
//  MechanicsShop
//
//  Created by ravebizz on 1/24/22.
//

import Foundation

class Mechanic {
    var customers: [Customer] = []
    var inspectionQueue = InspectionQueue()
    var repairsQueue = RepairsQueue()
    
    func addCustomer(customer: Customer) {
        customers.append(customer)
        addCarsToInspectionQueue(customer: customer)
    }
    
    func addCarsToInspectionQueue(customer: Customer) {
        inspectionQueue.addCarToInspect(car: customer.car as! Car, type: customer.inspectionType)
    }
    
    func inspectCar() {
        if let (car, inspectionType) = inspectionQueue.carsToInspect.first {
            let inspectionStatus = car.inspect(type: inspectionType)
            if (inspectionStatus == -1) {
                inspectionQueue.carsToInspect.removeFirst()
                print("car: \(car) is fine, all inspections passed!")
            } else {
                repairsQueue.addCarToRepair(car: car, type: inspectionStatus)
            }
        } else {
            print("No cars to inspect!")
        }
    }
    
    func repairCar() {
        if let (car, inspectionType) = repairsQueue.carsToRepair.first {
            print("Repair attempted for car: \(car)")
            repairsQueue.carsToRepair.removeFirst()
            inspectionQueue.addCarToInspect(car: car, type: inspectionType)
        } else {
            print("No cars to repair!")
        }
    }
    
}

protocol CarProtocol {
    func drive()
}

class Car: CarProtocol {
    
    let id: Int
    let make: String
    let model: String

    init(id: Int, make: String, model: String) {
        self.id = id
        self.make = make
        self.model = model
    }
    
    func drive() {
        print("Vroom Vroom")
    }
    
    func inspect(type: Int) -> Int {
        let randomNumber = Int.random(in: 0...10)
        if (type == 0) {
            // pass test
            if (randomNumber > 3) {
                return -1
            } else {
                return 0
            }
        } else if (type == 1) {
            // pass test
            if (randomNumber > 5) {
                return -1
            } else {
                return 1
            }
        } else {
            // pass both test
            if (randomNumber > 8) {
                return -1
            // fail second test only
            } else if (randomNumber > 5) {
                return 1
            // fail first test only
            } else if (randomNumber > 3) {
                return 0
            } else {
                return 2
            }
        }
    }
    
    func repair() -> Bool {
        return true
    }
}

class Customer {
    let car: CarProtocol
    let inspectionType: Int
    
    init(car: Car, inspectionType: Int) {
        self.car = car
        self.inspectionType = inspectionType
    }
    
}

struct InspectionQueue {
    var carsToInspect: [(Car, Int)] = []
    
    mutating func addCarToInspect(car: Car, type: Int) {
        self.carsToInspect.append((car,type))
    }
}

struct RepairsQueue {
    // 0, 1, 2 are orders for repair of acceleration, braking, or both, respectively
    var carsToRepair: [(Car,Int)] = []
    
    mutating func addCarToRepair(car: Car, type: Int) {
        self.carsToRepair.append((car,type))
    }
}


