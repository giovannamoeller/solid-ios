//
//  NotificationService.swift
//  SwiftBank
//
//  Created by Giovanna Moeller on 19/03/24.
//

import Foundation

protocol NotificationServiceProtocol {
    func sendNotification(message: String)
}

class NotificationService: NotificationServiceProtocol {
    func sendNotification(message: String) {
        // Implementação para enviar uma notificação
        print("Notificação enviada: \(message)")
    }
}
