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
            List(0..<record.events.count, id: \.self) { index in
                NavigationLink(value: record.events[index]) {
                    EventRowView(event: record.events[index], customDescription: record.customDescriptions[index])
                        
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
