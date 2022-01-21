import UIKit

var mySet: Set<Int> = [1,1,2,3,4]

// MARK: - Unwrapping Optionals
let firstEle = mySet.first
/// 1. Force Unwrap (worst method but easiest)
print("Forced Unwrapped", firstEle!)


/// 2. Optional binding with if let or if var
if let num = firstEle {
    print(num, "Optional Binding If Let value: \(num)")
} else {
    print("first ele is nil")
}

/// Optional binding with guard let
guard let num = firstEle else {
    fatalError("prevent execution from moving on if value is nil")
}
print("Optional Binding Guard Let: ", num)

/// 3. Nil coalescing (if you have a meaningful default value)
print(firstEle ?? 0)

let strSet: Set<String> = []
let firstStr = strSet.first
print("First String:", firstStr ?? "No string here")

/// 4. Optional Chaining (allows to step into optional type to access its members)
class Person {
    let name: String
    let location: Location?
    init(name: String, location: Location?) {
        self.name = name
        self.location = location
    }
    
}
struct Location {
    let address: String
}
let myLoc = Location(address: "Philly")
let optLuke: Person? = Person(name: "luke", location: myLoc)
let name = optLuke?.name
let address = optLuke?.location?.address

if let person = optLuke {
    if let location = person.location {
        let address = location.address
        print(address)
    }
}

print(name)
if let name = name {
    print("name exists:", name)
}

/// 5. Implicitly unwrapped (implied force unwrapped, declared a forced optional)

let optString: String! = "opt Str"
print("opt string:", optString)
let myNewStr: String = optString
print("my new str:", myNewStr)


/// 6. "switch" on optional variable for nil or value case (not commonly used)
let optIntCase: Int?  = 9
switch optIntCase {
case .some(let value):
    print(value)
case .none:
    print("no value")
}
