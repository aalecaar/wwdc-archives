//
//  WWDCArchivesView.swift
//  WWDCArchives
//
//  Created by xx on 24/05/24.
//

import SwiftUI

struct WWDCArchivesView: View {
    let wwdcRecord = RecordLoader()
    var body: some View {
        ScrollView {
            ForEach(wwdcRecord.record.events, id: \.name) { event in
                VStack {
                    
                        Text(event.name)
                    
                }
            }
        }
        .padding()
    }
}

#Preview {
    WWDCArchivesView()
}
