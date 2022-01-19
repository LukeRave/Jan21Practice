//
//  Tester+Strings.swift
//  String
//
//  Created by Luat on 8/2/21.
//

import Foundation

extension Tester {
    /// Creating a git conflict
    /// Adding comment
    ///
    /// Using print command
    func printWord(word: String) {
        print(word)
    }
    
    /// input "hello" should print "HELLO"
    func printUpperCase(word: String) {
        print(word.uppercased())
    }
    
    /// Using for loop, print each char in word
    func printLetters(word: String) {
        for char in word {
            print(char)
        }
    }
    
    /// Using for-in-enumerated(), print letters at every even-index
    func printEvenIndexEnumerated(word: String) {
        for (index, char) in word.enumerated() {
            if (index % 2 == 0) {
                print(char)
            }
        }
    }
    
    /// Using for-in-stride and string.index, print letters at every even-index
    func printEvenIndexStride(word: String) {
        for index in stride(from: 0, to: word.count, by: 2) {
            print(word[word.index(word.startIndex, offsetBy: index)])
        }
    }
    
    /**
     Pig Latin:
     1) Move the first letter to the end and add "ay"
     pig -> igpay
     latin -> atinay
     2) IF word starts with a vowel, add "yay" to the word
     one -> oneyay
     */
    func printPigLatin(word: String) {
        let vowels: [Character] = ["a","e","i","o","u"]
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
        print(outputString)
    }
    
    /// Using loop and string.index, returns true if input is a palindrome
    /// Do not use .reversed()
    func isPalindrome(word: String) -> Bool {
        var firstHalf = ""
        for (ind, char) in word.enumerated() {
            if ind == word.count/2 {
                break
            }
            firstHalf.append(char)
        }
        var secondHalf = ""
        if (word.count % 2 == 0) {
            let hIndex = word.startIndex
            for ind in stride(from: word.count-1, through: word.count/2, by: -1) {
                secondHalf.append(word[word.index(hIndex, offsetBy: ind)])
            }
        } else {
            let hIndex = word.startIndex
            for ind in stride(from: word.count-1, through: word.count/2+1, by: -1) {
                secondHalf.append(word[word.index(hIndex, offsetBy: ind)])
            }
        }
        return firstHalf == secondHalf
    }
}
