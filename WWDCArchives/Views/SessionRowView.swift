//
//  SessionRowView.swift
//  WWDCArchives
//
//  Created by xx on 25/05/24.
//

import SwiftUI

struct SessionRowView: View {
    let session: Session
    let event: Event
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(session.title)
                .font(.headline)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(session.topic)
                    .font(.subheadline)

                HStack(spacing: 4) {
                    Text("Session \(session.eventContentID)")
                    
                    
                    if let duration = session.media.duration {
                        Text("• \(duration / 60)m")
                    }
                   
                }
                .font(.footnote)
                
                if let platforms = session.platforms {
                    Text(platforms.joined(separator: ", "))
                        .font(.subheadline)
                }
            }
            .foregroundStyle(.secondary)

        }
        .fontWeight(.semibold)

    }
}

#Preview {
    SessionRowView(session: RecordManager().allSessions[3000], event: RecordManager().events[3])
}
