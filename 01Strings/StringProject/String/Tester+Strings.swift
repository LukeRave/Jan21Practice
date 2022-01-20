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
            if index % 2 == 0 {
                print(char)
            }
        }
    }
    
    /// Using for-in-stride and string.index, print letters at every even-index
    func printEvenIndexStride(word: String) {
        for num in stride(from: 0, to: word.count, by: 2){
            let i = word.index(word.startIndex, offsetBy: num)
            print(word[i])
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
    func printPigLatin(word: String){
        let firstLetter = word[word.startIndex]
        switch firstLetter {
        case "a":
            print(word + "yay")
            return
        
        case "e":
            print(word + "yay")
            return
        
        case "i":
            print(word + "yay")
            return
        
        case "o":
            print(word + "yay")
            return
        
        case "u":
            print(word + "yay")
            return
        
        default:
            var wordMinusFist = ""
            for num in 1...word.count-1 {
                let nextIndex = word[word.index(word.startIndex, offsetBy: num)]
                wordMinusFist += "\(nextIndex)"
            }
            let pigConst = wordMinusFist + "\(firstLetter)ay"
            print(pigConst)
        }
    }
    
    /// Using loop and string.index, returns true if input is a palindrome
    /// Do not use .reversed()
    func isPalindrome(word: String) -> Bool {
        var reverseWord: String = ""
        let beforeLast = word.index(before: word.endIndex)
        for num in 0..<word.count {
            let nextIndex = word[word.index(beforeLast, offsetBy: -num)]
            reverseWord += "\(nextIndex)"
        }
        return reverseWord == word
    }
}
