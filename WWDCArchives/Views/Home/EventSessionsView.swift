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
    @Binding var path: NavigationPath
    @State private var searchText = ""
    let showHomeToolbar = true
    
    var body: some View {
        List(filteredSessions) { session in
            NavigationLink(value: session) {
                SessionRowView(session: session)
            }
            .listRowSeparator(.hidden, edges: .top)
            .listRowSeparator(.visible, edges: .bottom) // This deletes the line separator on top of the first item. I guess this should not be necessary, but it's the only way I could achieved the desired result
        }
        .listStyle(.plain)
        .navigationDestination(for: Session.self, destination: { session in
            SessionDetailView(session: session, event: event, path: $path, showHomeToolbar: showHomeToolbar)
        })
        .navigationTitle(event.name)
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        .textInputAutocapitalization(.never)
        .autocorrectionDisabled()
        .animation(.easeInOut, value: filteredSessions)
        .overlay {
            if filteredSessions.isEmpty {
                    ContentUnavailableView.search(text: searchText)
            }
        }
    }
    
    var filteredSessions: [Session] {
        guard !searchText.isEmpty else { return sessions }
        
        let filteredSessions = sessions.filter { session in
            session.title.lowercased().contains(searchText.lowercased()) ||
            session.topic.lowercased().contains(searchText.lowercased()) ||
            session.eventContentID.lowercased().contains(searchText.lowercased())
        }
        
        return filteredSessions
    }
}

#Preview {
    NavigationStack {
        @State var path = NavigationPath()
        EventSessionsView(sessions: RecordManager().sessions(for: RecordManager().events[0]), event: RecordManager().events[0], path: $path)
    }
}
