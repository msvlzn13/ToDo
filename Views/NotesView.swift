//
//  NotesView.swift
//  ToDoShnik
//
//  Created by DC on 11/05/2025.
//

import Foundation

import SwiftUI

import SwiftUI

struct NotesView: View {
    @State private var selectedDate = Date()
    @State private var noteText = ""
    @State private var notes: [String] = []

    var body: some View {
        NavigationView {
            VStack {
                DatePicker("Wybierz dzień", selection: $selectedDate, displayedComponents: [.date])
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .padding()
                    .onChange(of: selectedDate) { newDate in
                        loadNotes(for: newDate)
                    }

                TextField("Wpisz notatkę", text: $noteText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button("Zapisz notatkę") {
                    saveNote()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.bottom, 15)

                List(notes, id: \.self) { note in
                    Text(note)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                }
            }
            .padding()
            .navigationTitle("")
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Notatki")
                        .font(.title2)
                        .bold()
                        .multilineTextAlignment(.center)
                }
            }

            .onAppear {
                loadNotes(for: selectedDate)
            }
        }
    }

    func saveNote() {
        guard !noteText.isEmpty else { return }
        notes.append(noteText)
        UserDefaults.standard.set(notes, forKey: dateKey(selectedDate))
        noteText = ""    
    }
    

    func loadNotes(for date: Date) {
        notes = UserDefaults.standard.stringArray(forKey: dateKey(date)) ?? [] 
    }

    func dateKey(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return "notes-\(formatter.string(from: date))"
    }
}







