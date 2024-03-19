//: [Previous](@previous)

//: ### DIP - Sistema de cadstro de usuários (Bom)

protocol DatabaseManager {
    func save(object: Data) throws
}

import Foundation

class UserRepository {
    var databaseManager: DatabaseManager
    
    init(databaseManager: DatabaseManager) {
        self.databaseManager = databaseManager
    }
    
    func saveUser() {
        do {
            try realmManager.save(object: Data())
        } catch(let error) {
            print(error.localizedDescription)
        }
    }
}

class RealmDatabaseManager: DatabaseManager {
    func save(object: Data) throws {
        // Salvando um objeto no Realm
    }
}

class MongoDatabaseManager: DatabaseManager {
    func save(object: Data) throws {
        // Salvando um objeto no Mongo DB
    }
}

let realmManager = RealmDatabaseManager()
let userRepository = UserRepository(databaseManager: realmManager)
userRepository.saveUser()

//: [Next](@next)
