//
//  ResourceLinkView.swift
//  WWDCArchives
//
//  Created by xx on 25/05/24.
//

import SwiftUI

struct ResourceLinkView: View {
    let url: URL
    let systemImageName: String
    let description: String
    @Environment(\.openURL) private var openURL
    var body: some View {
        Button {
                openURL(url)
        } label: {
            HStack(spacing: 18) {
                Image(systemName: systemImageName)
                    .font(.headline)
                
                VStack(alignment: .leading) {
                    Text(description)
                    
                    Divider()
                }
            }
        }
    }
}

#Preview {
    ResourceLinkView(url: RecordManager().allSessions[3390].appleWeblink!, systemImageName: "link", description: "Description here")
}
