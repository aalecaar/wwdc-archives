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
        Chart {
            ForEach(Array(record.eventsForCharts.enumerated()), id: \.element) { index , event in
                BarMark(x: .value("Year", record.eventYears[index], unit: .year), y: .value("Sessions", record.sessions(for: event).count))
            }
        }
        .frame(height: 400)
    }
}
// Hay 25 elementos en record.events, pero hay solo 24 en record.eventYears
#Preview {
    InsightsView()
}
