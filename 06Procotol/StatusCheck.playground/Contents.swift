import UIKit

var greeting = "Hello, playground"

enum Furniture {
    case chair
    case table
    case tv
    case couch
}

let pieceOne = Furniture.chair

let pieceTwo = Furniture.table

switch pieceOne {
case .chair:
    print("use to sit")
case .table:
    print("place in center")
// Don't need to specify Furniture
case .tv:
    print("don't break")
case .couch:
    print("sofa")
default:
    print("Idk")
}

var inventory: [Int: Furniture] = [
    101: .chair,
    102: .table,
    103: .tv
]

inventory[104] = .couch

// Enum: Associated value
enum LightState {
    case on(Double)
    case off
}

var state = LightState.off
state = LightState.on(0.5)

switch state {
case .off:
    print("lights off")
case .on(let dimmingDouble):
    print("lights set to \(dimmingDouble)")
}

// Enum: raw value
enum Planet: Int {
    case mercury, venus, earth
    case mars

//    no stored properties in enum
//    var location = "Solar System"
    
    func getOxyLevel() -> Double {
        return 0.01
    }
}

let myPlanet =  Planet.venus
print(myPlanet.rawValue)

let myEarth = Planet(rawValue: 2)

extension Planet: Equatable {
    var description: String {
        switch self {
        case .earth:
            return "livable"
        default:
            return "danger"
        }
    }
}

// Used for constants
enum Constants: String {
    case termsAndConditions = "askdnadlks lkda lkaadlml als m as mlaal"
}

print(Constants.termsAndConditions.rawValue)

enum Operation {
    case takesTwoNums((Double, Double) -> Double)
    case takesOneNum((Double) -> Double)
}

let mathOperations = [
    "+": Operation.takesTwoNums( {$0 + $1} ),
    "-": Operation.takesTwoNums( {$0 - $1} ),
    "√": Operation.takesOneNum( {sqrt($0)} )

]

let mathOperationsFunc: [String: (Double, Double) -> Double] = [
    "+": {$0 + $1},
    "-": {$0 - $1},
    "√": {sqrt($0 + $1)}
]
