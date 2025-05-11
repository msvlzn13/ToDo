//
//  CalendarTasksView.swift
//  ToDoShnik
//
//  Created by DC on 11/05/2025.
//

import Foundation

import SwiftUI

struct CalendarTasksView: View {
    @EnvironmentObject var taskViewModel: TaskViewModel
    @State private var selectedDate = Date()

    var body: some View {
        NavigationView {
            VStack {
                DatePicker("Wybierz datę", selection: $selectedDate, displayedComponents: [.date])
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .padding()

                List {
                    ForEach(taskViewModel.tasks.filter { Calendar.current.isDate($0.date, inSameDayAs: selectedDate) }) { task in
                        HStack {
                            Text(task.title)
                            Spacer()
                            Button(action: {
                                taskViewModel.toggleCompletion(task: task)
                            }) {
                                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                            }
                        }
                    }
                    .onDelete { indexSet in
                        taskViewModel.tasks.remove(atOffsets: indexSet)
                    }
                }
            }
            .navigationTitle("")
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Zadania na datę")
                        .font(.title2)
                        .bold()
                        .multilineTextAlignment(.center) 
                }
            }

            
        }
    }
}
