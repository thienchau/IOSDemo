//
//  LoginElements.swift
//  IOSDemoUITests
//
//  Created by Duy Thien Chau on 7/6/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import Foundation
import XCTest

enum LoginScreen: String {
    
    case signInButton = "Sign In"
    case errorAlert = "Please enter correct email and password"
    
    var element: XCUIElement {
        switch self {
        case .signInButton:
            return XCUIApplication().buttons[self.rawValue]
        case .errorAlert:
            return XCUIApplication().alerts[self.rawValue]
        }
    }
}
