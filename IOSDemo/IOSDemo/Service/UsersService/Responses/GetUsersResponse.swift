//
//  GetUsersResponse.swift
//  IOSDemo
//
//  Created by Duy Thien Chau on 3/30/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import Foundation

struct GetUserResponse : Decodable {
    var results: [Contact]
    var info: Info
}

struct Info : Decodable {
    var seed: String
    var results: Int
    var page: Int
    var version: String
}
