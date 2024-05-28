//
//  FavoriteSessionsView.swift
//  WWDCArchives
//
//  Created by xx on 28/05/24.
//

import SwiftUI

struct FavoriteSessionsView: View {
    @Binding var sessionDetailViews: [SessionDetailView]
    @State private var path = NavigationPath()
    var body: some View {
        List(sessionDetailViews, id: \.session.id) { sessionDetailView in
            sessionDetailView
        }
    }
}

#Preview {
    NavigationStack {
        let record = RecordManager()
        @State var isFavorite = false
        @State var path = NavigationPath()
        @State var sesssionDetailViews = [SessionDetailView(session: record.allSessions[0], event: record.events[0], path: $path),
                                          SessionDetailView(session: record.allSessions[0], event: record.events[0], path: $path)]
        FavoriteSessionsView(sessionDetailViews: $sesssionDetailViews)
    }
}
