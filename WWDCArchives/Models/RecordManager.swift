//
//  RecordManager.swift
//  WWDCArchives
//
//  Created by xx on 24/05/24.
//

import Foundation
import Observation

@Observable
final class RecordManager {
    private let record = RecordLoader()
    
    var updateDate: Date {
        self.record.record.updated
    }
    
    var allSessions: [Session] {
        self.record.record.sessions
    }
    
    var events: [Event] {
        self.record.record.events
    }
    
    func sessions(for event: Event) -> [Session] {
        self.record.record.sessions.filter { session in
            session.eventID == event.id
        }
    }
}
