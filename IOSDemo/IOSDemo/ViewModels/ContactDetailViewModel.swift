//
//  ContactDetailViewModel.swift
//  IOSDemo
//
//  Created by Duy Thien Chau on 3/31/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import Foundation
import MapKit

final class ContactDetailViewModel {
    
    var imageURL: URL?
    var name: String
    var email: String
    var address: String
    var phone: String
    var coordinate: CLLocationCoordinate2D
    
    init(_ contact: Contact) {
        self.imageURL = URL(string: contact.picture.large)
        self.name = contact.name.fullName
        self.email = contact.email
        self.phone = contact.cell
        self.address = contact.location?.address ?? ""
        self.coordinate = contact.location?.coordinates.coordinate2D ?? Coordinates.default.coordinate2D
    }
}
