//: [Previous](@previous)

//: ### DIP - Sistema de armazenamento de dados (Bom)
import Foundation

protocol DataStorage {
    func save(data: String)
}

class LocalStorage: DataStorage {
    func save(data: String) {
        print("Salvando dados no armazenamento local: \(data)")
    }
}

class CloudStorage: DataStorage {
    func save(data: String) {
        print("Salvando dados na nuvem: \(data)")
    }
}

class UserDataManager {
    var storage: DataStorage

    init(storage: DataStorage) {
        self.storage = storage
    }

    func saveUserData(userData: String) {
        storage.save(data: userData)
    }
}

let localStore = LocalStorage()
let cloudStore = CloudStorage()
let userManagerLocal = UserDataManager(storage: localStore)
let userManagerCloud = UserDataManager(storage: cloudStore)

userManagerLocal.saveUserData(userData: "Dados do usuário no local")
userManagerCloud.saveUserData(userData: "Dados do usuário na nuvem")

//: [Next](@next)
