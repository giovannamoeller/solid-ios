//: [Previous](@previous)

//: ### LSP - Sistema de documentos (Bom)

import Foundation

protocol Saveable {
    func save()
}

class Document {
    // Basic Document functionality (which doesn't include saving)
}

// TextDocument conforms to Saveable, indicating it can be saved.
class TextDocument: Document, Saveable {
    func save() {
        print("Saving text document...")
    }
}

// OnlyReadingDocument does not conform to Saveable, as it shouldn't be saved.
class OnlyReadingDocument: Document {
    // Specific functionality for a read-only document
}

// Usage example
func saveDocumentIfNeeded(document: Document) {
    if let saveableDocument = document as? Saveable {
        saveableDocument.save()
    } else {
        print("This document cannot be saved.")
    }
}

// This design adheres to LSP by not requiring subclasses to implement functionality that doesn't apply to them and by using protocols to specify optional functionality.


//: [Next](@next)
