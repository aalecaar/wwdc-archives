//
//  FavoritesView.swift
//  WWDCArchives
//
//  Created by xx on 30/05/24.
//

import SwiftUI

struct FavoritesView: View {
    let allSessions: [Session]
    let event: Event
    var body: some View {
        FavoriteSessionsView(allSessions: allSessions, event: event)
    }
}

//#Preview {
//    FavoritesView(allSessions: <#[Session]#>, event: <#Event#>)
//}
