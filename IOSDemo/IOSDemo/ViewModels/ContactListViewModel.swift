//
//  ContactListViewModel.swift
//  IOSDemo
//
//  Created by Duy Thien Chau on 3/31/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import Foundation

protocol ContactListViewModelProtocol: ObservableObject {
    associatedtype Item: ContactRowViewModelProtocol
    var errorMessage : String { get set }
    var loading : Bool { get set }
    var contactRowViewModels : [Item] { get }
    
    func loadData()
    func refreshData()
    func logout()
}

final class ContactListViewModel: ContactListViewModelProtocol {
    typealias Item = ContactRowViewModel
    
    @Published var errorMessage : String = ""
    @Published var loading = false
    @Published private(set) var contactRowViewModels : [Item] = []
    
    private var userService: UserSeviceProtocol
    private var userDataManager: UserDataManagerProtocol
    private var appDefaults: AppDefaultsProtocol
    
    init(userService: UserSeviceProtocol,
         userDataManager: UserDataManagerProtocol = UserDataManager(),
         appDefaults: AppDefaultsProtocol = AppDefaults()) {
        self.userService = userService
        self.userDataManager = userDataManager
        self.appDefaults = appDefaults
    }
    
    func loadData() {
        if self.userDataManager.countContacts() > 0 {
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
        
        let _ = self.userService.getUsers().sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                print(error.localizedDescription)
            }
            self.loading = false
        }
            , receiveValue: { result in
                switch result {
                case .success(var contacts):
                    contacts.sort { (contact1, contact2) -> Bool in
                        return contact1.name.first < contact2.name.first
                    }
                    self.contactRowViewModels = contacts.map(ContactRowViewModel.init)
                    self.userDataManager.deleteAll()
                    self.userDataManager.saveContacts(contacts: contacts)
                    self.errorMessage = ""
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
        })
        
    }
    
    private func loadFromDatabase() {
        self.loading = true
        self.contactRowViewModels = self.userDataManager.getAllContact().map(ContactRowViewModel.init)
        self.loading = false
    }
    
    func logout() {
        self.appDefaults.saveLogin(false)
        self.userDataManager.deleteAll()
    }
}
