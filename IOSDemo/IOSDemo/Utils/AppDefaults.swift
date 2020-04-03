//
//  AppDefaults.swift
//  IOSDemo
//
//  Created by Duy Thien Chau on 4/2/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import Foundation

class AppDefaults {
    
    private let LOGIN_TAG = "didLogin"
    
    static let shared = AppDefaults()
    
    private init() {
    }
    
    func saveLogin(_ isLogin: Bool) {
        UserDefaults.standard.set(isLogin, forKey: LOGIN_TAG)
    }
    
    func getLogin() -> Bool {
        return UserDefaults.standard.bool(forKey: LOGIN_TAG)
    }
}
