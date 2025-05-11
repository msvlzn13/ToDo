//
//  TaskViewModel.swift
//  ToDoShnik
//
//  Created by DC on 11/05/2025.
//

import Foundation

import SwiftUI

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = [] {
        didSet {
            TaskStorageManager.shared.saveTasks(tasks)
        }
    }

    init() {
        self.tasks = TaskStorageManager.shared.loadTasks() 
    }

    func addTask(title: String, date: Date, priority: Int) {
        let newTask = Task(title: title, date: date, priority: priority, isCompleted: false)
        tasks.append(newTask)
    }

    func toggleCompletion(task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }

    func removeTask(task: Task) {
        tasks.removeAll { $0.id == task.id }
    }
}

