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
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    SessionRowView(session: RecordManager().allSessions[3000])
}
