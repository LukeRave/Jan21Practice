import UIKit

// MARK: - Class

/// Class: can hold properties and methods
/// Properties: stored properties (or computed properties)
/// Methods: declare with func keyword, parameters, and return value
class Cat {
    /// Static property lives on the class type itself
    static let species = "Feline"
    
    /// Instance property lives on an instance/object of the class
    var age = 0
    
    /// "Let" is constant, "var" can change
    let color = UIColor.yellow
    
    /// An init function is required for any property that does not have a value
    var name: String
    init(name: String) {
        self.name = name
    }
    
    /// A function that takes no parameters and returns void
    func meow() {
        print("meow")
    }
    
    /// A function that takes a string and returns bool
    func shouldRespond(nameCalled: String) -> Bool {
        if nameCalled == name {
            return true
        } else {
            return false
        }
    }
}

class Location {
    let longitude: Double
    let latitude: Double
    
    /// Properties without initial values needs to be given a value by an initializer
    init(lng: Double, lat: Double) {
        longitude = lng
        latitude = lat
    }
}

class Person {
    
    var age = 0
    /// "name" has no value and needs to be given a starting value in init
    var name: String
    /// Optional properties are automatically set to nil
    var location: Location?
    
    init(name: String) {
        self.name = name
        self.location = Location(lng: 0.0, lat: 0.0)
    }
    
    /// Can have multiple init functions
    init() {
        name = "No name"
    }
    
    func changeName(newName: String) {
        name = newName
    }
    
    func travel() {
        print("travelling by vehicle")
    }
}

let al = Person()
al.changeName(newName: "Al")

let bob = Person(name: "Bob")

let identityThief = bob
bob.changeName(newName: "Bobby")

/// Both name are "Bobby"
print(bob.name)
print(identityThief.name)


class Wizard: Person {
    let house: House?

    init(house: House) {
        self.house = house
        super.init()
    }
    
    init(name: String, house: House) {
        /// Set current's class property first
        self.house = house
        /// Then call super.init to initialize superclass's properties
        super.init()
        /// Then can change superclass's property
        self.name = name
        self.location = Location(lng: 9.34, lat: 9.34)
    }
    
    /// Can override superclass functions
    override func travel() {
        print("travelling by magic")
    }
    
    deinit {
        print("memory being reclaimed")
    }
}

/// Enum to represent distinct scenarios/cases
enum House {
    case Gryffindor
    case Slytherin
    case Ravenclaw
    case Hufflepuff
}

let ron = Wizard(name: "Ron", house: House.Gryffindor)
ron.name
ron.location

/// Polymorphism
let people: [Person] = [bob, ron]
for person in people {
    person.travel()
}

/// Undertand how OOP applies to Swift
/// Understand all the differences between class vs struct
