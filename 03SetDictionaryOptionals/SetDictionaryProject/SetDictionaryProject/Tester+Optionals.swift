//
//  Tester+Optionals.swift
//  SetDictionaryProject
//
//  Created by Luat on 12/10/21.
//

import Foundation

extension Tester {
    /// Optionals
    /// Unwrap using optional binding: if let
    /// else return 0
    func unwrap(optional: Int?) -> Int {
        if let result = optional {
        return result
        }
        else {
            return 0
        }
    }
    
    /// Unwrap using optional binding: guard let
    /// else return ""
    func unwrap(optional: String?) -> String {
        guard let result = optional else {
            return ""
        }
        return result
    }
    
    /// Unwrap using nil coalescing
    /// takes optional array, return first value?
    func unwrap(optional: [Int]?) -> Int {
        
        return optional?.first ?? 0
    }
    
    /// Create a url from a string address, avoid force unwrapping
    /// else return the main bundle url
    func createURL(from address: String?) -> URL {
        
        guard let url = URL(string: address ?? "") else {
        return Bundle.main.bundleURL
        }
        return url
    }
    
    
    /// Input array of [Int?], unwrap each Int? and return the an array of Int
    /// Input [Int?] = [1, nil, nil, 2] -> [1, 2]
    func unwrapElementsInArray(array: [Int?]) -> [Int] {
        var onlyInts: [Int] = []
        for num in array{
            if let unwrapped = num{
                onlyInts.append(unwrapped)
            }
        }
        return onlyInts
    }
    
    /// Unwrap using nil coalescing
    /// takes optional dictionary, return value at key?
    func unwrap(optional: [Int: Int]?, key: Int?) -> Int {
        guard let thisValue = optional?[key ?? 0] else {
            return 0
        }
        return thisValue
    }
    
    /// Unwrap using optional chaining and optional binding
    /// takes nested optional array, return first value?
    func unwrap(optional: [[Int]?]?) -> Int {
        guard let first = optional?.first??.first else {
            return 0
        }
        return first
    }
    
    /// Unwrap using implicitly unwrap
    func implicitUnwrap(optional: Int?) -> Int {
        return optional!
    }
    
    /// Cast string into non-optional Int
    func castStringIntoInt(string: String) -> Int {
        if let notOptional = Int(string) {
            return notOptional
        }
        return 0
    }
    
    /// Cast an array of string into an array of Int, remove any nil values
    /// ["1", "5", "apple", "2"] --> [1, 5, 2]
    func castArray(from strArr: [String]) -> [Int] {
        var copyArray: [Int] = []
        for str in strArr{
            if let stringAsInt = Int(str) {
                copyArray.append(stringAsInt)
            }
        }
        return copyArray
    }
}
