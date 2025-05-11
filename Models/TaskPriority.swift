//
//  TaskPriority.swift
//  ToDoShnik
//
//  Created by DC on 11/05/2025.
//

import Foundation


enum TaskPriority: Int, Codable {
    case niski = 1
    case sredni = 2
    case wysoki = 3

    var description: String {
        switch self {
        case .niski: return "Niski"
        case .sredni: return "Średni"
        case .wysoki: return "Wysoki"
        }
    }

    var color: String {
        switch self {
        case .niski: return "Zielony"
        case .sredni: return "Pomarańczowy"
        case .wysoki: return "Czerwony"
        }
    }
}
