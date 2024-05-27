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
            
            Text("Insights")
                .tabItem { Label("Insights", systemImage: "chart.bar") }
            
            Text("FAQ")
                .tabItem { Label("FAQ", systemImage: "questionmark.bubble") }
        }
    }
}

#Preview {
    AppTabView()
}
