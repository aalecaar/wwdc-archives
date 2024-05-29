//
//  FavoriteSessionsView.swift
//  WWDCArchives
//
//  Created by xx on 28/05/24.
//

import SwiftUI

struct FavoriteSessionsView: View {
    @State private var record = RecordManager()
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<10) { index in
                    Text("\(index)")
                }
            }
            .listStyle(.plain)
        }
    }
}

#Preview {
    FavoriteSessionsView()
}
