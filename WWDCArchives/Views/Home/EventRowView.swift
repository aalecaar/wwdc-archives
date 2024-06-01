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
    var body: some View {
        VStack {
            Text(event.id.replacing("20", with: "", maxReplacements: 1).uppercased())
                .font(.system(size: 40, weight: .bold))
                .foregroundStyle(colorScheme == .dark ? .black : .white)
                .padding(.top, 24)
          
                Text(customDescription)
                .lineLimit(4, reservesSpace: true)
                    .foregroundStyle(colorScheme == .dark ? Color(.systemGray2) : .secondary )
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(colorScheme == .dark ? .gray.opacity(0.5): Color(.systemGray4))
                    
                    
            
            
        }
        .background(colorScheme == .dark ? .white : .black)
        .clipShape(.rect(cornerRadius: 10))
        .padding()
        
        
        
    }
}

#Preview {
    EventRowView(event: RecordManager().events.first!, customDescription: RecordManager().customDescriptions[0])
}
