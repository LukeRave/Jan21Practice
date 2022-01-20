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
        var numSet: Set<Int> = [];
        nums.forEach { num in
            numSet.insert(num)
        }
        var noDupes: [Int] = [];
        numSet.forEach { num in
            noDupes.append(num)
        }
        return noDupes
    }
    
    /// Find the nums that exist in both arrays
    func findCommonNums(from firstNums: [Int], and secondNums: [Int]) -> [Int] {
        var sharedNums: [Int] = [];
        firstNums.forEach { num in
            if secondNums.contains(num) {
                sharedNums.append(num);
            }
        }
        return sharedNums;
    }
    
    /// first: "hello", second: "bye" -> ["e"]
    func findMatchingLetters(firstWord: String, secondWord: String) -> [Character] {
        var sharedLetters: [Character] = [];
        firstWord.forEach { letter in
            if secondWord.contains(letter) {
                sharedLetters.append(letter);
            }
        }
        return sharedLetters;
    }
    
    
    /// Create a dictionary of the counts of the letters, ignoring spaces
    func createCounter(string: String) -> [Character: Int] {
        var counts: [Character:Int] = [:];
        string.forEach { char in
          if char != " " {
            if let newChar = counts[char] {
                counts[char] = newChar + 1;
            }
            else {
                   counts[char] = 1;
              }
           }
        }
        return counts
    }
    
    /// Find most frequent letter in string: "hello there" -> "e"
    func mostFrequentLetter(string: String) -> Character {
        var result: Character = "a";
        var highestCount = 0;
        for char in string {
            var tempCount = 0;
            for secondChar in string {
                if secondChar == char {
                    tempCount += 1;
                }
                if tempCount > highestCount {
                    highestCount = tempCount;
                    result = char;
                }
            }
        }
        return result;
    }
    
    /// Given a string of numbers: "121" and a sentence "fire water fire"
    /// Determine if the sequence can be translated to the sentence exactly, if each number represents only one word
    /// "121" and a sentence "fire water fire" (returns true)
    /// "1122" and a sentence "fire water fire water" (returns false)
    /// "11221" and a sentence "fire fire water water fire" (returns true)
    func translateNums(sequence: String, sentence: String) -> Bool {
        
        var comparedSequence: [Int] = [];
        var sequenceAsInts: [Int] = [];
        
        for char in sequence {
            sequenceAsInts.append(Int(String(char))!)
        }
        var binaryDict: [String: Int] = [:]
        var binaryIndex = 1;
        let wordArray = sentence.split(separator: " ");
        wordArray.forEach { word in
            if !binaryDict.keys.contains(String(word)) {
                binaryDict[String(word)] = binaryIndex;
                binaryIndex += 1;
            }
            let whichNum = binaryDict[String(word)]
            comparedSequence.append(whichNum!)
        }
        if sequenceAsInts == comparedSequence {
            return true;
        }
        return false;
    }
    
    /// Find number of pairs that SUMS up to 0
    /// O(n) time: don't use nested for loops
    func findPairsOfOpposites(nums: [Int]) -> Int {
        var numCounts: [Int: Int] = [:]
        for num in nums {
            if let thisCount = numCounts[num] {
                numCounts[num] = thisCount + 1;
            }
            else {
                numCounts[num] = 1;
            }
        }
        
        var totalPairs = 0;
        for key in numCounts.keys {
            if let numNegOccurrences = numCounts[-key] {
                let numOccurrences = numCounts[key]
                let minOccurrences = min(numOccurrences!, numNegOccurrences)
                totalPairs += minOccurrences
            }
        }
        return totalPairs / 2;
    }
    
    /**
     Using Dictionary:
     Input: array of integers: [1, 4, 8, 1] with 1 having the highest priority.
     Output: reduce the distance bettwen priorities but keep the same priority ordering
     [1, 4, 8, 1] -> [1, 2, 3, 1]
     */
    func reduceDistanceKeepPriority(array: [Int]) -> [Int] {
        
        var arrayToSet: Set<Int> = [];
        for num in array {
            arrayToSet.insert(num)
        }
        var arrayWithoutDuplicates: [Int] = [];
        for num in arrayToSet {
            arrayWithoutDuplicates.append(num)
        }
        let sortedArrayNoDupes = arrayWithoutDuplicates.sorted()
        var priorityDict: [Int: Int] = [:]
        for (index, num) in sortedArrayNoDupes.enumerated(){
            priorityDict[num] = index + 1
        }
        var reducedArray: [Int] = [];
        for num in array {
            if let reducedPriority = priorityDict[num] {
                            reducedArray.append(reducedPriority)
                        }
        }
        return reducedArray;
    }
    
}
