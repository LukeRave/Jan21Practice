import UIKit

var greeting = "Hello, playground"
/*
01Strings
02ArraysAndClosure
03SetDictionaryOptionals
04ClassStruct
05AutolayoutScreens
06Procotol
07Enum
 
Cam: 01 - last problem
Darrion: 06 - manipulating dictionary
Matthew: 03 - optionals / syntax
Issac: 04 / 06
Tim: 06
*/




enum Furniture {
    case chair
    case table
    case tv
    case couch
    
    func getProductId() -> Int {
        switch self {
        case .chair:
            return 101
        case .table:
            return 102
        case .tv:
            return 103
        case .couch:
            return 104
        }
    }
}

let peiceOne = Furniture.chair
let peiceTwo = Furniture.table

func use(peice: Furniture) {
    switch peice {
    case .chair:
        print("use to sit")
    case .table:
        print("place in center")
    case .tv:
        print("don't break")
    case .couch:
        print("sofa")
    }
}

var inventory = [
    101: Furniture.chair,
    102: Furniture.table,
    103: Furniture.tv
]

inventory[104] = .couch

for key in inventory.keys {
    inventory[key] = .chair
}

/// Enum: Associated Value
enum LightState {
    case on(Double)
    case off
}

var halfState = LightState.off
halfState = LightState.on(0.5)

var threeQuartersState = LightState.on(0.75)

switch halfState {
case .off:
    print("lights off")
case .on(let dimmingDouble):
    print("lights set to \(dimmingDouble)")
}

/// Enum: Raw value
enum Planet: Int {
    case mercury = 1, venus = 10, earth = 100
    case mars = 200
    
    var location: String {
        return "Solar Sytem"
    }
    
    func getOxyLevel() -> Double {
        return 0.81
    }
}

let myPlanent = Planet.mercury
let myPlanentTwo = Planet.mercury

print(myPlanent.rawValue)
print(myPlanentTwo.rawValue)

let myEarth = Planet(rawValue: 1)


extension Planet: Equatable {
    /// Computed Property
    var description: String {
        switch self {
        case .earth:
            return "livable"
        default:
            return "danger"
        }
    }
}

/// Used for constants
enum Constants: String {
    case termsAndConditions = "asdfef asefahs;a sd;f ajs;dflj as;dflkja s;lkefj aslkefj ;askljef "
}

print(Constants.termsAndConditions.rawValue)

/// Enum holding closures as associated value
enum Operation {
    case takesTwoNums((Double, Double) -> Double)
    case takesOneNum((Double) -> Double)
}

let mathOperations: [String: Operation] = [
    "+": Operation.takesTwoNums( {$0 + $1} ),
    "-": Operation.takesTwoNums { $0 - $1 },
    "√": Operation.takesOneNum( {sqrt($0)} )
]

let mathOperationsFunc: [String: (Double, Double) -> Double] = [
    "+": { $0 + $1 },
    "-": { $0 - $1 },
    "√": { sqrt($0 + $1) }
]
