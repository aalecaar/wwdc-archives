//
//  RootView.swift
//  WWDCArchives
//
//  Created by xx on 24/05/24.
//

import SwiftUI

struct RootView: View {
    @State private var record = RecordManager()
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Label("Home", systemImage: "house.fill") }
              
            
            InsightsView()
                .tabItem { Label("Insights", systemImage: "chart.bar") }
            
            FavoritesView(allSessions: record.allSessions, event: record.events[0])
                .tabItem { Label("Favorites", systemImage: "star.fill") }
            
            FAQView()
                .tabItem { Label("FAQ", systemImage: "questionmark.bubble") }
        }
    }
}


#Preview {
    RootView()
}
