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
        var numSet: Set<Int> = []
        for num in nums{
            numSet.insert(num)
        }
        return Array(numSet)
    }
    
    /// Find the nums that exist in both arrays
    func findCommonNums(from firstNums: [Int], and secondNums: [Int]) -> [Int] {
        return firstNums.filter {
            return secondNums.contains($0)
        }
    }
    
    /// first: "hello", second: "bye" -> ["e"]
    func findMatchingLetters(firstWord: String, secondWord: String) -> [Character] {
        return Array(firstWord).filter {
            return Array(secondWord).contains($0)
        }
    }
    
    
    /// Create a dictionary of the counts of the letters, ignoring spaces
    func createCounter(string: String) -> [Character: Int] {
        var counterDictionary: [Character:Int] = [:]
        for char in string {
            if char == " "{
                continue
            }
            if counterDictionary.keys.contains(char){
                counterDictionary[char]! += 1;
            }
            else {
                counterDictionary[char] = 1;
            }
        }
        return counterDictionary;
    }
    
    /// Find most frequent letter in string: "hello there" -> "e"
    func mostFrequentLetter(string: String) -> Character {
        let countDict = createCounter(string: string)
        print(countDict)
        let mostFrequent = countDict.values.max()
        guard let key = countDict.first(where: { $0.value == mostFrequent })?.key else {
            return "."
        }
        return key
    }
    
    /// Given a string of numbers: "121" and a sentence "fire water fire"
    /// Determine if the sequence can be translated to the sentence exactly, if each number represents only one word
    /// "121" and a sentence "fire water fire" (returns true)
    /// "1122" and a sentence "fire water fire water" (returns false)
    /// "11221" and a sentence "fire fire water water fire" (returns true)
    func translateNums(sequence: String, sentence: String) -> Bool {
        var cypherDict: [String: Int] = [:]
        let sentenceArray =  sentence.split(separator: " ")
        var sentenceSequence = ""
        for word in sentenceArray {
            if let _ = cypherDict[String(word)] {
                continue
            }
            else {
                cypherDict[String(word)] = cypherDict.keys.count + 1;
            }
        }
        for word in sentenceArray{
            if let thisKey = cypherDict[String(word)] {
                sentenceSequence += String(thisKey)
            }
            else {continue}
        }
        if sentenceSequence == sequence {
            return true
        }
        else {return false};
    }
    
    /// Find number of pairs that SUMS up to 0
    /// O(n) time: don't use nested for loops
    func findPairsOfOpposites(nums: [Int]) -> Int {
        var numsCopy = nums;
        var result = 0;
        for num in nums{
            if numsCopy.contains(-num){
                result += 1;
                if let posIndex = numsCopy.firstIndex(of: num){
                numsCopy.remove(at: posIndex)
                }
                else {continue}
                
                if let negNumIndex = numsCopy.firstIndex(of: -num){
                numsCopy.remove(at: negNumIndex)
                }
                else {continue}
            }
        }
        
        return result;
    }
    
    /**
     Using Dictionary:
     Input: array of integers: [1, 4, 8, 1] with 1 having the highest priority.
     Output: reduce the distance bettwen priorities but keep the same priority ordering
     [1, 4, 8, 1] -> [1, 2, 3, 1]
     */
    func reduceDistanceKeepPriority(array: [Int]) -> [Int] {
        var cypherDict: [Int: Int] = [:]
        var numSet: Set<Int> = []
        for num in array{
            numSet.insert(num)
        }
        var priorityArray: [Int] = [];
        let sortedArray = Array(numSet).sorted();
        for (index, num) in sortedArray.enumerated() {
            if let _ = cypherDict[num] {
                continue
            }
            else {
                cypherDict[num] = index + 1
            }
        }
        for num in array{
            priorityArray.append(cypherDict[num]!)
        }
        return priorityArray
    }
}
