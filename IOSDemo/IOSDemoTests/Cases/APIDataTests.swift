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
        
        let userSevice = UserSerice()
        
        let _ = userSevice.getUsers().sink { result in
            switch result {
            case .success(let contacts):
                let count = contacts.count
                XCTAssertEqual(count, 30)
                expectation.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 3.0)
    }
    
    override func tearDownWithError() throws {
    }
}
