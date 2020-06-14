//
//  ContactRowViewModel.swift
//  IOSDemo
//
//  Created by Duy Thien Chau on 3/31/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import Foundation

protocol ContactRowViewModelProtocol: Identifiable {
    var id: String { get }
    var imageURL: URL { get }
    var name: String { get }
    var subContent: String { get }
    var contact: Contact { get }
}

final class ContactRowViewModel: ContactRowViewModelProtocol {
    
    private(set) var id: String
    private(set) var imageURL: URL
    private(set) var name: String
    private(set) var subContent: String
    let contact: Contact
    
    init(_ contact: Contact) {
        self.contact = contact
        self.id = contact.id
        self.imageURL = URL(string: contact.picture.medium)!
        self.name = contact.name.fullName
        self.subContent = contact.email
    }
    
}
