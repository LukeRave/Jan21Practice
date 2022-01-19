//
//  Tester.swift
//  SetDictionaryProject
//
//  Created by Luat on 8/4/21.
//

import Foundation

struct Tester {
    /// Remove an array with the duplicated values removed
    func removeDups(nums: [Int]) -> [Int] {
        var uniqueNums: Set<Int> = []
        for num in nums {
            uniqueNums.insert(num)
        }
        var outputArray: [Int] = []
        for num in uniqueNums {
            outputArray.append(num)
        }
        return outputArray
    }
    
    /// Find the nums that exist in both arrays
    func findCommonNums(from firstNums: [Int], and secondNums: [Int]) -> [Int] {
        var outputArray: [Int] = []
        for num in firstNums {
            for num2 in secondNums {
                if (num == num2) {
                    outputArray.append(num)
                }
            }
        }
        return outputArray
    }
    
    /// first: "hello", second: "bye" -> ["e"]
    func findMatchingLetters(firstWord: String, secondWord: String) -> [Character] {
        var outputArray: [Character] = []
        for char in firstWord {
            for char2 in secondWord {
                if (char == char2) {
                    outputArray.append(char)
                }
            }
        }
        return outputArray
    }
    
    
    /// Create a dictionary of the counts of the letters, ignoring spaces
    func createCounter(string: String) -> [Character: Int] {
        var outputDict: [Character:Int] = [:]
        for char in string {
            if (char == " ") {
                continue
            }
            if let kvpair = outputDict[char] {
                outputDict.updateValue(kvpair+1, forKey: char)
            } else {
                outputDict[char] = 1
            }
        }
        return outputDict
    }
    
    /// Find most frequent letter in string: "hello there" -> "e"
    func mostFrequentLetter(string: String) -> Character {
        var counter = createCounter(string: string)
        var maxCount = 0
        var maxKey: Character = "a"
        for key in counter.keys {
            if let count = counter[key] {
                if count > maxCount {
                    maxCount = count
                    maxKey = key
                }
            }
        }
        return maxKey
    }
    
    /// Given a string of numbers: "121" and a sentence "fire water fire"
    /// Determine if the sequence can be translated to the sentence exactly, if each number represents only one word
    /// "121" and a sentence "fire water fire" (returns true)
    /// "1122" and a sentence "fire water fire water" (returns false)
    /// "11221" and a sentence "fire fire water water fire" (returns true)
    func translateNums(sequence: String, sentence: String) -> Bool {
        var thisWord = ""
        var words: [String] = []
        for char in sentence {
            if (char == " ") {
                words.append(thisWord)
                thisWord = ""
            } else {
                thisWord.append(char)
            }
        }
        words.append(thisWord)
        var mapping: [Character:String] = [:]
        for (ind, char) in sequence.enumerated() {
            
            if let value = mapping[char] {
                if words[ind] != value {
                    return false
                }
            } else {
                mapping[char] = words[ind]
            }
        }
        return true
    }
    
    /// Find number of pairs that SUMS up to 0
    /// O(n) time: don't use nested for loops
    func findPairsOfOpposites(nums: [Int]) -> Int {
        var opposites: [Int:Int] = [:]
        var count = 0
        for num in nums {
            if let value = opposites[-num] {
                if value > 0 {
                    count += 1
                    opposites.updateValue(value - 1, forKey: -num)
                } else {
                    if let value2 = opposites[num] {                            opposites.updateValue(value2 + 1, forKey: num)
                    } else {
                        opposites[num] = 1
                    }
                }
            } else {
                if let value2 = opposites[num] {                            opposites.updateValue(value2 + 1, forKey: num)
                } else {
                    opposites[num] = 1
                }
            }
        }
        return count
    }
    
    /**
     Using Dictionary:
     Input: array of integers: [1, 4, 8, 1] with 1 having the highest priority.
     Output: reduce the distance bettwen priorities but keep the same priority ordering
     [1, 4, 8, 1] -> [1, 2, 3, 1]
     */
    func reduceDistanceKeepPriority(array: [Int]) -> [Int] {
        var numsSet: Set<Int> = []
        for num in array {
            numsSet.insert(num)
        }
        var numsSetSorted: [Int] = []
        for num in numsSet {
            numsSetSorted.append(num)
        }
        numsSetSorted = numsSetSorted.sorted()
        var reductionMapping: [Int:Int] = [:]
        for (ind,num) in numsSetSorted.enumerated() {
            reductionMapping[num] = ind + 1
        }
        var outputArray: [Int] = []
        for num in array {
            if let red = reductionMapping[num] {
                outputArray.append(red)
            }
        }
        return outputArray
    }
    
}
