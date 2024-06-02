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
    @State private var selectedCount: Int?
    @State private var selectedTopic: String?
    
    var body: some View {
            Chart(record.sortedTopicsByFrequency, id: \.topic) { topic in
                SectorMark(angle: .value("Count", topic.count), angularInset: 1.5)
                    .foregroundStyle(by: .value("Topic Name", topic.topic))
                    .cornerRadius(4)
                    .annotation(position: .overlay) {
                        Text("\(topic.count)")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                    }
                    
                   
            }
            .chartAngleSelection(value: $selectedCount)
            .scaledToFit()
            .chartLegend(position: .trailing, alignment: .center, spacing: 20)
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
