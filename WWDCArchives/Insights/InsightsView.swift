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
        SessionsPerYearChartView(record: record)
    }
}
// Hay 25 elementos en record.events, pero hay solo 24 en record.eventYears
#Preview {
    InsightsView()
}
