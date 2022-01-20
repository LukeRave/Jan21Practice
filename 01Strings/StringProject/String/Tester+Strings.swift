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
        for element in word{
            print(element)
        }
    }
    
    /// Using for-in-enumerated(), print letters at every even-index
    func printEvenIndexEnumerated(word: String) {
        for (index, element) in word.enumerated(){
            if index % 2 == 0{
                print(element)
            }
        }
    }
    
    /// Using for-in-stride and string.index, print letters at every even-index
    func printEvenIndexStride(word: String) {
        
        for element in stride(from: 0, to: word.count, by: 2){
            let index = word.index(word.startIndex, offsetBy:element)
            print(word[index])
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
    //word[0] word[word.stari]
    func printPigLatin(word: String) {
        if word[word.startIndex] == "a" || word[word.startIndex] == "e" || word[word.startIndex] == "i" || word[word.startIndex] == "o" || word[word.startIndex] == "u" {
            print(word + "yay")
        } else {
            let first = word[word.startIndex]
            let new = word.dropFirst()
            print(new + "\(first)ay")
        }
    }
    
    /// Using loop and string.index, returns true if input is a palindrome
    /// Do not use .reversed()
    func isPalindrome(word: String) -> Bool {
        var empty = ""
        for element in stride(from: word.count - 1, through: 0, by: -1){
            let index = word.index(word.startIndex, offsetBy:element)
            empty.append(word[index])
//            empty.insert(word[index], at: empty.endIndex)
        }
        
        if empty == word {
            return true
        } else {
            return false
        }
    }
}
