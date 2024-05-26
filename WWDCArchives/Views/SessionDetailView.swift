//
//  SessionDetailView.swift
//  WWDCArchives
//
//  Created by xx on 25/05/24.
//

import SwiftUI

struct SessionDetailView: View {
    let session: Session
    let event: Event
    @State private var resourceLinksPresented = 0
    
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
                
                Group {
                    if let appleDeveloperURL = session.appleWeblink {
                        ResourceLinkView(url: appleDeveloperURL, systemImageName: "link", description: "See on Apple Developer")
                            .onAppear(perform: {
                                resourceLinksPresented += 1
                            })
                    }
                    
                    if let hdDownloadURL = session.media.downloadHD {
                        ResourceLinkView(url: hdDownloadURL, systemImageName: "arrow.down.circle", description: "Download HD")
                            .onAppear(perform: {
                                resourceLinksPresented += 1
                            })
                        
                    }
                    
                    if let sdDownloadURL = session.media.downloadSD {
                        ResourceLinkView(url: sdDownloadURL, systemImageName: "arrow.down.circle", description: "Download SD")
                            .onAppear(perform: {
                                resourceLinksPresented += 1
                            })
                        
                    }
                    
                    if let slidesURL = session.media.slides {
                        ResourceLinkView(url: slidesURL, systemImageName: "link", description: "Download Slides")
                            .onAppear(perform: {
                                resourceLinksPresented += 1
                            })
                        
                    }
                    
                    if resourceLinksPresented == 0 {
                        ContentUnavailableView("No content available", systemImage: "wrench.and.screwdriver")
                    }
                }
                .padding(.vertical, 6)
                
            }
            .padding()
            
        }
        
    }
}



#Preview {
    SessionDetailView(session: RecordManager().allSessions[3421], event: RecordManager().events[2])
}
