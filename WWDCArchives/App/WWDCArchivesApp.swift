//
//  WWDCArchivesApp.swift
//  WWDCArchives
//
//  Created by xx on 24/05/24.
//

import SwiftUI

@main
struct WWDCArchivesApp: App {
    @State private var record = RecordManager()
    var body: some Scene {
        WindowGroup {
            WWDCArchivesView()
                .environment(record)
        }
    }
}
