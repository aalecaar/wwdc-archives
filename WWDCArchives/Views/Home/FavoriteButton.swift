//
//  FavoriteButton.swift
//  WWDCArchives
//
//  Created by xx on 30/05/24.
//

import SwiftUI

struct FavoriteButton: View {
    let sessionId: String
    @State private var isFavorite: Bool
    
    init(sessionId: String) {
        self.sessionId = sessionId
        _isFavorite = State(initialValue: FavoritesManager.shared.isFavorite(sessionId: sessionId))
    }
    
    var body: some View {
        
        Button {
            FavoritesManager.shared.toggleFavorite(sessionId: sessionId)
            isFavorite.toggle()
        } label: {
            Image(systemName: isFavorite ? "star.fill" : "star")
                .font(.title2)
                .symbolEffect(.bounce, value: isFavorite)
                .sensoryFeedback(.selection, trigger: isFavorite)
        }
        .foregroundStyle(isFavorite ? .yellow : .secondary)
        
    }
}

#Preview {
    FavoriteButton(sessionId: RecordManager().allSessions[0].id)
}
