//
//  WWDCArchivesView.swift
//  WWDCArchives
//
//  Created by xx on 24/05/24.
//

import SwiftUI

struct WWDCArchivesView: View {
    @State private var record = RecordManager()
    
    var body: some View {
        NavigationStack {
            List(record.events) { event in
                NavigationLink {
                    Text("s")
                        .navigationTitle(event.name)
                } label: {
                    EventRowView(event: event)
                }
                .listRowSeparator(.hidden, edges: .top)
                .listRowSeparator(.visible, edges: .bottom)
                 // Repeating this modifier in this way allowed me to delete the separator below the navigation title. The first modifier hides the separator that appears on top of a row. The second one makes visible the separator again, but this time it was set to appear at the bottom of the row. Yep, weird as fuck, it should never have applied a separator to the navigation title.
                

            }
            .listStyle(.plain)
            .navigationTitle("Events")
          

        }
        

    }
}


#Preview {
    WWDCArchivesView()
        .preferredColorScheme(.light)
}
