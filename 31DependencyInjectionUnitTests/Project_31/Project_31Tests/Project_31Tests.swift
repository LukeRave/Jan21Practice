//
//  Project_31Tests.swift
//  Project_31Tests
//
//  Created by Rave Bizz on 2/15/22.
//

import XCTest
@testable import Project_31

class Project_31Tests: XCTestCase {
    
    var validation: ValidationService?
    
    override func setUpWithError() throws {
        validation = ValidationService()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        validation = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_is_valid_username() throws {
       XCTAssertNotNil(try validation?.checkUserName(username: "Darrion"))
    }
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        // Any test you write for XCTest can be annotated as throws and async.
//        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
