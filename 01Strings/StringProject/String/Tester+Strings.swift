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
        print(word);
    }
    
    /// input "hello" should print "HELLO"
    func printUpperCase(word: String) {
        print(word.uppercased());
    }
    
    /// Using for loop, print each char in word
    func printLetters(word: String) {
        for letter in word {
            print(letter)
        }
    }
    
    /// Using for-in-enumerated(), print letters at every even-index
    func printEvenIndexEnumerated(word: String) {
        for (i, letter) in word.enumerated(){
            if i % 2 == 0 {
                print(letter)
            }
        }
    }
    
    /// Using for-in-stride and string.index, print letters at every even-index
    func printEvenIndexStride(word: String) {
        for letterindex in stride(from:0, to:word.count, by:2) {
            print(word[word.index(word.startIndex, offsetBy: letterindex)])
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
        let vowels = "aeiou";
        var result = word;
        
        if vowels.contains(result[result.startIndex]){
            print(result + "yay")
        }
        else {
            let firstLetter = result.removeFirst()
            print(result + String(firstLetter) + "ay")
        }
    }
    
    /// Using loop and string.index, returns true if input is a palindrome
    /// Do not use .reversed()
    func isPalindrome(word: String) -> Bool {
        for (loopindex, letter) in word.enumerated() {
            if letter != word[word.index(word.index(before: word.endIndex), offsetBy: loopindex * -1)] {
                return false
            }
        }
        return true
    }
}
