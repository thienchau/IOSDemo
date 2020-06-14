//
//  CoreDataManager.swift
//  IOSDemo
//
//  Created by Duy Thien Chau on 4/1/20.
//  Copyright © 2020 Duy Thien Chau. All rights reserved.
//

import Foundation
import CoreData


protocol UserDataManagerProtocol {
    
    func getAllContact() -> [Contact]
    func countContacts() -> Int
    func saveContacts(contacts: [Contact])
    func deleteAll()
    
}

class UserDataManager {
    
    private var moc: NSManagedObjectContext
    
    init(moc: NSManagedObjectContext = NSManagedObjectContext.current) {
        self.moc = moc
    }
}

extension UserDataManager: UserDataManagerProtocol {
    
    func getAllContact() -> [Contact] {
        
        var contactEntities = [ContactEntity]()
        let contactEntityRequest: NSFetchRequest<ContactEntity> = ContactEntity.fetchRequest();
        let sort = NSSortDescriptor(key: "name.first", ascending: true)
        contactEntityRequest.sortDescriptors = [sort]
        
        do {
            contactEntities = try self.moc.fetch(contactEntityRequest)
        } catch let error as NSError {
            print(error)
        }
        
        return contactEntities.map { entity -> Contact in
            entity.contact
        }
    }
    
    func countContacts() -> Int {
        let contactEntityRequest: NSFetchRequest<ContactEntity> = ContactEntity.fetchRequest();
        var count = 0
        
        do {
            count = try self.moc.count(for: contactEntityRequest)
        } catch {
            count = 0
        }
        return count
    }
    
    func saveContacts(contacts: [Contact]) {
        for contact in contacts {
            let contactEntity = ContactEntity(context: self.moc)
            contactEntity.contact = contact
        }
        
        do {
            try self.moc.save()
        } catch {
            print(error)
        }
    }
    
    func deleteAll() {
        let deleteReq = NSBatchDeleteRequest(fetchRequest: ContactEntity.fetchRequest())
        
        do {
            try self.moc.execute(deleteReq)
        }
        catch {
            print(error)
        }
    }
}
