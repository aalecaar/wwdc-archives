//
//  SessionsPerYearChartView.swift
//  WWDCArchives
//
//  Created by xx on 2/06/24.
//

import SwiftUI
import Charts

struct SessionsPerYearChartView: View {
    let record: RecordManager
    var body: some View {
        Chart {
            ForEach(Array(record.eventsForCharts.enumerated()), id: \.element) { index , event in
                LineMark(x: .value("Year", record.eventYears[index], unit: .year), y: .value("Sessions", record.sessions(for: event).count))
            }
        }
        .frame(height: 400)
    }
}

#Preview {
    SessionsPerYearChartView(record: RecordManager())
}
