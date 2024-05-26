//
//  SessionDetailView.swift
//  WWDCArchives
//
//  Created by xx on 25/05/24.
//

import SwiftUI

struct SessionDetailView: View {
    @Environment(\.openURL) private var openURL
    let session: Session
    let event: Event
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                
                Text(session.title)
                    .font(.title)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(session.topic)
                        .font(.subheadline)

                    HStack(spacing: 4) {
                        Text(event.id.replacingOccurrences(of: "20", with: "").uppercased())
                        Text("• Session \(session.eventContentID)")
                        
                        if let duration = session.media.duration {
                            Text("• \(duration / 60)m")
                        }
                    }
                    .font(.footnote)
                }
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)

                
                Text(session.description ?? "No available description")
                
              Text("Resources")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.top, 20)
                
                if let appleDeveloperURL = session.appleWeblink {
                    Button {
                        openURL(appleDeveloperURL)
                    } label: {
                        HStack(spacing: 18) {
                            Image(systemName: "link")
                                .font(.headline)
                            
                            VStack(alignment: .leading) {
                                Text("See on Apple Developer")
                                
                                Divider()
                            }
                        }
                    }
                    
                }
                
            }
            .padding()
            
        }
    }
}

#Preview {
    SessionDetailView(session: RecordManager().allSessions[3421], event: RecordManager().events[2])
}
