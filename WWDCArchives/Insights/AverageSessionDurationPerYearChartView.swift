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
    @State private var selectedYear: Date?
    @State private var selectedAverage: Double?
    @State private var showOverlay: Bool = false
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Chart {
                ForEach(Array(record.eventYears.enumerated()), id: \.element) { index, year in
                    LineMark(
                        x: .value("Year", year, unit: .year),
                        y: .value("Average Duration", averageDuration(for: year))
                    )
                }
            }
            .frame(width: 330, height: 330)
            .frame(width: 330, height: 330)
            .chartOverlay { proxy in
                GeometryReader { geometry in
                    ZStack {
                        if showOverlay, let selectedYear, let selectedAverage {
                            let xPosition = proxy.position(forX: selectedYear) ?? 0
                            let yPosition = proxy.position(forY: selectedAverage) ?? 0
                            
                            VStack {
                                Text("\(Calendar.current.component(.year, from: selectedYear).formatted(.number.grouping(.never)))")
                                Text("\(selectedAverage.formatted(.number.precision(.fractionLength(0)))) min")
                                    .font(.caption)
                            }
                            .foregroundStyle(.secondary)
                            .fontWeight(.semibold)
                            .position(x: xPosition, y: yPosition - 20)
                        }
                        
                        Rectangle().foregroundColor(.clear)
                            .contentShape(Rectangle())
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        if let plotAreaFrame = proxy.plotFrame {
                                            let frame = geometry[plotAreaFrame]
                                            
                                            let xStart = frame.minX
                                            let xEnd = frame.maxX
                                            let xLocation = value.location.x
                                            let relativeX = max(0, min(1, (xLocation - xStart) / (xEnd - xStart)))
                                            
                                            let index = Int(round(relativeX * Double(record.eventYears.count - 1)))
                                            let closestYear = record.eventYears[index]
                                            selectedYear = closestYear
                                            selectedAverage = averageDuration(for: closestYear)
                                            showOverlay = true
                                        }
                                    }
                                    .onEnded { _ in showOverlay = false }
                            )
                    }
                }
            }
            Text("Note: The sudden drop for 2007 is due to the lack of information about the duration of most of that year sessions. We can assume the real average is similar to the previous years.")
                .font(.footnote)
                .foregroundStyle(.secondary)

        }
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
