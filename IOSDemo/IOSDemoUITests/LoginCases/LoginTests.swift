//
//  IOSDemoUITests.swift
//  IOSDemoUITests
//
//  Created by Duy Thien Chau on 3/28/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import XCTest

class LoginTests: IOSDemoUITestBase {
    
    func testEmptyLoginFail() throws {
        givenAppIsReady()
        whenPressSignIn()
        thenIShouldSeeErrorAlert()
    }
}




