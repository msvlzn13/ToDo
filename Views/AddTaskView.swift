//
//  AddTaskView.swift
//  ToDoShnik
//
//  Created by DC on 11/05/2025.
//

import Foundation
import SwiftUI

struct AddTaskView: View {
    @State private var taskTitle = ""
    @State private var taskDate = Date()
    @State private var taskPriority = 1
    @EnvironmentObject var taskViewModel: TaskViewModel

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Nazwa zadania", text: $taskTitle)
                        .padding(.vertical, 10)
                        
                }

                Section {
                    DatePicker("Data i czas", selection: $taskDate, displayedComponents: [.date, .hourAndMinute])
                        .padding(.vertical, 10)
                }

                Section {
                    Picker("Priorytet", selection: $taskPriority) {
                        Text("Niski").tag(1)
                        Text("Średni").tag(2)
                        Text("Wysoki").tag(3)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.vertical, 10)
                }

                Section {
                    Button("Dodaj zadanie") {
                        taskViewModel.addTask(title: taskTitle, date: taskDate, priority: taskPriority)
                        taskTitle = ""
                    }
                    .frame(maxWidth: .infinity, alignment: .center) 
                    .padding(.vertical, 15)
                }
            }
            .navigationTitle("")
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Dodaj zadanie")
                        .font(.title)
                        .bold()
                }
            }

        }
    }
}

