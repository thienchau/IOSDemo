//
//  AccountTexts.swift
//  IOSDemoTests
//
//  Created by Duy Thien Chau on 4/2/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import XCTest

@testable import IOSDemo

class AccountTexts: XCTestCase {

    override func setUpWithError() throws {
    }
    
    func testVerifyPasswordFail() throws {
        let shortPass = "12345"
        let result = shortPass.validatePassword()
        XCTAssertFalse(result)
    }
    
    func testVerifyPasswordSuccess() throws {
        let pass = "123456"
        let result = pass.validatePassword()
        XCTAssertTrue(result)
    }
    
    func testVerifyEmailFail() throws {
        let email1 = "qwe"
        XCTAssertFalse(email1.validateEmail())
        
        let email2 = "qwe@abc"
        XCTAssertFalse(email2.validateEmail())
        
        let email3 = "qwe.com"
        XCTAssertFalse(email3.validateEmail())
    }
    
    func testVerifyEmailSuccess() throws {
        let email = "qwe@abc.com"
        XCTAssertTrue(email.validateEmail())
    }
    
    override func tearDownWithError() throws {
    }


}
