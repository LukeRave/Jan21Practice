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
        return original.map { $0 * 2 }
    }

    /// 2. Write a function to return the last half of the array, not including the median
    func lastHalf(array: [Int]) -> [Int] {
        
        var halfwayIndex: Int;
        if(array.count % 2 == 0){
            halfwayIndex = array.count / 2;
        }
        
        else {
            let doubleTypeIndex = floor(Double(array.count / 2))
            halfwayIndex = Int(doubleTypeIndex) + 1;
        }
        
        let lastHalf = Array(array.dropFirst(halfwayIndex))
        return lastHalf;
    }

    /// 3. Write a function that can creates an array populated with integers going from start (input) to end (input)
    func createArray(from start: Int, to end: Int) -> [Int] {
        var resultArray: [Int] = [];
        for num in start...end {
            resultArray.append(num)
        }
        return resultArray;
    }

    /**
        4. Using loops, create a square matrix (n x n) for any given n:
        Example: n = 3
        [[1,2,3],
        [4,5,6],
        [7,8,9]]
     */
    func create2DArray(n: Int) -> [[Int]] {
        var matrixArray: [[Int]] = [];
        var rowArray: [Int] = [];
        let maxNum = n * n;
        for num in 1...maxNum {
            rowArray.append(num)
            if num % n == 0 {
                matrixArray.append(rowArray)
                rowArray.removeAll();
            }
        }
        return matrixArray;
    }

    /// 5. Write a function that returns the number of pairs of elements that SUMS up to 0
    /// Input [1,2,3,-1,-2,-4] -> Output 2
    func findPairs(nums: [Int]) -> Int {
        var doubledResult = 0;
        
        for num in nums {
            if(nums.contains(num * -1)) {
                doubledResult+=1;
            }
        }
        let result = doubledResult / 2;
        return result;
    }
    
    /// 6. Returns an array of indexes where the char occurs in input word
    func positionsOf(character: Character, in word: String) -> [Int] {
        var indexArray: [Int] = []
        for (index, char) in word.enumerated() {
            if(char == character){
                indexArray.append(index)
            }
        }
        return indexArray
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
        var neccessaryChairs = 0;
        for (index, char) in array.enumerated() {
            switch char {
            case "I": neccessaryChairs = neccessaryChairs + 1;
            case "O": if array.dropFirst(index).contains("I") {neccessaryChairs = neccessaryChairs - 1};
            default: print("Input invalid")
            }
        }
        return neccessaryChairs;
    }
    
    /// 8. Pig latin but with words separated by spaces
    func pigLatinSentence(sentence: String) -> String {
        var resultArray: [String] = []
        var arrayOfWords: [String];
        arrayOfWords = sentence.components(separatedBy: " ")
        for thisWord in arrayOfWords {
            resultArray.append(String(returnPigLatin(word: thisWord)))
            }
        let result = resultArray.joined(separator: " ")
        return result;
    
    }
    
    func returnPigLatin(word: String) -> String {
        let vowels = "aeiou";
        var result = word;
        
        if vowels.contains(result[result.startIndex]){
            result += "yay"
        }
        else {
            let firstLetter = result.removeFirst()
            result += String(firstLetter) + "ay"
        }
        return result;
    }
    
    /**
        9. Find the best day to first BUY and then a day occuring after that day to SELL. Return the maximum profit (buy price - sell price)
        var prices = [7,1,5,3,6,4] -> returns 5  (buy at 1 and sell at 6)
     */
    func maxProfit(array: [Int]) -> Int {
        var result = 0;
        for num in array {
            for otherNum in array {
                var absoluteValue = otherNum - num;
                if absoluteValue < 0 {
                    absoluteValue = absoluteValue * -1
                }
                let maxNum = max(otherNum, num);
                let minNum = min(otherNum, num);
                let booleanCheck = array.firstIndex(of: maxNum)! > array.firstIndex(of: minNum)!
                if absoluteValue > result && booleanCheck {
                    result = absoluteValue;
                }
            }
        }
        return result;
    }
    
    /**
        10. Input: array of integers: [1, 4, 8, 4] with 1 having the highest priority.
        Output: reduce the distance bettwen priorities but keep the same priority ordering
        [1, 4, 8, 4] -> [1, 2, 3, 2]
        [20, 15] -> [2, 1]
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
