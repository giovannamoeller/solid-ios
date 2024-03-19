//: [Previous](@previous)

//: ### ISP - Sistema de notificação (Ruim)
import Foundation

protocol EmailNotifier {
    func sendEmail(email: String, message: String)
}

protocol SMSNotifier {
    func sendSMS(phoneNumber: String, message: String)
}

protocol PushNotifier {
    func sendPushNotification(deviceId: String, message: String)
}

class EmailNotificationService: EmailNotifier {
    func sendEmail(email: String, message: String) {
        print("Enviando email para \(email) com a mensagem: \(message)")
    }
}

// Agora, podemos criar serviços específicos para SMS e notificações push, se necessário, sem forçar uma classe a implementar métodos irrelevantes.

let emailService = EmailNotificationService()
emailService.sendEmail(email: "usuario@exemplo.com", message: "Bem-vindo!")

//: [Next](@next)
