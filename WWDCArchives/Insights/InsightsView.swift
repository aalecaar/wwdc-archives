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
            ScrollView {
                VStack(spacing: 40) {
                    SessionsPerYearChartView(record: record)
                    
                    Divider()
                    
                    TopicsPerYearChartView(record: record)
                }
                .padding()

            }
            .navigationTitle("Insights")
        }
        
       
    }
}
// Hay 25 elementos en record.events, pero hay solo 24 en record.eventYears
#Preview {
    InsightsView()
}
