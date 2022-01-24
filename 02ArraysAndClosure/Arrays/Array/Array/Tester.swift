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
        return original.map{num in num * 2}
    }

    /// 2. Write a function to return the last half of the array, not including the median
    func lastHalf(array : [Int]) -> [Int] {
        var backHalfArray: [Int] = []
        let midOfArray = array.count%2==0 ? array.count/2:(array.count/2)+1
        for i in array[midOfArray]...array[array.count-1]{
            backHalfArray.append(i)
        }
        return backHalfArray
    }

    /// 3. Write a function that can creates an array populated with integers going from start (input) to end (input)
    func createArray(from start: Int, to end: Int) -> [Int] {
        var array: Array<Int> = []
        array.append(contentsOf: start...end)
        return array
    }

    /**
        4. Using loops, create a square matrix (n x n) for any given n:
        Example: n = 3
        [[1,2,3],
        [4,5,6],
        [7,8,9]]
     */
    func create2DArray(n: Int) -> [[Int]] {
        var counter: Int = 1
        var outArray: [[Int]] = []
        for num in 0..<n {
            let inArray: [Int] = []
            outArray.append(inArray)
            for _ in 1...n {
                outArray[num].append(counter)
                counter += 1
            }
        }
        return outArray
    }

    /// 5. Write a function that returns the number of pairs of elements that SUMS up to 0
    /// Input [1,2,3,-1,-2,-4] -> Output 2
    func findPairs(nums: [Int]) -> Int {
        var counter: Int = 0
        for i in 0...nums.count-1 {
            for j in 0...nums.count-1 {
                if nums[j] + nums[i] == 0 {
                    counter += 1
                }
            }
        }
        return counter/2
    }
    
    /// 6. Returns an array of indexes where the char occurs in input word
    func positionsOf(character: Character, in word: String) -> [Int] {
        var charArray: [Int] = []
        for (index, char) in word.enumerated() {
            if char == character {
                charArray.append(index)
            }
        }
        return charArray
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
        var counterI: Int = 0
        var counterIArray: [Int] = []
        for element in array {
            if element == "I" {
                counterI += 1
                counterIArray.append(counterI)
            } else {
                counterI -= 1
                counterIArray.append(counterI)
            }
        }
        return counterIArray.sorted(by: <).last!
    }
    
    /// 8. Pig latin but with words separated by spaces
    func pigLatinSentence(sentence: String) -> String {
        let sentenceArray = sentence.components(separatedBy: " ")
        let myMap = sentenceArray.map(returnPigLatin(word:))
        return myMap.joined(separator: " ")
    }
    
    func returnPigLatin(word: String) -> String {
        let firstLetter = word[word.startIndex]
        switch firstLetter {
        case "a":
            return word + "yay"
        
        case "e":
            return word + "yay"
        
        case "i":
            return word + "yay"
        
        case "o":
            return word + "yay"
        
        case "u":
            return word + "yay"
        
        default:
            var wordMinusFist = ""
            for num in 1...word.count-1 {
                let nextIndex = word[word.index(word.startIndex, offsetBy: num)]
                wordMinusFist += "\(nextIndex)"
            }
            let pigConst = wordMinusFist + "\(firstLetter)ay"
            return pigConst
        }
    }
    
    /**
        9. Find the best day to first BUY and then a day occuring after that day to SELL. Return the maximum profit (buy price - sell price)
        var prices = [7,1,5,3,6,4] -> returns 5  (buy at 1 and sell at 6)
     */
    func maxProfit(array: [Int]) -> Int {
        var max: Int = 0
        for i in 0...array.count-1 {
            for j in i...array.count-1 {
                if array[j] - array[i] > max {
                    max = array[j] - array[i]
                }
            }
        }
        return max
    }
    
    /**
        10. Input: array of integers: [1, 4, 8, 4] with 1 having the highest priority.
        Output: reduce the distance bettwen priorities but keep the same priority ordering
        [1, 4, 8, 4] -> [1, 2, 3, 2]
        [20, 15] -> [2, 1]
     */
    func reduceDistanceKeepPriority(array: [Int]) -> [Int] {
        var priorityArray: [Int] = []
        let myDict = Set(array)
        let sortedArray = Array(myDict).sorted(by: <)
        for i in 0...array.count-1 {
            for j in 0...sortedArray.count-1 {
                if array[i] == sortedArray[j] {
                    priorityArray.append(j+1)
                }
            }
        }
        return priorityArray
    }
}
