//
//  ContentView.swift
//  ToDoShnik
//
//  Created by DC on 11/05/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            AddTaskView()
                .tabItem {
                    Label("Dodaj zadanie", systemImage: "plus.circle")
                }

            TodayTasksView()
                .tabItem {
                    Label("Dzisiaj", systemImage: "calendar")
                }

            CalendarTasksView()
                .tabItem {
                    Label("Kalendarz", systemImage: "list.bullet")
                }

            NotesView()
                .tabItem {
                    Label("Notatki", systemImage: "pencil")
                }
        }
    }
}




#Preview {
    ContentView()
        .environmentObject(TaskViewModel())
}

