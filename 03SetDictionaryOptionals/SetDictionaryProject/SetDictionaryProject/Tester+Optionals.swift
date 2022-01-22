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
        if let num = optional {
            return num
        }else{
            return 0
        }
        
    }
    
    /// Unwrap using optional binding: guard let
    /// else return ""
    func unwrap(optional: String?) -> String {
        guard let string = optional else{
            return ""
        }
        return string
    }
    
    /// Unwrap using nil coalescing
    /// takes optional array, return first value?
    func unwrap(optional: [Int]?) -> Int {
        let num = optional?.first
        return (num ?? 0)
    }
    
    /// Create a url from a string address, avoid force unwrapping
    /// else return the main bundle url
    func createURL(from address: String?) -> URL {
        //Creating true statement to be tested. Statement being proven true defaults the optional status on the element
        if let addy = address{
        let url = URL(string: addy)
            if let newUrl = url{
                return newUrl
            }
            
        }
        return Bundle.main.bundleURL
    }
    
    
    /// Input array of [Int?], unwrap each Int? and return the an array of Int
    /// Input [Int?] = [1, nil, nil, 2] -> [1, 2]
    func unwrapElementsInArray(array: [Int?]) -> [Int] {
        var newArray: [Int] = []
        for element in array{
           if let num = element{
                newArray.append(num)
            }
        }
        return newArray
    }
    
    /// Unwrap using nil coalescing
    /// takes optional dictionary, return value at key?
    func unwrap(optional: [Int: Int]?, key: Int?) -> Int {
        return optional?[key ?? 0] ?? 0
    }
    
    /// Unwrap using optional chaining and optional binding
    /// takes nested optional array, return first value?
    func unwrap(optional: [[Int]?]?) -> Int {
        if let value = optional?[0]?.first{
            return value
        }
        return 0
    }
    
    /// Unwrap using implicitly unwrap
    func implicitUnwrap(optional: Int?) -> Int {
        
        return optional!
    }
    
    /// Cast string into non-optional Int
    func castStringIntoInt(string: String) -> Int {
        if let num = Int(string){
            return num
        }
        return 0
    }
    
    /// Cast an array of string into an array of Int, remove any nil values
    /// ["1", "5", "apple", "2"] --> [1, 5, 2]
    func castArray(from strArr: [String]) -> [Int] {
        var newArr: [Int] = []
//        for element in strArr{
//            if let num = Int(element){
//                newArr.append(element)
//            }else{
//                continue
//            }
//        }
        return newArr
    }
}
