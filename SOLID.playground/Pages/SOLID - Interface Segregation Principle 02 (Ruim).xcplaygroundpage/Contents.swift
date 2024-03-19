//: [Previous](@previous)

//: ### ISP - Sistema de impressão (Ruim)

import Foundation

protocol PrinterProtocol {
    func printDocument()
    func scanDocument()
    func sendFax()
    func receiveFax()
}

class SimplePrinter: PrinterProtocol {
    func printDocument() {
        print("Printing document...")
    }

    func scanDocument() {
        print("Scanning document...")
    }

    func sendFax() {
        print("Sending fax...")
    }

    func receiveFax() {
        print("Receiving fax...")
    }
}

//: [Next](@next)
