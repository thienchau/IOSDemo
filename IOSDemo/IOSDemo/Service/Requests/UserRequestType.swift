//
//  UserRequestType.swift
//  IOSDemo
//
//  Created by Duy Thien Chau on 4/2/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import Foundation

struct UserRequestType: APIRequestType {
    typealias Response = GetUserResponse
    
    var path: String {
        return "?"
    }
    
    var queryItems: [URLQueryItem]? {
        return [
            .init(name: "page", value: "1"),
            .init(name: "results", value: "30"),
            .init(name: "exc", value: "login,registered,nat,phone")
        ]
    }
}
