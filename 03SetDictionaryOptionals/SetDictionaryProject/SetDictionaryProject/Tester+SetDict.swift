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
        var noDups: [Int] = []
        for n in 0...nums.count-1 {
            if !noDups.contains(nums[n]) {
                noDups.append(nums[n])
            }
        }
        return noDups
    }
    
    /// Find the nums that exist in both arrays
    func findCommonNums(from firstNums: [Int], and secondNums: [Int]) -> [Int] {
        var commonNums: [Int] = []
        for num in firstNums {
            if secondNums.contains(num) {
                commonNums.append(num)
            }
        }
        return commonNums
    }
    
    /// first: "hello", second: "bye" -> ["e"]
    func findMatchingLetters(firstWord: String, secondWord: String) -> [Character] {
        var commonChars: [Character] = []
        for char in firstWord {
            if secondWord.contains(char) {
                commonChars.append(char)
            }
        }
        return commonChars
    }
    
    
    /// Create a dictionary of the counts of the letters, ignoring spaces
    func createCounter(string: String) -> [Character: Int] {
        var myDict: [Character: Int] = [:]
        for char in string {
            if myDict[char] == nil {
                myDict[char] = 1
            } else {
                myDict[char]! += 1
            }
        }
        myDict.removeValue(forKey: " ")
        return myDict
    }
    
    /// Find most frequent letter in string: "hello there" -> "e"
    func mostFrequentLetter(string: String) -> Character {
        let myArr = Array(createCounter(string: string).values)
        let mostFrequentInt = myArr.sorted(by: <).last
        var mostFrequentChar: Character = " "
        for element in createCounter(string: string).keys {
            if createCounter(string: string)[element] == mostFrequentInt {
                mostFrequentChar = element
            }
        }
        return mostFrequentChar
    }
    
    /// Given a string of numbers: "121" and a sentence "fire water fire"
    /// Determine if the sequence can be translated to the sentence exactly, if each number represents only one word
    /// "121" and a sentence "fire water fire" (returns true)
    /// "1122" and a sentence "fire water fire water" (returns false)
    /// "11221" and a sentence "fire fire water water fire" (returns true)
    func translateNums(sequence: String, sentence: String) -> Bool {
        var sentenceArr: [String] = sentence.components(separatedBy: " ")
        let myDict = ["fire" : "1" , "water" : "2"]
        for  n in 0...sentenceArr.count-1 {
            sentenceArr[n] = myDict[sentenceArr[n]]!
        }
        return String(sentenceArr.joined(separator: "")) == sequence
    }
    
    /// Find number of pairs that SUMS up to 0
    /// O(n) time: don't use nested for loops
    func findPairsOfOpposites(nums: [Int]) -> Int {
        var myDict: [Int:Int] = [:]
        var numOfPairs = 0
        for n in 0...nums.count-1 {
            if !myDict.values.contains(nums[n]) {
                myDict[n] = nums[n]
            }
            if myDict.values.contains(-1 * nums[n]) {
                numOfPairs += 1
            }

        }
        
        return numOfPairs
    }
    
    /**
     Using Dictionary:
     Input: array of integers: [1, 4, 8, 1] with 1 having the highest priority.
     Output: reduce the distance bettwen priorities but keep the same priority ordering
     [1, 4, 8, 1] -> [1, 2, 3, 1]
     */
    func reduceDistanceKeepPriority(array: [Int]) -> [Int] {
        var myDict: [Int:Int] = [:]
        var priorityArr: [Int] = []
        for n in 0...array.count-1 {
            myDict[array[n]] = Set(array).sorted(by: <).firstIndex(of: array[n])
        }
        for n in 0...array.count-1 {
            priorityArr.append(myDict[array[n]]! + 1)
        }
        return priorityArr
    }
}
