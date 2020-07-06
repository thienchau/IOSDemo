//
//  IOSDemoUITests.swift
//  IOSDemoUITests
//
//  Created by Duy Thien Chau on 3/28/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import XCTest

class IOSDemoUITests: IOSDemoUITestBase {
        
    func testEmptyLoginFail() throws {
        
        sleep(5)
        
        app.buttons["Sign In"].tap()
        
        let alert = app.alerts["Please enter correct email and password"].scrollViews.otherElements.staticTexts["Please enter correct email and password"]
        
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith:alert, handler: nil)
        
        waitForExpectations(timeout: 1, handler: nil)
        
    }

}
