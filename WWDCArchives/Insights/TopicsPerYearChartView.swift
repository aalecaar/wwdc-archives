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
        NavigationStack {
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
                  
                }
                .chartAngleSelection(value: $selectedCount)
                .chartBackground { chartProxy in
                    GeometryReader { geometry in
                        let frame = geometry[chartProxy.plotFrame!]
                        VStack {
                            if let selectedTopic {
                                Text(selectedTopic)
                                    .font(.callout)

                                    Text("\(record.cumulativeTopicCounts.first { $0.topic == selectedTopic }?.count ?? 0)")

                            }
                        }
                        .position(x: frame.midX, y: frame.midY)
                    }
                }
                .frame(height: 350)
                Spacer()
            }
            .onChange(of: selectedCount) { oldValue, newValue in
                if let newValue {
                    withAnimation(.linear(duration: 0.1)) {
                        getSelectedTopic(value: newValue)
                    }
                }
            }
            .padding()
            .navigationTitle("Topics Per Year")
            .onAppear {
                if let mostPopularTopic = record.cumulativeTopicCounts.first {
                    selectedTopic = mostPopularTopic.topic
                    selectedCount = mostPopularTopic.count
                }
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
