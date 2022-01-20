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
            return unwrapped;
        }
        return 0
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
        
        return optional?.first ?? 0
    }
    
    /// Create a url from a string address, avoid force unwrapping
    /// else return the main bundle url
    func createURL(from address: String?) -> URL {
        guard let thisAddress = address else {
            return Bundle.main.bundleURL
        }
        let thisURL = URL(string: thisAddress)
        if let url = thisURL {
            return url
        } else {
            return Bundle.main.bundleURL
        }
        }
    
    /// Input array of [Int?], unwrap each Int? and return the an array of Int
    /// Input [Int?] = [1, nil, nil, 2] -> [1, 2]
    func unwrapElementsInArray(array: [Int?]) -> [Int] {
        var nonOptionalArray: [Int] = [];
        for option in array {
            if let num = option {
                nonOptionalArray.append(num)
            }
        }
        return nonOptionalArray
    }
    
    /// Unwrap using nil coalescing
    /// takes optional dictionary, return value at key?
    func unwrap(optional: [Int: Int]?, key: Int?) -> Int {
          return (optional?[key ?? 0] ?? 0)
      }
    
    /// Unwrap using optional chaining and optional binding
    /// takes nested optional array, return first value?
    func unwrap(optional: [[Int]?]?) -> Int {
            guard let first = optional?[0]?.first else {
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
           guard let num = Int(string) else {
               return 0
           }
           return num
       }
    
    /// Cast an array of string into an array of Int, remove any nil values
    /// ["1", "5", "apple", "2"] --> [1, 5, 2]
    func castArray(from strArr: [String]) -> [Int] {
        let intArray = strArr.compactMap { Int($0) }
        return intArray;
}
}
