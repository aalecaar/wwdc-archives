//
//  EventSessionsView.swift
//  WWDCArchives
//
//  Created by xx on 25/05/24.
//

import SwiftUI

struct EventSessionsView: View {
    let sessions: [Session]
    let event: Event
    @State private var searchText = ""
    @State private var filteredSessions: [Session] = []
 
    var body: some View {
        
            List(searchText.isEmpty ? sessions : filteredSessions) { session in
                NavigationLink {
                    SessionDetailView(session: session, event: event)
                } label: {
                    SessionRowView(session: session)
                        
                }
                .listRowSeparator(.hidden, edges: .top)
                .listRowSeparator(.visible, edges: .bottom)
            }
            .listStyle(.plain)
            .navigationTitle(event.name)
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .textInputAutocapitalization(.never)
            .onChange(of: searchText) { _, session in
                filteredSessions = sessions.filter { session in
                    session.title.lowercased().contains(searchText.lowercased()) || session.topic.lowercased().contains(searchText.lowercased()) || session.eventContentID.lowercased().contains(searchText.lowercased())
                }
            }

            
            
        
    }
}

#Preview {
    EventSessionsView(sessions: RecordManager().sessions(for: RecordManager().events[0]), event: RecordManager().events[0])
}
