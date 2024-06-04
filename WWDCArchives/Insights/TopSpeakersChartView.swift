//
//  TopSpeakersChartView.swift
//  WWDCArchives
//
//  Created by xx on 4/06/24.
//

import SwiftUI
import Charts

struct TopSpeakersChartView: View {
    let record: RecordManager

    var body: some View {
            Chart(record.topSpeakersByFrequency, id: \.speaker) { speaker in
                BarMark(
                    x: .value("Count", speaker.count),
                    y: .value("Speaker", speaker.speaker)
                )
                .foregroundStyle(by: .value("Speaker", speaker.speaker))
            }
            .frame(height: 300)
            .chartLegend(position: .bottom, alignment: .center, spacing: 0)
    }
}

#Preview {
    TopSpeakersChartView(record: RecordManager())
}
