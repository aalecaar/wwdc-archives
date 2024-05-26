//
//  AppTabView.swift
//  WWDCArchives
//
//  Created by xx on 26/05/24.
//

import SwiftUI

struct AppTabView: View {
    var body: some View {
        TabView {
            EventsView()
                .tabItem { Label("Explore", systemImage: "rectangle.and.text.magnifyingglass.rtl") }
            
            
            Text("Charts")
                .tabItem { Label("Charts", systemImage: "chart.bar") }
            
            Text("Search")
                .tabItem { Label("Search", systemImage: "magnifyingglass") }
            
            
            Text("FAQ")
                .tabItem { Label("FAQ", systemImage: "questionmark.bubble") }
        }
    }
}

#Preview {
    AppTabView()
}
