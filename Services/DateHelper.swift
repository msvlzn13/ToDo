//
//  DateHelper.swift
//  ToDoShnik
//
//  Created by Dc on 11/05/2025.
//

import Foundation


class DateHelper {
    static let shared = DateHelper()

    func isToday(_ date: Date) -> Bool {
        return Calendar.current.isDateInToday(date)
    }

    func formatDate(_ date: Date, format: String = "dd.MM.yyyy") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }

    func formatTime(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }
}
