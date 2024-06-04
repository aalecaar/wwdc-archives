//
//  InsightsView.swift
//  WWDCArchives
//
//  Created by xx on 29/05/24.
//

import SwiftUI
import Charts

struct InsightsView: View {
    @State private var record = RecordManager()
    var body: some View {
        NavigationStack {
            List {
                Section("Number of sessions over time") {
                    SessionsPerYearChartView(record: record)

                }
                
                Section("Top 7 Popular Topics") {
                    TopicsPerYearChartView(record: record)
                }
           
                Section("Top 7 Popular Speakers") {
                    TopSpeakersChartView(record: record)
                }

            }
            .navigationTitle("Insights")
        }
    }
}

#Preview {
    InsightsView()
}
