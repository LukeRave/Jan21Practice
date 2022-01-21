import UIKit


/// Named Types: Class, Struct, Enum, Protocol

// MARK: - Struct: Value Type

struct City {
    let lat: Double = 0.0
    let name: String
    var motto: String
    
/// automattic generated initializer, don't have to write this init
//    init(name: String, motto: String) {
//        self.name = name
//        self.motto = motto
//    }
    
    /// Structs are immutable by default, have to use keyword "mutating" to change properties
    mutating func changeMotto(to motto: String) {
        self.motto = motto
    }
    
}

var philly = City(name: "Philly", motto: "No Motto yet")
philly.changeMotto(to: "Always Sunny")
print("Name:", philly.name, "Motto:", philly.motto)

var phillyTwo = philly

/// Value type: philly and phillyTwo are two separate copies
phillyTwo.changeMotto(to: "But Rainy in the fall")

/// Compare to changing a property on a class
print(philly.motto)
print(phillyTwo.motto)

func changeParams(city: inout City) {
    city.changeMotto(to: "Changed Motto")
}

changeParams(city: &philly)
print(philly.motto)
