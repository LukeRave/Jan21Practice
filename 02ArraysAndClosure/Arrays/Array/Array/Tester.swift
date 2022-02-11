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
        var newArray: [Int] = []
        for i in original {
            let newIndex = i * 2
            newArray.append(newIndex)
        }
        return newArray
    }

    /// 2. Write a function to return the last half of the array, not including the median
    func lastHalf(array: [Int]) -> [Int] {
        let count = array.count/2
        var secondHalf = array[count...]
        secondHalf.removeFirst()
        var newArray: [Int] = []
        for i in secondHalf {
            newArray.append(i)
        }
        return newArray
    }

    /// 3. Write a function that can creates an array populated with integers going from start (input) to end (input)
    func createArray(from start: Int, to end: Int) -> [Int] {
        var newArray: [Int] = []
        for i in start...end{
            newArray.append(i)
        }
        return newArray
    }

    /**
        4. Using loops, create a square matrix (n x n) for any given n:
        Example: n = 3
        [[1,2,3],
        [4,5,6],
        [7,8,9]]
     */
    func create2DArray(n: Int) -> [[Int]] {
        var twoDArray: [[Int]] = []
        var count: Int = 1
        for _ in 1...n {
            var oneArray: [Int] = []
            for _ in 1...n {
                oneArray.append(count)
                count += 1
            }
            twoDArray.append(oneArray)
        }
        return twoDArray
    }

    /// 5. Write a function that returns the number of pairs of elements that SUMS up to 0
    /// Input [1,2,3,-1,-2,-4] -> Output 2
    func findPairs(nums: [Int]) -> Int {
        var count: Int = 0
        var holder: Int = nums[0]
        for i in nums {
            //print("my initial i is: \(i)")
            //print("my initial count is: \(count)")
            //print("my initial holder is: \(holder)")
            if i + holder == 0 {
                count += 1
                //print("my count once it enters the if statement is: \(count)")
                holder += 1
                //print("my holder once it enters the if statement is: \(holder)")
            }
        }
        return count
    }
    
    /// 6. Returns an array of indexes where the char occurs in input word
    func positionsOf(character: Character, in word: String) -> [Int] {
        var newArray: [Int] = []
        for i in word.enumerated() {
            print(i)
            if i.element == character {
                newArray.append(i.offset)
            }
        }
        return newArray
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
        for i in array {
            if i == "I" {
                count += 1
            }
            if i == "O" {
                continue
            }
        }
        return count
    }
    
    /// 8. Pig latin but with words separated by spaces
    func pigLatinSentence(sentence: String) -> String {
        return ""
    
    }
    
    func returnPigLatin(word: String) -> String {
        return ""
    }
    
    /**
        9. Find the best day to first BUY and then a day occuring after that day to SELL. Return the maximum profit (buy price - sell price)
        var prices = [7,1,5,3,6,4] -> returns 5  (buy at 1 and sell at 6)
     */
    func maxProfit(array: [Int]) -> Int {
        let buy = array.min()
        var sell = array[buy!]
        for i in array.suffix(from: buy!) {
            if i > sell {
                sell = i
            }
        }
        let profit = abs(buy! - sell)
        return profit
    }
    
    /**
        10. Input: array of integers: [1, 4, 8, 4] with 1 having the highest priority.
        Output: reduce the distance bettwen priorities but keep the same priority ordering
        [1, 4, 8, 4] -> [1, 2, 3, 2]
        [20, 15] -> [2, 1]
     */
    func reduceDistanceKeepPriority(array: [Int]) -> [Int] {
        return []
    }
}
