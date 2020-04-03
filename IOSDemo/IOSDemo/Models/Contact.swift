//
//  Contact.swift
//  IOSDemo
//
//  Created by Duy Thien Chau on 3/30/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import Foundation

struct Contact : Decodable, Hashable, Identifiable {
    
    var id: String {
        return email
    }
    var name: Name
    var gender: String
    var email: String
    var cell: String
    var picture: Picture
    var location: Location?
    
    // for view testing
    static let `default` = Contact(name: Name(title: "Mr", first: "Thien", last: "Chau"), gender: "male", email: "duythien011@gmail.com", cell: "641 111 1111",
                                   picture: Picture(
                                    large: "https://randomuser.me/api/portraits/men/82.jpg",
                                    medium: "https://randomuser.me/api/portraits/med/men/82.jpg",
                                    thumbnail: "https://randomuser.me/api/portraits/thumb/men/82.jpg"))
    
    static func == (lhs: Contact, rhs: Contact) -> Bool {
        return lhs.email == rhs.email
    }
    
    init(name: Name, gender: String, email: String, cell: String, picture: Picture) {
        self.name = name
        self.gender = gender
        self.email = email
        self.cell = cell
        self.picture = picture
    }
    
    init(_ contact: ContactEntity) {
        if let name = contact.name.map(Name.init) {
            self.name = name
        } else {
            self.name = Name(title: "", first: "", last: "")
        }
        self.gender = contact.gender ?? ""
        self.email = contact.email ?? ""
        self.cell = contact.cell ?? ""
        if let picture = contact.picture.map(Picture.init) {
            self.picture = picture
        } else {
            self.picture = Picture(large: "", medium: "", thumbnail: "")
        }
    }
    
}


