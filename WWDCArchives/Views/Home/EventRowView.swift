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
    var body: some View {
        VStack {
            HStack(spacing: 4) {
                Image(systemName: "apple.logo")
                    .offset(y: 4)
                
                Text(event.id.replacing("20", with: "", maxReplacements: 1).uppercased())
                    .offset(y: 8)
               
                
                
            }
            .font(.system(size: 40, weight: .bold))
            .foregroundStyle(colorScheme == .dark ? .black : .white)
            .padding()
            
            
            Text(event.description)
                .foregroundStyle(colorScheme == .dark ? Color(.systemGray2) : .secondary )
                .padding()
                .background(colorScheme == .dark ? .gray.opacity(0.5): Color(.systemGray4))
                .multilineTextAlignment(.leading)
            
            
        }
        .background(colorScheme == .dark ? .white : .black)
        .clipShape(.rect(cornerRadius: 10))
        
        
        
    }
}

#Preview {
    EventRowView(event: RecordManager().events.first!)
}
