//: [Previous](@previous)

//: ### LSP - Sistema de documentos (Ruim)

import Foundation

class Document {
    func save() {
        print("Salvando documento")
    }
}

class TextDocument: Document {
    override func save() {
        print("Salvando documento de texto")
    }
}

class OnlyReadingDocument: Document {
    override func save() {
        fatalError("Não pode salvar um documento somente leitura")
    }
}

//: [Next](@next)
