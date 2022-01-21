import UIKit

var greeting = "Hello, playground"

/// OOP: Encapsulation, abstraction, polymorphism, inheritance
class Animal {
    /// Access modifier: open, public, internal, fileprivate, private
    private var weight = 0
    
    static func run() {
        
    }
    
    func eat() {
        
    }
    
    func changeWeight(newWeight: Int) {
        weight = newWeight
    }
    
    func makeSound() {
        
    }
    
}

class Dog: Animal {
    
    override func makeSound() {
        print("woof")
    }
    
}

let animalOne = Animal()
animalOne.makeSound()
//animalOne.weight = 1000

Animal.run()

class CreditCard: Equatable {
    static func == (lhs: CreditCard, rhs: CreditCard) -> Bool {
        return lhs.number == rhs.number
    }
    
    var number: Int
    
    init(number: Int) {
        self.number = number
    }
}

let cc = CreditCard(number: 1234431234)

protocol Repaintable {
    var color: String { get set }
    mutating func repaint(color: String)
}


class MotorVehicle {
    var numWheels: Int
    var color: String
    
    init(numWheels: Int, color: String) {
        self.numWheels = numWheels
        self.color = color
    }
    
    func drive() {
        print("MotorVehicle: driving \(color) vehicle")
    }
}

class Car: MotorVehicle, Repaintable {
    func repaint(color: String) {
        self.color = color
    }
    
    var make: String
    
    init(color: String, make: String) {
        self.make = make
        super.init(numWheels: 4, color: color)
    }

    override func drive() {
        print("Car: driving \(color) \(make)")
    }
    
    func drive(numMiles: Int) {
        print("driving \(color) \(make) for \(numMiles)")
    }
}

class Electric {
    var numKilowatts = 100
}

/// Swift only has single inheritance for class
//class ElectricCar: Electric, Car {
//
//}

let myMotorCycle = MotorVehicle(numWheels: 2, color: "Green")

let myCar = Car(color: "silver", make: "Toyota")
myCar.color
myCar.make

let myDuplicatedCar = myCar

/// Passed by reference, all pointers will reflect the original object
func repaint(car: Car, color: String) {
    car.color = color
}

myDuplicatedCar.color
repaint(car: myCar, color: "blue")

myCar.color
myDuplicatedCar.color

let vehicles = [myMotorCycle, myCar]

for vehicle in vehicles {
    vehicle.drive()
}


/// Struct: faster and more performant
/// value type: passed by copy
/// Copy-on-write
/// When changed, needs to be var (not let)
/// Automaticly generated constructor
/// Use mutating function to change properties
/// No OOP inheritance. Use Protocol Conformance

struct House: Repaintable {
    var color: String
    init(color: String) {
        self.color = color
    }
    
    mutating func repaint(color: String) {
        self.color = color
    }
    
    func describe() -> String {
        return "Year color"
    }
}

var myHouse = House(color: "black")
var myDuplicatedHouse = myHouse

myHouse.color
myDuplicatedHouse.color

//myHouse.color = "pink"
myHouse.repaint(color: "red")

myHouse.color
myDuplicatedHouse.color


