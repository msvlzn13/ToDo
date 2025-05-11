//
//  TodayTasksView.swift
//  ToDoShnik
//
//  Created by DC on 11/05/2025.
//

import Foundation
import SwiftUI

struct TodayTasksView: View {
    @EnvironmentObject var taskViewModel: TaskViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Zadania na dzisiaj")
                    .font(.title)
                    .bold()
                    .padding(.top)

                List {
                    ForEach(taskViewModel.tasks.filter { Calendar.current.isDateInToday($0.date) }) { task in
                        HStack {
                            Text(task.title)
                                .foregroundColor(task.priority == 1 ? .green : task.priority == 2 ? .orange : .red)
                            
                            Spacer()
                            
                            Button(action: {
                                withAnimation {
                                    taskViewModel.toggleCompletion(task: task)
                                }
                            }) {
                                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                            }
                        }
                        .padding(.vertical, 5)
                        .transition(.slide) 
                    }
                    .onDelete { indexSet in
                        taskViewModel.tasks.remove(atOffsets: indexSet)
                    }
                }
            }
            
        }
    }
}

