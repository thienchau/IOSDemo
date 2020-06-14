//
//  ContentViewModel.swift
//  IOSDemo
//
//  Created by Duy Thien Chau on 6/14/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import Foundation

protocol ContentViewModelProtocol: ObservableObject {
    func getLogin() -> Bool
}

final class ContentViewModel: ContentViewModelProtocol {
    
    private var appDefaults: AppDefaultsProtocol
    
    init(appDefaults: AppDefaultsProtocol = AppDefaults()) {
        self.appDefaults = appDefaults
    }
    
    func getLogin() -> Bool {
        return self.appDefaults.getLogin()
    }
}
