//
//  APIDataTests.swift
//  IOSDemoTests
//
//  Created by Duy Thien Chau on 4/2/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import XCTest

@testable import IOSDemo

class APIDataTests: XCTestCase {
    
    override func setUpWithError() throws {
    }
    
    func testCount() throws {
        let expectation = XCTestExpectation(description: "Call API for Data")
        
        APIService.shared.response(from: UserRequestType()) {
            response, error in
            if (error == nil && response != nil) {
                if let response = response as? GetUserResponse {
                    let count = response.results.count
                    XCTAssertEqual(count, 30)
                    expectation.fulfill()
                }
            }
        }
        
        wait(for: [expectation], timeout: 3.0)
    }
    
    override func tearDownWithError() throws {
    }
}
