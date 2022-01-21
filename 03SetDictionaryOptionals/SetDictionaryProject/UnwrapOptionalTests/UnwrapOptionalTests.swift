//
//  UnwrapOptionalTests.swift
//  UnwrapOptionalTests
//
//  Created by Luat on 12/10/21.
//

import XCTest
@testable import SetDictionaryProject

class UnwrapOptionalTests: XCTestCase {
    let tester = Tester()
    
    /// Optionals: use if let (optional binding)
    func testUnwrapInt() throws {
        let input: Int? = 10
        let expected = 10
        
        let result = tester.unwrap(optional: input)
        
        XCTAssertEqual(result, expected, "\n Result: \"\(result)\" \n Expected: \"\(expected)\"")
    }
    
    /// Optionals: use guard let (optional binding)
    func testUnwrapString() throws {
        let input: String? = "10"
        let expected = "10"
        
        let result = tester.unwrap(optional: input)
        
        XCTAssertEqual(result, expected, "\n Result: \"\(result)\" \n Expected: \"\(expected)\"")
    }
    
    /// Optionals: use nil coalescing
    func testUnwrapArray() throws {
        let input: [Int]? = [10]
        let expected = 10
        
        let result = tester.unwrap(optional: input)
        
        XCTAssertEqual(result, expected, "\n Result: \"\(result)\" \n Expected: \"\(expected)\"")
    }
    
    func testCreateURL() throws {
        let strAddress = "www.google.com"
        let result = tester.createURL(from: strAddress)
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result.absoluteString, strAddress)
    }
    
    func testUnwrapArrayElement() throws {
        let input = [1, nil, nil, 2]
        let result = tester.unwrapElementsInArray(array: input)
        XCTAssert(result.isEmpty == false)
        for element in result {
            XCTAssertNotNil(element)
        }
    }
    
    
    /// Optionals: use nil coalescing
    func testUnwrapDictionary() throws {
        let input: [Int: Int]? = [1: 100]
        let expected = 100
        
        let result = tester.unwrap(optional: input, key: 1)
        
        XCTAssertEqual(result, expected, "\n Result: \"\(result)\" \n Expected: \"\(expected)\"")
    }
    
    /// Optionals: use optional chaining and optional binding
    func testUnwrapNestedArray() throws {
        let input: [[Int]?]? = [[100]]
        let expected = 100
        
        let result = tester.unwrap(optional: input)
        
        XCTAssertEqual(result, expected, "\n Result: \"\(result)\" \n Expected: \"\(expected)\"")
    }
    
    /// Optionals: use implicit unwrap
    func testImplicitUnwrap() throws {
        let input: Int? = 9
        let expected = 9
        
        let result = tester.implicitUnwrap(optional: input)
        
        XCTAssertEqual(result, expected, "\n Result: \"\(result)\" \n Expected: \"\(expected)\"")
    }
    
    func testCastStringIntoInt() {
        let input = "100"
        let expected = 100
        
        let result = tester.castStringIntoInt(string: input)
        
        XCTAssertEqual(result, expected, "\n Result: \"\(result)\" \n Expected: \"\(expected)\"")
    }
    
    func testCastArray() {
        let input = ["1", "5", "apple", "2"]
        let expected = [1, 5, 2]
        
        let result = tester.castArray(from: input)
        
        XCTAssertEqual(result, expected, "\n Result: \"\(result)\" \n Expected: \"\(expected)\"")
    }

}
