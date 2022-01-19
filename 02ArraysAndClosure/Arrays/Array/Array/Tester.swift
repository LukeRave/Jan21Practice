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
        var result: [Int] = []
        for val in original {
            result.append(val * 2)
        }
        return result
    }

    /// 2. Write a function to return the last half of the array, not including the median
    func lastHalf(array: [Int]) -> [Int] {
        let resultLength: Int = array.count / 2
        var result: [Int] = []
        for position in (array.count-resultLength)..<array.count {
            result.append(array[position])
        }
        return result
    }

    /// 3. Write a function that can creates an array populated with integers going from start (input) to end (input)
    func createArray(from start: Int, to end: Int) -> [Int] {
        var result: [Int] = []
        for value in start...end {
            result.append(value)
        }
        return result
    }

    /**
        4. Using loops, create a square matrix (n x n) for any given n:
        Example: n = 3
        [[1,2,3],
        [4,5,6],
        [7,8,9]]
     */
    func create2DArray(n: Int) -> [[Int]] {
        var result: [[Int]] = []
        for value in 0..<n {
            result.append(Array((value*n+1)...(value*n+n)))
        }
        return result
    }

    /// 5. Write a function that returns the number of pairs of elements that SUMS up to 0
    /// Input [1,2,3,-1,-2,-4] -> Output 2
    func findPairs(nums: [Int]) -> Int {
        let negatives: [Int] = nums.filter {$0 < 0}
        var positives: [Int] = nums.filter {$0 > 0}
        var result: Int = 0
        for val in negatives {
            if positives.contains(val * -1) {
                result += 1
                positives.removeFirst()
            } else {
                positives.removeFirst()
            }
        }
        return result
    }
    
    /// 6. Returns an array of indexes where the char occurs in input word
    func positionsOf(character: Character, in word: String) -> [Int] {
        var result: [Int] = []
        for (index, val) in word.enumerated() {
            if val == character {
                result.append(index)
            }
        }
        return result
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
        var count: Int = 0
        var maxCount: Int = 0
        for char in array {
            if char == "I" {
                count += 1
                if count > maxCount {
                    maxCount = count
                }
            } else {
                count -= 1
            }
        }
        return maxCount
    }
    
    /// 8. Pig latin but with words separated by spaces
    func pigLatinSentence(sentence: String) -> String {
        let normalWordArr = sentence.split(separator: " ")
        var piglatinArr: [String] = []
        for word in normalWordArr {
            piglatinArr.append(returnPigLatin(word: String(word)))
        }
        return piglatinArr.joined(separator: " ")
    
    }
    
    func returnPigLatin(word: String) -> String {
        let vowels = "aeiou"
        let firstchar = word[word.startIndex]
        var result = ""
        if vowels.contains(firstchar) {
            result = word + "yay"
        } else {
            result = word.dropFirst() + String(firstchar) + "ay"
        }
        return result
    }
    
    /**
        9. Find the best day to first BUY and then a day occuring after that day to SELL. Return the maximum profit (buy price - sell price)
        var prices = [7,1,5,3,6,4] -> returns 5  (buy at 1 and sell at 6)
     */
    func maxProfit(array: [Int]) -> Int {
        var result: Int = 0
        for (index, startprice) in array.enumerated() {
            var endprices = array.map {$0 - startprice}
            for j in 0...index {
                endprices[j] = -1
            }
            let profit = endprices.max()
            if profit! > result {
                result = profit!
            }
        }
        return result
    }
    
    /**
        10. Input: array of integers: [1, 4, 8, 4] with 1 having the highest priority.
        Output: reduce the distance bettwen priorities but keep the same priority ordering
        [1, 4, 8, 4] -> [1, 2, 3, 2]
        [20, 15] -> [2, 1]
     */
    func reduceDistanceKeepPriority(array: [Int]) -> [Int] {
        let valSet = Set(array).sorted()
        var prioDict: [Int:Int] = [:]
        var count = 1
        for val in valSet {
            prioDict[val] = count
            count += 1
        }
        var result = array.map { (val) -> Int in
            return prioDict[val]!
        }
        return result
    }
}
