//
//  EventRowView.swift
//  WWDCArchives
//
//  Created by xx on 24/05/24.
//

import SwiftUI

struct EventRowView: View {
    @Environment(\.colorScheme) var colorScheme
    let event: Event
    let customDescription: String
    var formattedEventID: String {
        if event.id != "tech-talks" {
            return event.id.replacing("20", with: "", maxReplacements: 1).uppercased()
        } else {
            return event.id.replacing("-", with: " ").capitalized
        }
    }
    
    var body: some View {
            VStack(spacing: 0) {
                Text(formattedEventID)
                    .font(.system(size: 40, weight: .bold))
                    .foregroundStyle(colorScheme == .dark ? .black : .white)
                    .padding(.vertical, 24)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(colorScheme == .dark ? .white : .black)
                
                
                
                Text(customDescription)
                    .padding()
                    .lineLimit(5, reservesSpace: true)
                    .foregroundStyle(colorScheme == .dark ? Color(.systemGray2) : .secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(colorScheme == .dark ? .white.opacity(0.8) : .gray.opacity(0.2) )
            }
        .clipShape(.rect(cornerRadius: 10))
    }
}

#Preview {
    EventRowView(event: RecordManager().events.first!, customDescription: RecordManager().customDescriptions[0])
}
