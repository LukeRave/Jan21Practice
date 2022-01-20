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
        let newArr = original.map { $0 * 2}
        return newArr
    }

    /// 2. Write a function to return the last half of the array, not including the median
    func lastHalf(array: [Int]) -> [Int] {
        var midpoint = 0
        let count = array.count
        if count/2 == 0{
        midpoint = array.count/2
        }else {
            midpoint = array.count/2 + 1
        }
        var newArr: [Int] = []
        for element in stride(from: midpoint , through: array.count - 1 , by: 1){
            let index = array.index(array.startIndex, offsetBy:element)
            newArr.append(array[index])
        }
        return newArr
    }
    /// 3. Write a function that can creates an array populated with integers going from start (input) to end (input)
    func createArray(from start: Int, to end: Int) -> [Int] {
    var empty: [Int] = []
    for num in stride(from: start, through: end, by: 1){
        empty.append(num)
    }
    return empty
}

    /**
        4. Using loops, create a square matrix (n x n) for any given n:
        Example: n = 3
        [[1,2,3],
        [4,5,6],
        [7,8,9]]
     */
    func create2DArray(n: Int) -> [[Int]] {
        var matrix: [[Int]] = []
        if n == 1{
            matrix = [[n]]
        }
        
        for i in 0..<n {
            var arr: [Int] = []
            for j in 0..<n {
                let int = j+(i*n)+1
                arr.append(int)
            }
            matrix.append(arr)
        }
        return matrix
    }

    /// 5. Write a function that returns the number of pairs of elements that SUMS up to 0
    /// Input [1,2,3,-1,-2,-4] -> Output 2
    func findPairs(nums: [Int]) -> Int {
        var sum = 0
        var num = 0
        let count = nums.count
        for i in 0..<count{
            for j in 0..<count{
                if nums[i] + nums[j] == 0{
                    sum += 1
                }
                num += 1
            }
        
        }
        if sum == 1{
            num = 1
        }else{
            num = sum/2
        }
        return num
    }
    
    /// 6. Returns an array of indexes where the char occurs in input word
    func positionsOf(character: Character, in word: String) -> [Int] {
        return []
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
        let count = array.count
        var sum = 0
        for i in 0..<count{
            if array[i] == "I"{
                sum += 1
            }else{
                if array[i-1] == "I" && array[i] == "O" && array[i+1] == "I" {
                    sum -= 1
                }
            }
        }
        return sum
    }
    
    /// 8. Pig latin but with words separated by spaces
    func pigLatinSentence(sentence: String) -> String {
        var newArr = sentence
        let arr = sentence.split(separator: " ")
        let count = arr.count
        for i in 0..<count {
            print(arr[i])
//            if arr[i].startIndex == "a" || arr[i].startIndex == "e" || arr[i].startIndex == "i" || arr[i].startIndex == "o" || arr[i].startIndex == "u" {
//                print(arr[i] + "yay")
//            } else {
//                let first = arr[i].startIndex
//                let new = arr[i].dropFirst()
//                let element = new + "\(first)ay"
//                newArr.append(element)
//            }
        }
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
        let newArr = array.sorted()
        let count = array.count
        var max: Int = newArr[count-1]
        var min: Int = newArr[0]
        for i in 0..<count {
            if
        }
        return -1
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
