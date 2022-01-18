import UIKit

/// String
var char: Character = "🤣"
var str: String = "a"

/// Number
var myInt: Int = 1
var myFloat: Float = 1.0
var myDoub: Double = 1.0

/// If statement
if String(char) == str {
    print("same")
} else {
    print("not same")
    print("char: \(char)")
}

/// Loop
for num in 0...3 {
    print(num)
}

for num in 0..<3 {
    print(num)
}

for num in stride(from: 0, to: 10, by: 2) {
    print("stride:", num)
}

for letter in greeting {
    print(letter)
}

for (index, letter) in greeting.enumerated() {
    if index == 3 {
        print("index: \(index), letter: \(letter)")
    }
}

/// Normal Indexing
var arr = [1,2,3,4]
arr[0]


/// String Index
/// - Can not index into strings with integer
/// - greeting[0] doesn't work

var greeting = " Hel🤣lo"
var hIndex = greeting.startIndex
greeting[hIndex]
// greeting[0]

var nextIndex = greeting.index(hIndex, offsetBy: 1)
greeting[nextIndex]
// greeting[1]


for num in 0..<greeting.count {
    let nextIndex = greeting.index(hIndex, offsetBy: num)
    print(greeting[nextIndex])
}


/// Utilizing a character's unicode value
let aChar: Character = "a"
let code = aChar.unicodeScalars
let codeValue = code.first!.value
let bChar = Character(UnicodeScalar(codeValue + 1)!)

