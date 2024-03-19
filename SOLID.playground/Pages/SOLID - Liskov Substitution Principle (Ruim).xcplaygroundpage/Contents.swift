//: [Previous](@previous)

//: ### LSP - Sistema de pagamento de funcionários (Ruim)
import Foundation

class Employee {
    var hourlyRate: Double
    
    init(hourlyRate: Double) {
        self.hourlyRate = hourlyRate
    }
    
    func calculatePay(hoursWorked: Double) -> Double {
        return hoursWorked * hourlyRate
    }
}

class FullTimeEmployee: Employee {
    // Propriedades e métodos adicionais para empregadores full-time podem ser adicionados aqui
}

class PartTimeEmployee: Employee {
    // Viola o LSP: O método calculatePay é escrito de uma maneira que altera o comportamento
    override func calculatePay(hoursWorked: Double) -> Double {
        return 100 // Empregadores part-time obtém um pagamento fixo de $100, independente do número de horas
    }
}

let employees: [Employee] = [FullTimeEmployee(hourlyRate: 10), PartTimeEmployee(hourlyRate: 10)]
employees.forEach { employee in
    print(employee.calculatePay(hoursWorked: 40))
}

//: [Next](@next)
