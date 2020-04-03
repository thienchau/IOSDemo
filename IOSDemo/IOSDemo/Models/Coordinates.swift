//
//  Coordinates.swift
//  IOSDemo
//
//  Created by Duy Thien Chau on 4/2/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import Foundation
import MapKit

struct Coordinates : Decodable, Hashable {
    
    var latitude: String
    var longitude: String
    
    static let `default` = Coordinates(latitude: "34.011286", longitude: "-116.166868")
    
    var coordinate2D: CLLocationCoordinate2D {
        guard let lat = Double(latitude), let long = Double(longitude) else { return Self.default.coordinate2D }
        return CLLocationCoordinate2D(latitude: lat, longitude: long)
    }
    
    init(latitude: String, longitude: String) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    init(_ coord: CoordinatesEntity) {
        self.latitude = coord.latitude ?? ""
        self.longitude = coord.longitude ?? ""
    }
}
