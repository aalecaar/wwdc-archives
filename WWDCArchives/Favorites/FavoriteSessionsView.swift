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
    @State private var searchText = ""

    
    private var favoriteSessions: [Session] {
        return allSessions.filter { favoritesManager.favoriteSessionIds.contains($0.id) }
    }
    
    var body: some View {
        NavigationStack {
            List(filteredSessions) { session in
                NavigationLink(destination: SessionDetailView(session: session, event: event, path: $path, showHomeToolbar: showHomeToolbar)) {
                    SessionRowView(session: session)
                }
                .listRowSeparator(.hidden, edges: .top)
                .listRowSeparator(.visible, edges: .bottom)
            }
            .listStyle(.plain)
            .navigationTitle("Favorites")
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
            .animation(.easeInOut, value: filteredSessions)
            .overlay {
                if favoriteSessions.isEmpty {
                    ContentUnavailableView {
                        Label("No Favorites", systemImage: "star.slash")
                    } description: {
                        Text("Explore any event and add your favorite sessions.")
                    }
                }
            }
        }
    }
    
    var filteredSessions: [Session] {
        guard !searchText.isEmpty else { return favoriteSessions }
        
        let filteredSessions = favoriteSessions.filter { session in
            session.title.lowercased().contains(searchText.lowercased()) ||
            session.topic.lowercased().contains(searchText.lowercased()) ||
            session.eventContentID.lowercased().contains(searchText.lowercased())
        }
        
        return filteredSessions
    }
}


#Preview {
    Group {
        let event = RecordManager().events[0]
        FavoriteSessionsView(allSessions: RecordManager().sessions(for: event), event: event, path: Binding.constant(NavigationPath()))
    }
}
