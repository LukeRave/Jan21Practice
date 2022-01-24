import UIKit

var greeting = "Hello, playground"
//07Enum

enum Furniture{
    case chair
    case table
    case tv
}


enum LightState{
    case on(Double)
    case off
}

let peiceone = Furniture.chair
let peiceTwo = Furniture.table

switch peiceone {
case Furniture.chair:
    print("used to sit")
case Furniture.table:
    print("place in center")
case .tv:
    print("Don't Break!")
}

var state = LightState.off
state = LightState.on(2.5)


switch state{
case .off:
    print("Lights off")
case .on(let dimmingDouble):
    print("Lights have been set to \(dimmingDouble)")
}
//Enum: rawValue
enum Planet: Int {
    case mercury, venus, earth
}

let myPlanet = Planet.venus
print(myPlanet.rawValue)

//for key in library.keys {
// library[key]
//}

extension Planet: Equatable {
    
}


