//
//  ResourceUsers.swift
//  IOSDemo
//
//  Created by Duy Thien Chau on 6/10/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import Foundation

extension Resource {

    static func users() -> Resource<GetUserResponse> {
        let url = ApiConstants.baseUrl.appendingPathComponent("")
        // fix data for example
        let parameters: [String : CustomStringConvertible] = [
            "page": "1",
            "results": "30",
            "exc": "login,registered,nat,phone"
            ]
        return Resource<GetUserResponse>(url: url, parameters: parameters)
    }

}
