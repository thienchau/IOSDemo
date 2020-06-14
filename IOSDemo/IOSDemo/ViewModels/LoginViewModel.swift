//
//  LoginViewModel.swift
//  IOSDemo
//
//  Created by Duy Thien Chau on 6/14/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import Foundation

protocol LoginViewModelProtocol: ObservableObject {
    func saveLogin()
}

final class LoginViewModel: LoginViewModelProtocol {
    
    private var appDefaults: AppDefaultsProtocol
    
    init(appDefaults: AppDefaultsProtocol = AppDefaults()) {
        self.appDefaults = appDefaults
    }
    
    func saveLogin() {
        self.appDefaults.saveLogin(true)
    }
}

