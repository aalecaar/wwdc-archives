//
//  EventRowView.swift
//  WWDCArchives
//
//  Created by xx on 24/05/24.
//

import SwiftUI

struct EventRowView: View {
    let event: Event
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "apple.logo")
                    .font(.system(size: 50))
                
                Text(event.name)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
            }
        }

    }
}

#Preview {
    EventRowView(event: RecordManager().events.first!)
}
