//
//  PictureEntity+CoreDataProperties.swift
//  IOSDemo
//
//  Created by Duy Thien Chau on 4/1/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//
//

import Foundation
import CoreData


extension PictureEntity {

    var picture: Picture {
        get {
            return Picture(self)
        }
        set {
            self.large = newValue.large
            self.medium = newValue.medium
            self.thumbnail = newValue.thumbnail
            self.id = UUID()
        }
    }
}
