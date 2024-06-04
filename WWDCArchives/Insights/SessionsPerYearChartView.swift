import SwiftUI
import Charts

struct SessionsPerYearChartView: View {
    let record: RecordManager
    @State private var selectedYear: Date?
    @State private var selectedCount: Int?
    @State private var showOverlay: Bool = false
    
    var body: some View {
        VStack {
            Chart {
                ForEach(Array(record.eventsForCharts.enumerated()), id: \.element) { index, event in
                    LineMark(
                        x: .value("Year", record.eventYears[index], unit: .year),
                        y: .value("Sessions", record.sessions(for: event).count)
                    )
                }
            }
            .frame(width: 330, height: 330)
            .chartOverlay { proxy in
                GeometryReader { geometry in
                    ZStack {
                        if showOverlay, let selectedYear, let selectedCount {
                            let xPosition = proxy.position(forX: selectedYear) ?? 0
                            let yPosition = proxy.position(forY: selectedCount) ?? 0
                            
                            VStack {
                                Text(" \(Calendar.current.component(.year, from: selectedYear).formatted(.number.grouping(.never)))")
                                Text("\(selectedCount)")
                                    .font(.caption)
                                    .fontWeight(.semibold)
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
                                            
                                            let index = Int(round(relativeX * Double(record.eventsForCharts.count - 1)))
                                            let closestYear = record.eventYears[index]
                                            selectedYear = closestYear
                                            selectedCount = record.sessions(for: record.eventsForCharts[index]).count
                                            showOverlay = true
                                        }
                                    }
                                    .onEnded { _ in showOverlay = false }
                            )
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    SessionsPerYearChartView(record: RecordManager())
}
