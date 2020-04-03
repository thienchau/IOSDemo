//
//  Location.swift
//  IOSDemo
//
//  Created by Duy Thien Chau on 4/2/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import Foundation

struct Location : Decodable, Hashable {
    
    var city: String
    var state: String
    var country: String
    var coordinates: Coordinates
    
    var address: String {
        return city + ", " + state + ", " + country
    }
    
    init(_ loc: LocationEntity) {
        self.city = loc.city ?? ""
        self.state = loc.state ?? ""
        self.country = loc.country ?? ""
        if let coor = loc.coordinates.map(Coordinates.init) {
            self.coordinates = coor
        } else {
            self.coordinates = Coordinates.default
        }
    }
}
