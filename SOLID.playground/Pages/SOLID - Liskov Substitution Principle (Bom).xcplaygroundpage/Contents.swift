//: [Previous](@previous)

//: ### LSP - Sistema de pagamento de funcionários (Bom)
import Foundation

protocol PayCalculator {
    func calculatePay(hoursWorked: Double) -> Double
}

class HourlyPayCalculator: PayCalculator {
    var hourlyRate: Double
    
    init(hourlyRate: Double) {
        self.hourlyRate = hourlyRate
    }
    
    func calculatePay(hoursWorked: Double) -> Double {
        return hoursWorked * hourlyRate
    }
}

class FixedPayCalculator: PayCalculator {
    var fixedAmount: Double
    
    init(fixedAmount: Double) {
        self.fixedAmount = fixedAmount
    }
    
    func calculatePay(hoursWorked: Double) -> Double {
        return fixedAmount
    }
}

class Employee {
    var payCalculator: PayCalculator
    
    init(payCalculator: PayCalculator) {
        self.payCalculator = payCalculator
    }
    
    func calculatePay(hoursWorked: Double) -> Double {
        return payCalculator.calculatePay(hoursWorked: hoursWorked)
    }
}

let fullTimeEmployee = Employee(payCalculator: HourlyPayCalculator(hourlyRate: 10))
let partTimeEmployee = Employee(payCalculator: FixedPayCalculator(fixedAmount: 100))
let employees: [Employee] = [fullTimeEmployee, partTimeEmployee]

employees.forEach { employee in
    print(employee.calculatePay(hoursWorked: 40))
}


//: [Next](@next)
