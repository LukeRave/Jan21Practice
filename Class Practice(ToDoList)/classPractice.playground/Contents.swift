import UIKit

var greeting = "Hello, playground"

class MotorVehicle {
    var numWheels: Int
    var color: String
    init(numWheels: Int, color: String){
        self.numWheels = numWheels
        self.color = color
    }
    //Passed by reference, all pointer will reflect to the original object
    func drive(){
        print("Driving")
    }
}

class Car: MotorVehicle {
    var make: String
    init(color: String, make: String) {
        self.make = make
        super.init(numWheels: 4, color: color)
        self.color = "red"
    }
    
    override func drive() {
        print("Driving \(color) \(make)")
    }
}

class Electric {
    var numKilowatts = 100
}

//Swift only has single inheritance for classes
//class ElectricCar: Electric, Car {
//
//}

let myCar = Car(color: "Silver", make: "Ford")

myCar.make
myCar.color

func repaint(car: Car, color: String) {
    car.color = color;
}

repaint(car: myCar, color: "Black")

let myMotorCycle =  MotorVehicle(numWheels: 2, color: "Black")

let vehicles = [myMotorCycle, myCar]

for vehicle in vehicles{
    vehicle.drive()
}

///Go to method instead of classes
///Structures
///Automatic constructor
///Value type: passed by copy
///Use mutating func to mutate the object
///No OOP   inheritance. Use Protocol Conformance
protocol Repaintable {
    mutating func repaint(color: String)
}
struct House: Repaintable {
    var color: String
    init(color:String) {
        self.color = color
    }
    
    mutating func repaint(color: String){
        self.color = color
    }
}

var myHouse = House(color: "Black")
//myHouse.color = "Pink"

//can't change the color of a struct this way. The house object has become a "let" constant. Immutabe
//func repaint(house: House, color: String) {
//    house.color = color
//}

//repaint(house: myHouse, color: "Black")

myHouse.repaint(color: "Black")


struct ToDoList: Equatable {
    var list:[String]
    
    mutating func addTask(task: String){
        list.append(task)
    }
    
    func printList(){
        print(list)
    }
    mutating func removeTask(num: Int){
        list.remove(at: num)
    }
    func checkTasks(task: String) -> Bool {
        return
            list.contains(task)
    }
    
}

var myToDoList = ToDoList(list: ["Make the Breakfast", "Eat the Breakfast", "Be the Breakfast"])

myToDoList.printList()
myToDoList.addTask(task: "Smell the Breakfast")
myToDoList.printList()
myToDoList.checkTasks(task: "Eat Cheese")
myToDoList.removeTask(num: 0)
myToDoList.printList()
