//
//  EventsView.swift
//  WWDCArchives
//
//  Created by xx on 26/05/24.
//

import SwiftUI

struct EventsView: View {
    @State private var record = RecordManager()
    
    var body: some View {
        NavigationStack {
            List(record.events) { event in
                NavigationLink {
                    EventSessionsView(sessions: record.sessions(for: event), event: event)
                } label: {
                    EventRowView(event: event)
                }
                .listRowSeparator(.hidden, edges: .top)
                .listRowSeparator(.visible, edges: .bottom)
                // Repeating this modifier in this way allowed me to delete the separator on top of the first row (in reality, it hides the separator on top of every view), which made the navigation tittle seems like it had a separator below it, which is ugly.
                
                
                
            }
            .listStyle(.plain)
            .navigationTitle("Events")
            
            
        }
    }
}

#Preview {
    EventsView()
}
