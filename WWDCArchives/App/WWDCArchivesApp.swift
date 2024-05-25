//
//  WWDCArchivesApp.swift
//  WWDCArchives
//
//  Created by xx on 24/05/24.
//

import SwiftUI

@main
struct WWDCArchivesApp: App {
    var body: some Scene {
        WindowGroup {
            WWDCArchivesView()
                .onAppear {
                    print(RecordManager().allSessions.count)
                }
        }
    }
}
