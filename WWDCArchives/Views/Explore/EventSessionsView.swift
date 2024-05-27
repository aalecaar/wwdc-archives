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
    var body: some View {
        List(sessions) { session in
            LazyVStack {
                NavigationLink {
                    SessionDetailView(session: session, event: event)
                } label: {
                    SessionRowView(session: session)
                }
                
            }
            .listRowSeparator(.hidden, edges: .top)
            .listRowSeparator(.visible, edges: .bottom)
        }
        .listStyle(.plain)
        .navigationTitle(event.name)
    }
}

#Preview {
    EventSessionsView(sessions: RecordManager().sessions(for: RecordManager().events[0]), event: RecordManager().events[0])
}
