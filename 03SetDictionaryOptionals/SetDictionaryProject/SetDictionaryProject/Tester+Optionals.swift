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
        if let unwrapped = optional {
            return unwrapped
        } else {
            return 0
        }
    }
    
    /// Unwrap using optional binding: guard let
    /// else return ""
    func unwrap(optional: String?) -> String {
        guard let unwrapped = optional else {
            return ""
        }
        return unwrapped
    }
    
    /// Unwrap using nil coalescing
    /// takes optional array, return first value?
    func unwrap(optional: [Int]?) -> Int {
        let firstValue = optional?.first ?? 0
        return firstValue
    }
    
    /// Create a url from a string address, avoid force unwrapping
    /// else return the main bundle url
    func createURL(from address: String?) -> URL {
        if let urlAddress = address {
            if let validURL = URL(string: urlAddress) {
                return validURL
            }
        }
        
        return Bundle.main.bundleURL
    }
    
    
    /// Input array of [Int?], unwrap each Int? and return the an array of Int
    /// Input [Int?] = [1, nil, nil, 2] -> [1, 2]
    func unwrapElementsInArray(array: [Int?]) -> [Int] {
        var unwrappedArr: [Int] = []
        
        for n in 0...array.count-1 {
            if let unwrappedInt = array[n] {
                unwrappedArr.append(unwrappedInt)
            }
        }
        
        return unwrappedArr
    }
    
    /// Unwrap using nil coalescing
    /// takes optional dictionary, return value at key?
    func unwrap(optional: [Int: Int]?, key: Int?) -> Int {
        if let unwrappedDict = optional?[key ?? 0] {
            return unwrappedDict
        }
        return 0
    }
    
    /// Unwrap using optional chaining and optional binding
    /// takes nested optional array, return first value?
    func unwrap(optional: [[Int]?]?) -> Int {
        if let unwrapped = optional?[0]?.first {
            return unwrapped
        }
        return 0
    }
    
    /// Unwrap using implicitly unwrap
    func implicitUnwrap(optional: Int?) -> Int {
        return optional!
    }
    
    /// Cast string into non-optional Int
    func castStringIntoInt(string: String) -> Int {
        if let intString = Int(string) {
            return intString
        }
        return 0
    }
    
    /// Cast an array of string into an array of Int, remove any nil values
    /// ["1", "5", "apple", "2"] --> [1, 5, 2]
    func castArray(from strArr: [String]) -> [Int] {
        var noNilArr: Array<Int> = []
        for n in 0...strArr.count-1 {
            if let validIndex = Int(strArr[n]) {
                noNilArr.append(validIndex)
            }
        }
        return noNilArr
    }
}
