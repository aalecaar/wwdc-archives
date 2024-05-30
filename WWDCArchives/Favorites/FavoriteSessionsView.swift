//
//  FavoriteSessionsView.swift
//  WWDCArchives
//
//  Created by xx on 28/05/24.
//

import SwiftUI

struct FavoriteSessionsView: View {
    let allSessions: [Session]
    let event: Event
    
    private var favoriteSessions: [Session] {
        let favoriteIds = FavoritesManager.shared.favoriteSessionIds()
        return allSessions.filter { favoriteIds.contains($0.id) }
    }
    
    var body: some View {
        NavigationStack {
            List(favoriteSessions) { session in
                NavigationLink(destination: SessionDetailView(session: session, event: event, path: .constant(NavigationPath()))) {
                    SessionRowView(session: session)
                }
                .listRowSeparator(.hidden, edges: .top)
                .listRowSeparator(.visible, edges: .bottom)
            }
            .listStyle(.plain)
            .navigationTitle("Favorite Sessions")
            .overlay {
                if favoriteSessions.isEmpty {
                    Text("No favorite sessions")
                        .foregroundStyle(.secondary)
                        .padding()
                }
            }
        }
    }
}


#Preview {
    Group {
        let event = RecordManager().events[0]
        FavoriteSessionsView(allSessions: RecordManager().sessions(for: event), event: event)
    }
}
