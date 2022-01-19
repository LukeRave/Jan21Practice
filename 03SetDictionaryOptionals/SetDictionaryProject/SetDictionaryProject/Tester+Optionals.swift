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
        if let opt = optional {
            return opt
        } else {
            return 0
        }
    }
    
    /// Unwrap using optional binding: guard let
    /// else return ""
    func unwrap(optional: String?) -> String {
        guard let opt = optional else {
            return ""
        }
        return opt
    }
    
    /// Unwrap using nil coalescing
    /// takes optional array, return first value?
    func unwrap(optional: [Int]?) -> Int {
        let optInt = optional?.first
        return (optInt ?? 0)
    }
    
    /// Create a url from a string address, avoid force unwrapping
    /// else return the main bundle url
    func createURL(from address: String?) -> URL {
        if let add = address {
            let myURL = URL(string: add)
            if let url = myURL {
                return url
            }
        }
        return Bundle.main.bundleURL
    }
    
    
    /// Input array of [Int?], unwrap each Int? and return the an array of Int
    /// Input [Int?] = [1, nil, nil, 2] -> [1, 2]
    func unwrapElementsInArray(array: [Int?]) -> [Int] {
        var outputArray: [Int] = []
        for val in array {
            if let v = val {
                outputArray.append(v)
            }
        }
        return outputArray
    }
    
    /// Unwrap using nil coalescing
    /// takes optional dictionary, return value at key?
    func unwrap(optional: [Int: Int]?, key: Int?) -> Int {
        return (optional?[key ?? 0] ?? 0)
    }
    
    /// Unwrap using optional chaining and optional binding
    /// takes nested optional array, return first value?
    func unwrap(optional: [[Int]?]?) -> Int {
        if let f = optional?[0]?.first {
            return f
        } else {
            return 0
        }
    }
    
    /// Unwrap using implicitly unwrap
    func implicitUnwrap(optional: Int?) -> Int {
        return optional!
    }
    
    /// Cast string into non-optional Int
    func castStringIntoInt(string: String) -> Int {
        if let myInt = Int(string) {
            return myInt
        }
        return Int.min
    }
    
    /// Cast an array of string into an array of Int, remove any nil values
    /// ["1", "5", "apple", "2"] --> [1, 5, 2]
    func castArray(from strArr: [String]) -> [Int] {
        var outputArray: [Int] = []
        for str in strArr {
            let temp = castStringIntoInt(string: str)
            if temp == Int.min {
                continue
            }
            outputArray.append(temp)
        }
        
        return outputArray
    }
}
