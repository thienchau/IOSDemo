//
//  Picture.swift
//  IOSDemo
//
//  Created by Duy Thien Chau on 4/2/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import Foundation

struct Picture : Decodable, Hashable {
    
    var large: String
    var medium: String
    var thumbnail: String
    
    init(_ pic: PictureEntity) {
        self.large = pic.large ?? ""
        self.medium = pic.medium ?? ""
        self.thumbnail = pic.thumbnail ?? ""
    }
    
    init(large: String, medium: String, thumbnail: String) {
        self.large = large
        self.medium = medium
        self.thumbnail = thumbnail
    }
}
