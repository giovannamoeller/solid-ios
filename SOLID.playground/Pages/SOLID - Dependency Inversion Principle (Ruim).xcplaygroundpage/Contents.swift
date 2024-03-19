//: [Previous](@previous)

//: ### DIP - Sistema de armazenamento de dados (Ruim)
import Foundation

class LocalStorage {
    func saveData(data: String) {
        print("Salvando dados no armazenamento local: \(data)")
    }
}

class UserDataManager {
    let storage = LocalStorage()

    func saveUserData(userData: String) {
        storage.saveData(data: userData)
    }
}

let userManager = UserDataManager()
userManager.saveUserData(userData: "Dados do usuário")

//: [Next](@next)
