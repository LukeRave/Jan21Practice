import UIKit

// MARK: - Set: Unordered, no duplicates

let arr = [1, 1, 2, 3, 4]

var mySet: Set<Int> = [1,1,2,3,4]
var myEmptySet: Set<Int> = []

/// Indexing into a set
mySet.first
mySet[mySet.startIndex]

/// Ordering of elements is random
for ele in mySet {
    print(ele)
}

var myEvenSet: Set<Int> = [2, 4, 6, 8]

/// Comparing two sets to eachtoer
mySet.union(myEvenSet)
mySet.intersection(myEvenSet)
mySet.subtract(myEvenSet)

// MARK: - Dictionary: Unordered, Unique Keys, Value can be anything
var counter: [Int: Int] = [:]

for num in 3...6 {
    counter[num] = num + 10
}

/// Subscripting into Dictionary always returns optional value
let valueAtFive = counter[5]
if let valueAtFive = valueAtFive {
    print("valueAtFive:", valueAtFive)
}

print(counter.keys)
print(counter.values)

/// Looping with (key, value)
for (key, value) in counter {
    print("key:", key, "value:", value)
}

/// Looping using a tuple
for element in counter {
    print("element.key:", element.key, "elment.value:", element.value)
}

/// Using dictionary as a counter
let letters = ["a", "a", "B", "b", "c"]
var letterCounter: [String: Int] = [:]
for letter in letters {
    //    numCounter[num] += 1
    if let count = letterCounter[letter] {
        letterCounter[letter] = count + 1
    } else {
        letterCounter[letter] = 1
    }
}
print(letterCounter)

/// Using reduce
var str = "asdf@gmail.com"
let safeString = "@!#$.".reduce(str) { accum, unsafe in
    accum.replacingOccurrences(of: String(unsafe), with: "-")
}

let reducedCounter = letters.reduce(into: [:]) { accum, str in
    accum[str, default: 0] += 1
}
