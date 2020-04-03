//
//  ContactListViewModel.swift
//  IOSDemo
//
//  Created by Duy Thien Chau on 3/31/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import Foundation


final class ContactListViewModel: ObservableObject {
    
    @Published var errorMessage : String = ""
    @Published var loading = false
    @Published private(set) var contactRowViewModels : [ContactRowViewModel] = []
    
    func loadData() {
        if CoreDataManager.shared.countContacts() > 0 {
            loadFromDatabase()
        } else {
            loadFromServer()
        }
    }
    
    func refreshData() {
        loadFromServer()
    }
    
    private func loadFromServer() {
        self.loading = true
        APIService.shared.response(from: UserRequestType()) {
            response, error in
            if (error == nil && response != nil) {
                if let response = response as? GetUserResponse {
                    var contacts = response.results
                    contacts.sort { (contact1, contact2) -> Bool in
                        return contact1.name.first < contact2.name.first
                    }
                    self.contactRowViewModels = contacts.map(ContactRowViewModel.init)
                    CoreDataManager.shared.deleteAll()
                    CoreDataManager.shared.saveContacts(contacts: contacts)
                    self.errorMessage = ""
                }
            }
            else if (error == APIServiceError.responseError) {
                self.errorMessage = "serverError"
            }
            else if (error == APIServiceError.parseError) {
                self.errorMessage = "parseError"
            }
            self.loading = false
        }
    }
    
    private func loadFromDatabase() {
        self.loading = true
        self.contactRowViewModels = CoreDataManager.shared.getAllContact().map(ContactRowViewModel.init)
        self.loading = false
    }
}
