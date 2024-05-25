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
    private let wwdcRecord = RecordLoader()
    
    var updateDate: Date {
        wwdcRecord.record.updated
    }
    
    var sessions: [Session] {
        wwdcRecord.record.sessions
    }
    
    var events: [Event] {
        wwdcRecord.record.events
    }
}
