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
        var arr: [Int] = []
        let count = nums.count
        
        for i in 0..<count{
            if arr.contains(nums[i]) == false{
                arr.append(nums[i])
            }
        }
        return arr
    }
    
    /// Find the nums that exist in both arrays
    func findCommonNums(from firstNums: [Int], and secondNums: [Int]) -> [Int] {
        let count = secondNums.count
        var arr: [Int] = []
        
        for i in 0..<count{
            if firstNums.contains(secondNums[i]){
                arr.append(secondNums[i])
            }
        }
        return arr
    }
    
    /// first: "hello", second: "bye" -> ["e"]
    func findMatchingLetters(firstWord: String, secondWord: String) -> [Character] {
        var char: [Character] = []
        for (_,c) in firstWord.enumerated(){
            if secondWord.contains(c){
                char.append(c)
            }
        }
        
        return char
    }
    
    
    /// Create a dictionary of the counts of the letters, ignoring spaces
    func createCounter(string: String) -> [Character: Int] {
        var count: [Character: Int] = [:];
        // Creates a new array including the space
        let arr = Array(string)
        let newArr = Set(arr)
        
        //Populates the dictionary without the duplicates
        for element in newArr {
            if element == " "{
                continue
            }else{
            count[element] = 0
            }
        }
        
        //iterates through the original array and increments the dict value if there's a dup
        for element in arr {
            if element == " "{
                continue
            }else{
            count[element]! += 1
            }
        }
        
        return count
    }
    
    /// Find most frequent letter in string: "hello there" -> "e"
    func mostFrequentLetter(string: String) -> Character {
        //Utilizing the previous function
        let counter = createCounter(string: string)
        
        ///Initialize two variables
        ///1. To store the count of the variable with the most dup
        ///2. To store the char of 1. Returning this this element
        var count: Int = 0
        var char: Character = "a"
        
        //Accessing every "key" element of the key-value pairs in the string
        for element in counter.keys {
            //Initialize a true statement with the key's value that you're trying to compare
            //counter[element] is the value of the "iterated key" that's within the dictionary
            if let num = counter[element]{
                if num > count {
                    count = num
                    char = element
                }
            }
        }
        
        return char
    }
    
    /// Given a string of numbers: "121" and a sentence "fire water fire"
    /// Determine if the sequence can be translated to the sentence exactly, if each number represents only one word
    /// "121" and a sentence "fire water fire" (returns true)
    /// "1122" and a sentence "fire water fire water" (returns false)
    /// "11221" and a sentence "fire fire water water fire" (returns true)
        func translateNums(sequence: String, sentence: String) -> Bool {
            //Create an array out of the sentence to be iterated over and checked
            let arr2 = sentence.components(separatedBy: " ")
            //Dictionary used to store the sequence and the index for use in iteration
            var seq: [Character:String] = [:]
            
            ///Iteration:
            ///
          for (i, char) in sequence.enumerated() {
              //Initialize true statement
                    if let value = seq[char] {
                        if arr2[i] != value {
                            return false
                        }
                    } else {
                        seq[char] = arr2[i]
                }
            }
            return true
        }

    
    /// Find number of pairs that SUMS up to 0
    /// O(n) time: don't use nested for loops
    func findPairsOfOpposites(nums: [Int]) -> Int {
        
        return 0
    }
    
    /**
     Using Dictionary:
     Input: array of integers: [1, 4, 8, 1] with 1 having the highest priority.
     Output: reduce the distance bettwen priorities but keep the same priority ordering
     [1, 4, 8, 1] -> [1, 2, 3, 1]
     */
    func reduceDistanceKeepPriority(array: [Int]) -> [Int] {
        
        return []
    }
    
}
