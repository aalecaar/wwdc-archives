//
//  EventsView.swift
//  WWDCArchives
//
//  Created by xx on 26/05/24.
//

import SwiftUI

struct EventsView: View {
    @State private var record = RecordManager()
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path) {
            List(record.events) { event in
                NavigationLink(value: event) {
                    EventRowView(event: event)
                }
                .listSectionSeparator(.hidden, edges: .top)
            }
            .listStyle(.plain)
            .navigationDestination(for: Event.self) { event in
                EventSessionsView(sessions: record.sessions(for: event), event: event, path: $path)
            }
            .navigationTitle("Home")
            
            
        }
    }
}

#Preview {
    EventsView()
}
