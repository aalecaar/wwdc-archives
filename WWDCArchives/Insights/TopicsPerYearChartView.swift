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
        
            VStack {
                Chart(record.cumulativeTopicCounts, id: \.topic) { topic in
                    SectorMark(
                        angle: .value("Count", topic.count),
                        innerRadius: .ratio(0.65),
                        outerRadius: selectedTopic == topic.topic ? 175 : 150,
                        angularInset: 1.5
                    )
                    .foregroundStyle(by: .value("Topic Name", topic.topic))
                    .cornerRadius(4)
                    .opacity(selectedTopic == topic.topic ? 1 : 0.5)
                  
                }
                .chartAngleSelection(value: $selectedCount)
                .chartBackground { chartProxy in
                    GeometryReader { geometry in
                        let frame = geometry[chartProxy.plotFrame!]
                        VStack {
                            if let selectedTopic {
                                Text(selectedTopic)
                                    .font(.headline)
                                    

                                    Text("\(record.cumulativeTopicCounts.first { $0.topic == selectedTopic }?.count ?? 0)")
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.secondary)

                            }
                        }
                        .position(x: frame.midX, y: frame.midY)
                    }
                }
            }
            .frame(width: 364, height: 430)
            .chartLegend(position: .bottom, alignment: .center, spacing: 0)
            .onChange(of: selectedCount) { oldValue, newValue in
                if let newValue {
                    withAnimation(.linear(duration: 0.1)) {
                        getSelectedTopic(value: newValue)
                    }
                }
            }
            .onAppear {
                if let mostPopularTopic = record.cumulativeTopicCounts.first {
                    selectedTopic = mostPopularTopic.topic
                    selectedCount = mostPopularTopic.count
                }
            }
    }
    
    private func getSelectedTopic(value: Int) {
        var cumulativeTotal = 0
        if let topic = record.cumulativeTopicCounts.first(where: { topic in
            cumulativeTotal += topic.count
            return value <= cumulativeTotal
        }) {
            selectedTopic = topic.topic
        }
    }
}

#Preview {
    TopicsPerYearChartView(record: RecordManager())
}
