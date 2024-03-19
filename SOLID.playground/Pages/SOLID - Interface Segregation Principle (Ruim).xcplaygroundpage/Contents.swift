//: [Previous](@previous)

//: ### ISP - Sistema de notificação (Ruim)
import Foundation

protocol NotificationService {
    func sendEmail(email: String, message: String)
    func sendSMS(phoneNumber: String, message: String)
    func sendPushNotification(deviceId: String, message: String)
}

class EmailNotificationService: NotificationService {
    func sendEmail(email: String, message: String) {
        print("Enviando email para \(email) com a mensagem: \(message)")
    }

    func sendSMS(phoneNumber: String, message: String) {
        // Serviço de email não suporta envio de SMS
    }

    func sendPushNotification(deviceId: String, message: String) {
        // Serviço de email não suporta notificações push
    }
}

let emailService = EmailNotificationService()
emailService.sendEmail(email: "usuario@exemplo.com", message: "Bem-vindo!")

//: [Next](@next)
