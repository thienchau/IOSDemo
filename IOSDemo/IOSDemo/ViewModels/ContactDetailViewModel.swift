//
//  ContactDetailViewModel.swift
//  IOSDemo
//
//  Created by Duy Thien Chau on 3/31/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import Foundation
import MapKit

protocol ContactDetailViewModelProtocol {
    var imageURL: URL? { get }
    var name: String { get }
    var email: String { get }
    var address: String { get }
    var phone: String { get }
    var coordinate: CLLocationCoordinate2D { get }
}

final class ContactDetailViewModel: ContactDetailViewModelProtocol {
    
    private(set) var imageURL: URL?
    private(set) var name: String
    private(set) var email: String
    private(set) var address: String
    private(set) var phone: String
    private(set) var coordinate: CLLocationCoordinate2D
    
    init(_ contact: Contact) {
        self.imageURL = URL(string: contact.picture.large)
        self.name = contact.name.fullName
        self.email = contact.email
        self.phone = contact.cell
        self.address = contact.location?.address ?? ""
        self.coordinate = contact.location?.coordinates.coordinate2D ?? Coordinates.default.coordinate2D
    }
}
