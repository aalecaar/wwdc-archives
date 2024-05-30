//
//  FavoritesManager.swift
//  WWDCArchives
//
//  Created by xx on 30/05/24.
//

import Foundation

class FavoritesManager {
    static let shared = FavoritesManager()
    private let defaults = UserDefaults.standard
    private let keyPrefix = "favorite_"
    
    private init() {}
    
    func isFavorite(sessionId: String) -> Bool {
        return defaults.bool(forKey: keyPrefix + sessionId)
    }
    
    func toggleFavorite(sessionId: String) {
        let currentState = isFavorite(sessionId: sessionId)
        defaults.set(!currentState, forKey: keyPrefix + sessionId)
    }
    
    func favoriteSessionIds() -> [String] {
        return defaults.dictionaryRepresentation().keys
            .filter { $0.starts(with: keyPrefix) && defaults.bool(forKey: $0) }
            .map { $0.replacingOccurrences(of: keyPrefix, with: "") }
    }
}
