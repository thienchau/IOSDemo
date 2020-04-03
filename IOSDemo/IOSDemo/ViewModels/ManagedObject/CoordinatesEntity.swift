//
//  CoordinatesEntity+CoreDataProperties.swift
//  IOSDemo
//
//  Created by Duy Thien Chau on 4/1/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//
//

import Foundation
import CoreData


extension CoordinatesEntity {

    var coordinates: Coordinates {
        get {
            return Coordinates(self)
        }
        set {
            self.latitude = newValue.latitude
            self.longitude = newValue.longitude
            self.id = UUID()
        }
    }
}
