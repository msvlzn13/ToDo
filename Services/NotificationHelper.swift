//
//  NotificationHelper.swift
//  ToDoShnik
//
//  Created by DC on 11/05/2025.
//

import Foundation
import UserNotifications

class NotificationHelper {
    static let shared = NotificationHelper()

    func requestPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
            if granted {
                print("Powiadomienia włączone")
            } else {
                print("Brak zgody na powiadomienia")
            }
        }
    }

    func scheduleNotification(title: String, body: String, date: Date) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default

        let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: date), repeats: false)

        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request)
    }
}
