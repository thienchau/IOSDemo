//
//  Name.swift
//  IOSDemo
//
//  Created by Duy Thien Chau on 4/2/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import Foundation

struct Name : Decodable, Hashable {
    
    var title: String
    var first: String
    var last: String
    
    var fullName: String {
        return title + " " + first + " " + last
    }
    
    init(_ name: NameEntity) {
        self.title = name.title ?? ""
        self.first = name.first ?? ""
        self.last = name.last ?? ""
    }
    
    init(title: String, first: String, last: String) {
        self.title = title
        self.first = first
        self.last = last
    }
}
