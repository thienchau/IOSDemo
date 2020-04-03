//
//  ContactRowViewModel.swift
//  IOSDemo
//
//  Created by Duy Thien Chau on 3/31/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import Foundation

final class ContactRowViewModel: Identifiable {
    
    var id: String
    var imageURL: URL
    var name: String
    var subContent: String
    let contact: Contact
    
    init(_ contact: Contact) {
        self.contact = contact
        self.id = contact.id
        self.imageURL = URL(string: contact.picture.medium)!
        self.name = contact.name.fullName
        self.subContent = contact.email
    }
    
    convenience init(_ contact: ContactEntity) {
        self.init(contact.contact)
    }
}
