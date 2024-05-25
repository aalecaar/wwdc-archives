//
//  SessionRowView.swift
//  WWDCArchives
//
//  Created by xx on 25/05/24.
//

import SwiftUI

struct SessionRowView: View {
    let session: Session
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(session.title)
                .font(.headline)
                .foregroundStyle(.black)
            
            VStack(alignment: .leading) {
                Text(session.topic)
                    .font(.subheadline)
                
                HStack(spacing: 4) {
                    Text("\(session.year.formatted(.number.grouping(.never)))")
                    
                    Text("•")
                    
                    if let duration = session.media.duration {
                        Text("\(duration / 60)m")
                    }
                    
                }
                .font(.footnote)
                
            }
        }
        .foregroundStyle(.secondary)
        .fontWeight(.semibold)

    }
}

#Preview {
    SessionRowView(session: RecordManager().allSessions[3429])
}
