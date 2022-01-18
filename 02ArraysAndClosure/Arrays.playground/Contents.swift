import UIKit

var greeting = "Hello, playground"

/// Writing a function
func testing() {
    /// Get a random number from 0 to 10
    let moneyLeft = Int.random(in: 0...10)
    
    /// Using if else statements
    if moneyLeft > 5 {
        print("I'm rich")
    } else {
        print("outta money")
    }
    
    /// Using guard else statements
    guard moneyLeft > 5 else {
        print("outta money")
        return
    }
    print("I'm rich")
}

testing()

var moneyLeft = 2
moneyLeft += 1
moneyLeft > 5 ? print("greater 5") : print("lesser 5")

/// Integers, Double, Float
let myInt: Int = 9
let myInt8: Int8 = 100
let myInt32: Int32 = 100
let myInt64: Int64 = 100
let uSign: UInt8 = 255

print(uSign)
print("int8 max", Int8.max)
print("int16 max", Int16.max)


let doub: Double = 10.0 // 64 bits
let float: Float = 10.0 // 32 bits

let xPostion: CGFloat = 10.0

/// Array
var anyArr: [Any] = [1, "adf", []]
var intArr = [1,2,3,4]
intArr.append(5)
//intArr.append("5")   /// Can't do this "5" needs to be int type

let firstInt = intArr[0]
let firstAny = anyArr[0]
let castedAnyAsInt = firstAny as! Int

/// Loops
for ele in anyArr {
    print(ele)
}

for (index, ele) in intArr.enumerated() {
    print(index, ele)
}

/// Higher Order Functions
let mappedArr = intArr.map { element in
    return element + 10
}
print("mapped: ", mappedArr)

let filteredArr = intArr.filter { element in
    return element % 2 == 0
}
print("filtered: ", filteredArr)

let reduced = intArr.reduce(1) { total, element in
    return total * element
}
print("reduced: ", reduced)

/// Same as above but with shorter syntax
let shortHandMap = intArr.map { $0 + 10 }
let shortHandFilter = intArr.filter { $0 % 2 == 0 }
let shortHandReduced = intArr.reduce(1) { $0 * $1 }
print("mapped: ", shortHandMap)
print("filtered: ", shortHandFilter)
print("reduced: ", shortHandReduced)
