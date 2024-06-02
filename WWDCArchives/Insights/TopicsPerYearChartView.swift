//
//  TopicsPerYearChartView.swift
//  WWDCArchives
//
//  Created by xx on 2/06/24.
//

import SwiftUI
import Charts

struct TopicsPerYearChartView: View {
    let record: RecordManager
    @State private var selectedCount: Int? = nil
    var body: some View {
        
            Chart(record.sortedTopicsByFrequency, id: \.topic) { topic in
                
                SectorMark(angle: .value("Count", topic.count), angularInset: 1.5)
                    .foregroundStyle(by: .value("Topic Name", topic.topic))
                    .cornerRadius(8)
                    .annotation(position: .overlay) {
                        Text("\(topic.count)")
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                    }
                
            }
            .scaledToFit()
            .chartLegend(alignment: .center, spacing: 20)
            .chartXSelection(value: $selectedCount)
            .onChange(of: selectedCount) { oldValue, newValue in
                if let newValue {
                    print(newValue)
                }
            }
        
    }
}

#Preview {
    TopicsPerYearChartView(record: RecordManager())
}
