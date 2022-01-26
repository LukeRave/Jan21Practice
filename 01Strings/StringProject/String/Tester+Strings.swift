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
        for i in word {
            print(i)
        }
    }
    
    /// Using for-in-enumerated(), print letters at every even-index
    func printEvenIndexEnumerated(word: String) {
        for (i, c) in word.enumerated() {
            if i % 2 == 0 {
                print("\(c)")
            }
        }
   }
    
    /// Using for-in-stride and string.index, print letters at every even-index
    func printEvenIndexStride(word: String) {
        let newWord = word.enumerated()
        for (i, c) in newWord {
            if i.isMultiple(of: 2) {
                print(c)
            }
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
        let latin = "ay"
        let latin2 = "yay"
        var word = word
        let letter = word[word.startIndex]
        let letter2 = word.removeFirst()

        switch letter {
        case "a", "e", "i", "o", "u":
            let pigWord = "\(letter)\(word)\(latin2)"
            print(pigWord)

        default:
            let pigWord = "\(word)\(letter2)"
            print("\(pigWord)\(latin)")
        }
    }
    
    /// Using loop and string.index, returns true if input is a palindrome
    /// Do not use .reversed()
    func isPalindrome(word: String) -> Bool {
        var word = word
        let test = word.remove(at: word.startIndex)
        let test2 = word.remove(at: word.index(before: word.endIndex))
        if test == test2 {
            return true
        } else {
            return false
        }
    }
}


