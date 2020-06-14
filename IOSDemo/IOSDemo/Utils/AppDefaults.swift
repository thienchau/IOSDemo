//
//  AppDefaults.swift
//  IOSDemo
//
//  Created by Duy Thien Chau on 4/2/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import Foundation

protocol AppDefaultsProtocol {
    func saveLogin(_ isLogin: Bool)
    func getLogin() -> Bool
}

class AppDefaults: AppDefaultsProtocol {
    
    private let LOGIN_TAG = "didLogin"
    
    func saveLogin(_ isLogin: Bool) {
        UserDefaults.standard.set(isLogin, forKey: LOGIN_TAG)
    }
    
    func getLogin() -> Bool {
        return UserDefaults.standard.bool(forKey: LOGIN_TAG)
    }
}
