import UIKit

struct Shop {
    var employees: [Mechanic]
    var inspectQueue: [Vehicle] = []
    var repairQueue: [Vehicle] = []
}

class Vehicle: VehicleIdentifiers {
    var make: String
    var model: String
    var id: Int
    var inspections: Requests
    // false status = fail  true status = pass
    var status: Bool?
    
    init(make: String, model: String, id: Int, inspections: Requests){
        self.make = make
        self.model = model
        self.id = id
        self.inspections = inspections
    }
}

class Mechanic: Inspect {
    var shop: Shop
    
    init(shop: Shop){
        self.shop = shop
    }
    
    func viewInspectList(shop: Shop) {
        print(shop.inspectQueue)
    }
    
    func viewRepairList(shop: Shop) {
        print(shop.repairQueue)
    }
    
    func addVehicleInspectQueue(vehicle: Vehicle){
        shop.inspectQueue.append(vehicle)
    }
    
    func runInspect() {
        let vehicle = shop.inspectQueue[0]
        shop.inspectQueue.remove(at: 0)
        let inspections = vehicle.inspections
        vehicle.status = true
        if inspections.both != nil {
            for _ in 1...2 {
                if !Bool.random() {
                    vehicle.status = false
                    shop.repairQueue.append(vehicle)
                    break
                }
            }
        } else {
            if !Bool.random() {
                vehicle.status = false
                shop.repairQueue.append(vehicle)
            }
        }
        print(vehicle)
        print("Passed Inspections: \(String(describing: vehicle.status))")
    }
    
    func markRepaired() {
        let vehicle = shop.repairQueue[0]
        shop.repairQueue.remove(at: 0)
        shop.inspectQueue.append(vehicle)
        vehicle.status = true
    }
}

struct Customer {
    var vehicle: Vehicle
    var requested: Requests
    func requestInspection (acceleration: Bool, braking: Bool, both: Bool, owner: Vehicle){
        _ = Requests(acceleration: acceleration, braking: braking, both: both, owner: self.vehicle)
    }
}

struct Requests {
    var acceleration: Bool?
    var braking: Bool?
    var both: Bool?
    var owner: Vehicle

    
    init(acceleration: Bool, braking:Bool, both: Bool, owner: Vehicle){
        self.acceleration = acceleration
        self.braking = braking
        self.both = both
        self.owner = owner
        
        if both {
            self.acceleration = true
            self.braking = true
        }
    }
        
}

protocol VehicleIdentifiers {
    var make : String {get}
    var model : String {get}
    var id : Int {get}
}

protocol Inspect {
    func viewInspectList(shop: Shop)
    func viewRepairList(shop: Shop)
    func runInspect()
    func markRepaired()
}


