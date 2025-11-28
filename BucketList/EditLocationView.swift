//
//  EditLocationView.swift
//  BucketList
//
//  Created by Antonio Giroz on 28/11/25.
//

import SwiftUI

struct EditLocationView: View {
    @Environment(\.dismiss) var dismiss
    
    var location: Location
    var onSave: (Location) -> Void
    
    @State private var name: String = ""
    @State private var description: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name", text: $name)
                    TextField("Description", text: $description)
                }
            }
            .navigationTitle("Edit Location")
            .toolbar {
                Button("Save", systemImage: "checkmark") {
                    var newLocation = location
                    newLocation.id = UUID()
                    newLocation.name = name
                    newLocation.description = description
                    onSave(newLocation)
                    dismiss()
                }
            }
        }
    }
    
    init(location: Location, onSave: @escaping (Location) -> Void) {
        self.location = location
        self.onSave = onSave
        _name = State(initialValue: location.name)
        _description = State(initialValue: location.description)
    }
}

#Preview {
    EditLocationView(location: .example) { _ in }
}
