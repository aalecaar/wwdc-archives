//
//  WWDCArchivesApp.swift
//  WWDCArchives
//
//  Created by xx on 24/05/24.
//

import SwiftUI

@main
struct WWDCArchivesApp: App {
    @State private var favoritesManager = FavoritesManager.shared

    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(favoritesManager)
        }
    }
}
