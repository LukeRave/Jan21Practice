//
//  Tester.swift
//  Array
//
//  Created by Luat on 5/19/21.
//

import Foundation

class Tester {
    static let shared = Tester()
    
    /// 1. Write a function that takes an array of numbers and returns an array with each of the numbers multiplied by 2
    func multiplyByTwo(numbers original: [Int]) -> [Int]{
        var outputArray: [Int] = []
        for num in original {
            outputArray.append(num*2)
        }
        return outputArray
    }

    /// 2. Write a function to return the last half of the array, not including the median
    func lastHalf(array: [Int]) -> [Int] {
        var outputArray: [Int] = []
        if (array.count % 2 == 0) {
            for ind in stride(from: array.count/2,to: array.count, by: 1) {
                outputArray.append(array[ind])
            }
        } else {
            for ind in stride(from: array.count/2 + 1, to: array.count, by: 1) {
                outputArray.append(array[ind])
            }
        }
        return outputArray
    }

    /// 3. Write a function that can creates an array populated with integers going from start (input) to end (input)
    func createArray(from start: Int, to end: Int) -> [Int] {
        var outputArray: [Int] = []
        for num in start...end {
            outputArray.append(num)
        }
        return outputArray
    }

    /**
        4. Using loops, create a square matrix (n x n) for any given n:
        Example: n = 3
        [[1,2,3],
        [4,5,6],
        [7,8,9]]
     */
    func create2DArray(n: Int) -> [[Int]] {
        var outputArray: [[Int]] = []
        for num1 in 0..<n {
            var innerArray: [Int] = []
            for num2 in 0..<n {
                innerArray.append(num1*n + num2 + 1)
            }
            outputArray.append(innerArray)
        }
        return outputArray
    }

    /// 5. Write a function that returns the number of pairs of elements that SUMS up to 0
    /// Input [1,2,3,-1,-2,-4] -> Output 2
    func findPairs(nums: [Int]) -> Int {
        var pairs = 0
        for (ind,num) in nums.enumerated() {
            for ind2 in stride(from: ind, to: nums.count, by:1) {
                if (num == -nums[ind2]) {
                    pairs += 1
                }
            }
        }
        return pairs
    }
    
    /// 6. Returns an array of indexes where the char occurs in input word
    func positionsOf(character: Character, in word: String) -> [Int] {
        var outputArray: [Int] = []
        for (ind, char) in word.enumerated() {
            if (char == character) {
                outputArray.append(ind)
            }
        }
        return outputArray
    }
    
    /**
        7. Scenario: There is a conference room, and an array of `I`s and `O`s.
        `I` means a person enters the room and needs a chair.
        `O` means a person leaves the room and a chair opens up.
        Find the maximum number of chairs required to allow everyone (at any point) to have a seat
        Ex :
            [I, I, I ] = 3
            [ I, I, O, O] = 2
            [ I, I, O, I, I, O, O, O] = 3
     */
    func minimumChairs(array: [Character]) -> Int {
        var count = 0
        var maximumCount = 0
        for char in array {
            if (char == Character("I")) {
                count += 1
            } else {
                count -= 1
            }
            if count > maximumCount {
                maximumCount = count
            }
        }
        return maximumCount
    }
    
    /// 8. Pig latin but with words separated by spaces
    func pigLatinSentence(sentence: String) -> String {
        var outputSentence = ""
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
        let vowels: [Character] = ["a","e","i","o","u"]
        for (index,word) in words.enumerated() {
            if (index > 0) {
                outputSentence.append(" ")
            }
            let firstLetter = word.first
            guard let fl = firstLetter else {
                print("first letter is nil")
                fatalError()
            }
            var outputString = ""
            if vowels.contains(fl) {
                outputString.append(fl)
            }
            for ind in 1..<word.count {
                let char = word[word.index(word.startIndex, offsetBy: ind)]
                outputString.append(char)
            }
            if vowels.contains(fl) {
                outputString.append("yay")
            } else {
                outputString.append(fl)
                outputString.append("ay")
            }
            outputSentence.append(outputString)
        }
        return outputSentence
    }
    
    /**
        9. Find the best day to first BUY and then a day occuring after that day to SELL. Return the maximum profit (buy price - sell price)
        var prices = [7,1,5,3,6,4] -> returns 5  (buy at 1 and sell at 6)
     */
    func maxProfit(array: [Int]) -> Int {
        var low = Int.max
        var lowind = 0
        var high = Int.min
        var highind = 0
        var diff = 0
        var pairs: [(Int,Int,Int,Int,Int)] = []
        for (ind, num) in array.enumerated() {
            if (low > num) {
                if ind == array.count - 1 {
                    break
                }
                low = num
                lowind = ind
                high = array[ind+1]
                for ind2 in stride(from: ind+1, to: array.count, by: 1) {
                    if (high < array[ind2]) {
                        high = array[ind2]
                        highind = ind2
                        diff = high - low
                    }
                }
                pairs.append((diff,low,lowind,high,highind))
            }
        }
        var maxDiff = 0
        for pair in pairs {
            if pair.0 > maxDiff {
                maxDiff = pair.0
            }
        }
        return maxDiff
    }
    
    /**
        10. Input: array of integers: [1, 4, 8, 4] with 1 having the highest priority.
        Output: reduce the distance bettwen priorities but keep the same priority ordering
        [1, 4, 8, 4] -> [1, 2, 3, 2]
        [20, 15] -> [2, 1]
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
