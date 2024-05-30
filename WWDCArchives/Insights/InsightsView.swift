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
        Chart {
            
        }
        .aspectRatio(contentMode: .fit)
    }
}

#Preview {
    InsightsView()
}
