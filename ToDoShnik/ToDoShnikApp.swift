//
//  ToDoShnikApp.swift
//  ToDoShnik
//
//  Created by DC on 11/05/2025.
//

import SwiftUI



@main
struct ToDoShnikApp: App {
    @StateObject var taskViewModel = TaskViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(taskViewModel) 
        }
    }
}
