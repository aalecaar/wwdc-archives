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
    @Binding var path: NavigationPath
    @State private var resourceLinksPresented = 0
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                
                Text(session.title)
                    .font(.title)
                    .fontWeight(.semibold)
                
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(session.topic)
                        
                        HStack(spacing: 4) {
                            if event.id != "tech-talks" {
                                Text(event.id.replacing("20", with: "", maxReplacements: 1).uppercased())
                            } else {
                                Text(event.id.replacing("-", with: " ").capitalized)
                            }
                            
                            
                            Text("• Session \(session.eventContentID)")
                            
                            if let duration = session.media.duration {
                                Text("• \(duration / 60)m")
                            }
                        }
                        .font(.footnote)
                    }
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
                    
                    Spacer()
                    
                    FavoriteButton(sessionId: session.id)
                   
                }
                
                
                Text(session.description ?? "No available description")
                    .padding(.vertical, 4)
                
                if let speakers = session.speakers {
                    let listFormatter = ListFormatter()
                    if let joinedSpeakers = listFormatter.string(from: speakers) {
                        Text(joinedSpeakers)
                            .foregroundStyle(.secondary)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                }
                
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
                        ContentUnavailableView("Sorry, no resources available for this session☹️", systemImage: "wrench.and.screwdriver")
                    }
                }
                .padding(.vertical, 8)
                
            }
            .padding(.horizontal)
            .toolbar {
                Button {
                    path = NavigationPath()
                } label: {
                    Text("Home")
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline) // Without this, the scroll view will have a lot of ugly space on top. I think this is because navigationBarTitleDisplayMode is .large by default.
    }
}



#Preview {
    NavigationStack {
        @State var isFavorite = false
        @State var path = NavigationPath()
        SessionDetailView(session: RecordManager().allSessions[0], event: RecordManager().events[0], path: $path)
    }
}
