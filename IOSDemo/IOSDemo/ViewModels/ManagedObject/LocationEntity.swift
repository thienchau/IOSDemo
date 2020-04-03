//
//  LocationEntity+CoreDataProperties.swift
//  IOSDemo
//
//  Created by Duy Thien Chau on 4/1/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//
//

import Foundation
import CoreData


extension LocationEntity {

    var location: Location {
        get {
            return Location(self)
        }
        set {
            self.city = newValue.city
            self.state = newValue.state
            self.country = newValue.country
            self.id = UUID()
            let coorEntity = CoordinatesEntity(context: self.managedObjectContext!)
            coorEntity.coordinates = newValue.coordinates
            self.coordinates = coorEntity
        }
    }
}
