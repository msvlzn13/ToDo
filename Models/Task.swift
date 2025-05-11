//
//  Task.swift
//  ToDoShnik
//
//  Created by DC on 11/05/2025.
//

import Foundation


struct Task: Identifiable, Codable { 
    var id = UUID()
    var title: String
    var date: Date
    var priority: Int
    var isCompleted: Bool
    var note: String?
}
