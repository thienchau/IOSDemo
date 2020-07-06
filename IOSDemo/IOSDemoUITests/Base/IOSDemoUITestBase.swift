//
//  IOSDemoUITestBase.swift
//  IOSDemoUITests
//
//  Created by Duy Thien Chau on 7/6/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import Foundation
import XCTest

class IOSDemoUITestBase: XCTestCase {
    
    var app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func XCTAsyncAssert(_ element: XCUIElement) {
        let isElementExist = element.waitForExistence(timeout: 5)
        if isElementExist {
            XCTAssertTrue(element.exists)
        }
    }
    
}
