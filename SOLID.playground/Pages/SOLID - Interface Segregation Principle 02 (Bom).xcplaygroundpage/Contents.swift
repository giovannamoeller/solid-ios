//: [Previous](@previous)

//: ### ISP - Sistema de impressão (Bom)

protocol Printer {
    func printDocument()
}

protocol Scanner {
    func scanDocument()
}

protocol FaxMachine {
    func sendFax()
    func receiveFax()
}

class AllInOnePrinter: Printer, Scanner, FaxMachine {
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

class SimplePrinter: Printer {
    func printDocument() {
        print("Printing document...")
    }
}

//: [Next](@next)
