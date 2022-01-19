import UIKit

var greeting = "Hello, playground"

var closure: (Int) -> () = { element in
    print(element)
}

func myFunc(num: Int) -> Void {
    print(num)
}

myFunc(num: 1)
closure(1)

func add(_ numOne: Int, with numTwo: Int = 10) -> Int {
    numOne + numTwo
}
//add(numOne: 3, numTwo: 4)
add(3, with: 3)

func doBlock(num: Int, block: (Int) -> Int) {
    block(num)
}
doBlock(num: 5, block: { print($0); return $0 })

doBlock(num: 10) { value in
    print("My value is: \(value)")
    return value
}

// --MARK: Set: Unordered, Unique, O(1) for Accessing/.contains
let myIntSet: Set<Int> = [1, 2, 2, 3]
var myIntArr = [1, 2, 2, 3]

let firstEle = myIntArr[0]
myIntArr = []
let firstEleOptional = myIntArr.first
//myIntArr[0]

myIntSet.first
myIntSet[myIntSet.startIndex]

// --MARK: Dictionary: keys unordered/unique
var empty: [Int: Int] = [:]
var myDict = ["a": 1, "b": 2]
myDict["c"] = 3

/// 1. Force Unwrap: not safe
let cValue = myDict["c"]
let bValue = myDict["b"]
cValue! + 3
print(cValue!)

/// 2a. Conditional binding: if let
if let cNum = cValue {
    print(cNum)
} else {
    // cValue is nil here
}

var year = 2020
guard year > 2000 else {
    fatalError()
}
print("year is after 2000s")

/// 2b. Conditional binding: guard let
guard let bNum = bValue else {
    print("bNum is nil")
    fatalError()
}
print(bNum)

/// 3. Nil Coalescing
var students = ["Luke", "bob"]
students = []
var firstStudent = students.first

print(firstStudent ??  "No student")

/// 4. Optional chaining
var teamsScores: [[Int?]] = [
    [9, nil, 6, 8],
    [10, 2, 4, 6]
]
var firstTeam = teamsScores.first
var firstTeamFirstScore = firstTeam?[0]
var score = teamsScores.first?[0]

class Person {
    var creditCard: CreditCard?
}
class CreditCard {
    var num = 123456789
}
let luke = Person()
let creditCardNum = luke.creditCard?.num

/// 5. Switch on the enum
enum Phone {
    case iPhone
    case Android
}
let myPhone = Phone.iPhone
switch myPhone {
case .iPhone:
    print()
case .Android:
    print()
}

var optInt: Int? = 10
switch optInt {
case .none:
    print("no value")
case .some(let value):
    print(value)
}
