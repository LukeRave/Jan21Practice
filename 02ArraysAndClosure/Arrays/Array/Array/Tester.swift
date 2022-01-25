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
        let newArray = original.map{
            return $0 * 2
        }
        return newArray
    }

    /// 2. Write a function to return the last half of the array, not including the median
    func lastHalf(array: [Int]) -> [Int] {
        let median = Int(ceil(Double(array.count) / 2.0));
        let latterHalf: [Int] = Array(array.dropFirst(median))
        return latterHalf;
    }

    /// 3. Write a function that can creates an array populated with integers going from start (input) to end (input)
    func createArray(from start: Int, to end: Int) -> [Int] {
        var numArray: [Int] = [];
        for num in start...end{
            numArray.append(num)
        }
        return numArray
    }

    /**
        4. Using loops, create a square matrix (n x n) for any given n:
        Example: n = 3
        [[1,2,3],
        [4,5,6],
        [7,8,9]]
     */
    func create2DArray(n: Int) -> [[Int]] {
        var i = 1;
        var Array2D: [[Int]] = []
        for _ in 1...n{
            var tempArray: [Int] = []
            for _ in 1...n {
                    tempArray.append(i)
                    i += 1
            }
            Array2D.append(tempArray)
        }
        return Array2D
    }

    /// 5. Write a function that returns the number of pairs of elements that SUMS up to 0
    /// Input [1,2,3,-1,-2,-4] -> Output 2
    func findPairs(nums: [Int]) -> Int {
        var numPairs = 0;
        nums.forEach {
            if nums.contains($0 * -1) {
                numPairs += 1
            }
        }
        return numPairs / 2
    }
    
    /// 6. Returns an array of indexes where the char occurs in input word
    func positionsOf(character: Character, in word: String) -> [Int] {
        var result: [Int] = []
        for (index, char) in word.enumerated() {
            if char == character {
                result.append(index)
            }
        }
        return result;
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
        var result = 0;
        for (index, char) in array.enumerated() {
            if array.dropFirst(index).contains("I"){
                switch char {
                    case "I": result += 1;
                    default: result -= 1
                }
            }
        }
        return result;
    }
    
    /// 8. Pig latin but with words separated by spaces
    func pigLatinSentence(sentence: String) -> String {
        func returnPigLatin(word: String) -> String {
            let firstLetter = String(word.first ?? "?");
            let resultWord = word;
            let wordWithoutFirst = resultWord.dropFirst()
            switch firstLetter {
            case "a", "e", "i", "o", "u": return resultWord + "yay"
            default: return wordWithoutFirst + firstLetter + "ay"
            }
        }
        let wordArray = sentence.split(separator: " ");
        let pigLatinWordArray = wordArray.map {
            return returnPigLatin(word: String($0))
        }
        let pigLatinSentence = pigLatinWordArray.joined(separator: " ")
        return pigLatinSentence
        
    }
    
    /**
        9. Find the best day to first BUY and then a day occuring after that day to SELL. Return the maximum profit (buy price - sell price)
        var prices = [7,1,5,3,6,4] -> returns 5  (buy at 1 and sell at 6)
     */
    func maxProfit(array: [Int]) -> Int {
        print(array)
        var difference = 0;
        var tempDifference = 0;
        for (index, _) in array.enumerated() {
            for (i, _) in array.enumerated() {
                tempDifference = array[index] - array[i];
                if tempDifference > difference && index > i {
                    print(difference)
                    difference = tempDifference;
                    print(difference)
                }
            }
        }
        return difference;
    }
    
    /**
        10. Input: array of integers: [1, 4, 8, 4] with 1 having the highest priority.
        Output: reduce the distance bettwen priorities but keep the same priority ordering
        [1, 4, 8, 4] -> [1, 2, 3, 2]
        [20, 15] -> [2, 1]
     */
    func reduceDistanceKeepPriority(array: [Int]) -> [Int] {
        var intSet: Set<Int> = [];
        let copyArray = array;
        var result: [Int] = [];
        for int in array {
            intSet.insert(int)
        }
        let sortedArray = Array(intSet).sorted();
        var priorityDict: [Int:Int] = [:];
        for (index, int) in sortedArray.enumerated() {
            priorityDict[int] = index + 1;
        }
        for int in copyArray {
            result.append(priorityDict[int] ?? 0)
        }
        
        return result
    }
}
