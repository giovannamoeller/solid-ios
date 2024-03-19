//: [Previous](@previous)

//: ### DIP - Sistema de cadstro de usuários (Ruim)

import Foundation

class UserRepository {
    var realmManager = RealmDatabaseManager()
    
    func saveUser() {
        do {
            try realmManager.save(object: Data())
        } catch(let error) {
            print(error.localizedDescription)
        }
    }
}

class RealmDatabaseManager {
    func save(object: Data) throws {
        // Salvando um objeto no Realm
    }
}

let userRepository = UserRepository()
userRepository.saveUser()

//: [Next](@next)
