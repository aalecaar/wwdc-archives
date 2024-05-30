//
//  FavoriteSessionsView.swift
//  WWDCArchives
//
//  Created by xx on 28/05/24.
//

import SwiftUI

struct FavoriteSessionsView: View {
    @State private var favoritesManager = FavoritesManager.shared
    let allSessions: [Session]
    let event: Event
    @Binding var path: NavigationPath
    let showHomeToolbar = false
    
    private var favoriteSessions: [Session] {
        return allSessions.filter { favoritesManager.favoriteSessionIds.contains($0.id) }
    }
    
    var body: some View {
        NavigationStack {
            List(favoriteSessions) { session in
                NavigationLink(destination: SessionDetailView(session: session, event: event, path: $path, showHomeToolbar: showHomeToolbar)) {
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
        FavoriteSessionsView(allSessions: RecordManager().sessions(for: event), event: event, path: Binding.constant(NavigationPath()))
    }
}
