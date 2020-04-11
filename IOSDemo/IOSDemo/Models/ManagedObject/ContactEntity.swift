//
//  ContactEntity+CoreDataProperties.swift
//  IOSDemo
//
//  Created by Duy Thien Chau on 4/1/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//
//

import Foundation
import CoreData


extension ContactEntity {
    
    var contact: Contact {
        get {
            return Contact(self)
        }
        set {
            self.gender = newValue.gender
            self.email = newValue.email
            self.cell = newValue.cell
            self.id = UUID()
            let name = NameEntity(context: self.managedObjectContext!)
            name.name = newValue.name
            self.name = name
            let location = LocationEntity(context: self.managedObjectContext!)
            location.location = newValue.location!
            self.location = location
            let picture = PictureEntity(context: self.managedObjectContext!)
            picture.picture = newValue.picture
            self.picture = picture
        }
    }
}
