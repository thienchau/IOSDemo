//
//  IOSDemoUITests.swift
//  IOSDemoUITests
//
//  Created by Duy Thien Chau on 3/28/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import XCTest

class IOSDemoUITests: XCTestCase {
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDownWithError() throws {
        
    }
    
    func testEmptyLoginFail() throws {
        
        let app = XCUIApplication()
        
        sleep(5)
        
        app.buttons["Sign In"].tap()
        
        let alert = app.alerts["Please enter correct email and password"].scrollViews.otherElements.staticTexts["Please enter correct email and password"]
        
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith:alert, handler: nil)
        
        waitForExpectations(timeout: 1, handler: nil)
        
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
