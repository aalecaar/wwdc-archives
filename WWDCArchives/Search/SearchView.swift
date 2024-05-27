//
//  SearchView.swift
//  WWDCArchives
//
//  Created by xx on 26/05/24.
//

import SwiftUI

struct SearchView: View {
    @State private var record = RecordManager()
    @State private var searchText = ""
    var body: some View {
            ScrollView {
                LazyVStack {
                    List(record.allSessions) { session in
                        SessionRowView(session: session)
                            .border(.red)
                    }
                }
            
        }
    }
}

#Preview {
    SearchView()
}
