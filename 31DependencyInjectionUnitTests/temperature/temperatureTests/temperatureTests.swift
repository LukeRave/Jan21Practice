//
//  temperatureTests.swift
//  temperatureTests
//
//  Created by Luat on 2/8/21.
//

import XCTest
@testable import temperature

class temperatureTests: XCTestCase {

    var sut: TempViewModel?
    
    override func setUpWithError() throws {
        sut = TempViewModel(temp: 99.9, scale: TempScale.farenheit, service: MockService())

    }
    
    func testHasData() {
        XCTAssertNotNil(sut?.temp)
        XCTAssertNotNil(sut?.scale)
    }
    
    func testFormatText() {
        let formatedString = sut?.formatText
        var containsTemp = false
        if let temp = sut?.temp {
            if let contains = formatedString?.contains(String(temp)) {
                containsTemp = contains
            }
        }
        var containsScale = false
        if let scale = sut?.scale {
            if let contains = formatedString?.contains(scale.rawValue) {
                containsScale = contains
            }
        }
        XCTAssert(containsTemp)
        XCTAssert(containsScale)
    }
    
    func testDecode() {
        var decodedModel: [TempModel]?
        
        let testBundle = Bundle(for: type(of: self))
        
        if let path = testBundle.path(forResource: "mockData", ofType: "json") {
            if let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path)) {
                decodedModel = try? JSONDecoder().decode([TempModel].self, from: jsonData)
            }
        }
        let count = decodedModel?.count
        XCTAssertEqual(count, 2, "Decoded profiles should have count of 2")
        XCTAssertEqual(decodedModel?.first?.day, "Monday")
    }
    
    func testStatusCode() {
        guard let url = URL(string: "https://www.google.com") else { return }
        var statusCode: Int?
        
        let expect = expectation(description: "HTTP response Status code is 200")
        URLSession.shared.dataTask(with: url) { data, response, error in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            expect.fulfill()
        }.resume()
        
        wait(for: [expect], timeout: 5)
        XCTAssertEqual(statusCode, 200)
    }

    func testGetData() {
        let promise = expectation(description: "temp will be 1")
        var fetchedData = 0.0
        
        sut?.getData(completion: { (data) in
            fetchedData = data
            promise.fulfill()
        })
        
        wait(for: [promise], timeout: 4)
        XCTAssertNotNil(fetchedData, "Fetched data should not be nil")
        XCTAssertEqual(fetchedData, 1, "Temp should be 1")
    }

}

struct MockService: TempService {
    var bundle: Bundle = Bundle.init(for: temperatureTests.self)
    
    func getData(completion: @escaping (Double) -> ()) {
        
        var decodedModel: [TempModel]?
        let url = URL(fileURLWithPath: getPath())
        
        guard let jsonData = try? Data(contentsOf: url) else {
            return
        }
        
        decodedModel = try? JSONDecoder().decode([TempModel].self, from: jsonData)
        
        if let temp = decodedModel?.first?.highTemp {
            completion(Double(temp))
        }
    }
    
    func getPath() -> String {
        if let path = bundle.path(forResource: "mockData", ofType: "json") {
            return path
        }
        return ""
    }
    
}
