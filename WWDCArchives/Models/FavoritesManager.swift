//
//  FavoritesManager.swift
//  WWDCArchives
//
//  Created by xx on 30/05/24.
//

import Foundation

@Observable
class FavoritesManager {
    static let shared = FavoritesManager()
    private let defaults = UserDefaults.standard
    private let keyPrefix = "favorite_"
    
    private(set) var favoriteSessionIds: [String] = []
    
    private init() {
        favoriteSessionIds = loadFavoriteSessionIds()
    }
    
    func isFavorite(sessionId: String) -> Bool {
        return favoriteSessionIds.contains(sessionId)
    }
    
    func toggleFavorite(sessionId: String) {
        if isFavorite(sessionId: sessionId) {
            favoriteSessionIds.removeAll { $0 == sessionId }
        } else {
            favoriteSessionIds.append(sessionId)
        }
        defaults.set(isFavorite(sessionId: sessionId), forKey: keyPrefix + sessionId)
    }
    
    private func loadFavoriteSessionIds() -> [String] {
        return defaults.dictionaryRepresentation().keys
            .filter { $0.starts(with: keyPrefix) && defaults.bool(forKey: $0) }
            .map { $0.replacingOccurrences(of: keyPrefix, with: "") }
    }
}
