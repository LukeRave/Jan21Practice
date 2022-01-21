import UIKit

extension String {
    func getIntValue() -> Int {
        if let intValue = Int(self) {
            return intValue
        } else {
            return -1
        }
    }
}

"asdf".getIntValue()
let myInt: Int = "10".getIntValue()

class First {
    func a() {
        print("a from First class")
    }
}

class Second: First {
    override func a() {
        print("a from Second class")
    }
    
}

extension First {
    func b() {
        print("b from First extension")
    }
}

let first = First()
first.a()
first.b()

let second = Second()
second.a()
second.b()

struct Person {
    var fname: String = "No fname yet"
    var lname: String = "no lname yet"
    var email: String = "place@gmail.com"
}

/// Extension to add conformance to protocol
extension Person: Hashable {

}

/// Extensions can hold functions and computed properties, but not stored properties
extension Person {
    /// Computed property is similar a function
    var fullName: String {
        get {
            return "Computed: " + fname + " " + lname
        }
    }
    func getFullName() -> String {
        return fname + " " + lname
    }
    
    /// Computed property:
    /// Getter to get some other stored property
    /// Setter to do logic and set other values indirectly, not to set its own value (it has no value by itself)
    var emailIntermediate: String {
        get {
            return email
        }
        set {
            print(newValue)
            if newValue.contains("@") {
                email = newValue
                /// Next line will crash
//                emailIntermediate = newValue
            } else {
                print("newValue not valid")
            }
        }
    }
    
    func tellTime() {
        print(Date())
    }
}

let person = Person(fname: "Anakin", lname: "Skywalker")
person.tellTime()

/// Hashable protocol allows for Person type to be used as key in dictionary
var personMedals: [Person: Int] = [:]
let mikePhelps = Person(fname: "Mike", lname: "p")
var me = Person(fname: "luke", lname: "p")

personMedals[mikePhelps] = 18
personMedals[me] = 0
print(personMedals)

me.email
me.emailIntermediate
me.emailIntermediate = "luke@gmail.com"
print(me.emailIntermediate)

/// Using access modifier to kee location variable private to the declaring type
struct Address {
    private var _location: String = "no location"
    
    var location: String {
        get {
            _location
        }
        set {
            if validate(newValue) {
                _location = newValue
            }
        }
    }
    func validate(_ newLocation: String) -> Bool {
        return true
    }
}

let address = Address()
address.location

