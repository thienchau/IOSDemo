//
//  LoginSteps.swift
//  IOSDemoUITests
//
//  Created by Duy Thien Chau on 7/6/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import Foundation
import XCTest

extension LoginTests {
    
    func givenAppIsReady() {
        XCTContext.runActivity(named: "Given App Is Ready ") { _ in
            XCTAsyncAssert(LoginScreen.signInButton.element)
        }
    }
    
    func whenPressSignIn() {
        XCTContext.runActivity(named: "When I Pressed ") { _ in
            LoginScreen.signInButton.element.tap()
        }
    }
    
    func thenIShouldSeeErrorAlert() {
        XCTContext.runActivity(named: "Then I Should See Error Message ") { _ in
            let alert = LoginScreen.errorAlert.element.scrollViews.otherElements.staticTexts[LoginScreen.errorAlert.rawValue]
            
            expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith:alert, handler: nil)
            
            waitForExpectations(timeout: 2, handler: nil)
        }
    }
    
}
