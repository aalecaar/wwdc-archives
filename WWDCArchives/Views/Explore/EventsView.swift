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
                NavigationLink(value: event) {
                    EventRowView(event: event)
                }
                .listSectionSeparator(.hidden, edges: .top)
            }
            .listStyle(.plain)
            .navigationDestination(for: Event.self) { event in
                EventSessionsView(sessions: record.sessions(for: event), event: event)
            }
            .navigationTitle("Events")
            
            
        }
    }
}

#Preview {
    EventsView()
}
