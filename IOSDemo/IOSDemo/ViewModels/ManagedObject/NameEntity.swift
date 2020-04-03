//
//  NameEntity+CoreDataProperties.swift
//  IOSDemo
//
//  Created by Duy Thien Chau on 4/1/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//
//

import Foundation
import CoreData


extension NameEntity {

    var name: Name {
        get {
            return Name(self)
        }
        set {
            self.title = newValue.title
            self.first = newValue.first
            self.last = newValue.last
            self.id = UUID()
        }
    }
}
