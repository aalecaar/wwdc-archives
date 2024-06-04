//
//  AverageSessionDurationPerYearChartView.swift
//  WWDCArchives
//
//  Created by xx on 4/06/24.
//
import SwiftUI
import Charts

struct AverageSessionDurationPerYearChartView: View {
    let record: RecordManager
    
    var body: some View {
        VStack {
            Chart {
                ForEach(Array(record.eventYears.enumerated()), id: \.element) { index, year in
                    LineMark(
                        x: .value("Year", year, unit: .year),
                        y: .value("Average Duration", averageDuration(for: year))
                    )
                }
            }
            .frame(width: 330, height: 330)
        }
        .padding()
    }
    
    private func averageDuration(for year: Date) -> Double {
        let yearInt = Calendar.current.component(.year, from: year)
        let sessions = record.allSessions.filter { $0.year == yearInt }
        let totalDuration = sessions.reduce(0) { $0 + ($1.media.duration ?? 0) }
        return sessions.isEmpty ? 0 : Double(totalDuration) / Double(sessions.count) / 60.0
    }
}

#Preview {
    AverageSessionDurationPerYearChartView(record: RecordManager())
}
