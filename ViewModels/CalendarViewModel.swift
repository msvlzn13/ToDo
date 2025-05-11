//
//  CalendarViewModel.swift
//  ToDoShnik
//
//  Created by DC on 11/05/2025.
//

import Foundation
import SwiftUI

class CalendarViewModel: ObservableObject {
    @Published var selectedDate = Date()

    func tasksForDate(_ tasks: [Task], date: Date) -> [Task] {
        return tasks.filter { Calendar.current.isDate($0.date, inSameDayAs: date) }
    }
}
