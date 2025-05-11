//
//  TaskStorageManager.swift
//  ToDoShnik
//
//  Created by DC on 11/05/2025.
//

import Foundation




class TaskStorageManager {
    static let shared = TaskStorageManager()
    
    private let tasksKey = "savedTasks"

    func saveTasks(_ tasks: [Task]) {
        if let encoded = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encoded, forKey: tasksKey)
        }
    }

    func loadTasks() -> [Task] {
        if let savedData = UserDefaults.standard.data(forKey: tasksKey),
           let decoded = try? JSONDecoder().decode([Task].self, from: savedData) { 
            return decoded
        }
        return []
    }
}

