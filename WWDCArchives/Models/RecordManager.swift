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
    
    let customDescriptions: [String] =  [
        "WWDC 2000 showcased Mac OS X with Developer Preview 4 and improved tools. WebObjects price dropped. Held at San Jose Convention Center.",
        "WWDC 2001 saw the first release of Mac OS X Server and WebObjects 5. Attendees received leather jackets. Held at San Jose Convention Center.",
        "WWDC 2002 introduced Mac OS X 10.2, QuickTime 6, and Rendezvous. Apple held a mock funeral for Mac OS 9. Held at San Jose Convention Center.",
        "WWDC 2003 featured Power Mac G5, preview of Mac OS X Panther, and launch of Safari 1.0. Attendees got iSight cameras. Held at Moscone Center, San Francisco.",
        "WWDC 2004 previewed Mac OS X Tiger (10.4) and introduced new displays. iTunes 4.9 with podcast support was demoed. Held at Moscone Center, San Francisco.",
        "WWDC 2005 announced Apple's transition to Intel processors. Mathematica was ported to Mac OS X on Intel. Held at Moscone Center, San Francisco.",
        "WWDC 2006 introduced the Mac Pro, replacing Power Mac G5, and previewed Mac OS X Leopard. Over 4,200 developers attended. Held at Moscone Center.",
        "WWDC 2007 presented Mac OS X Leopard beta, Safari for Windows, and third-party web apps for iPhone. Held at Moscone Center, San Francisco.",
        "WWDC 2008 introduced App Store, iPhone SDK, iPhone 3G, iPhone OS 2.0, and Mac OS X Snow Leopard. Held at Moscone Center, San Francisco.",
        "WWDC 2009 featured iPhone OS 3.0, Mac OS X Snow Leopard, new MacBook Pro models, and iPhone 3GS. Held at Moscone Center, San Francisco.",
        "WWDC 2010 announced iPhone 4, the renaming of iPhone OS to iOS, and FaceTime. The event sold out in 8 days. Held at Moscone Center, San Francisco.",
        "WWDC 2011, held June 6-10, introduced Mac OS X Lion, iOS 5, and iCloud. Attended by 5,000 developers. This was the final Apple event hosted by Jobs.",
        "WWDC 2012 launched Apple Maps, new MacBook Air and Pro models, OS X Mountain Lion, and iOS 6. Held at Moscone Center, San Francisco.",
        "WWDC 2013 showcased redesigned Mac Pro and MacBook Air. OS X Mavericks and iOS 7 were introduced. Held at Moscone Center.",
        "WWDC 2014 introduced iOS 8, OS X Yosemite, and the Swift language. Attendees were chosen randomly for the first time. Held at Moscone Center, San Francisco.",
        "WWDC 2015 featured iOS 9, OS X El Capitan, Apple Music, and open-sourcing of Swift supporting iOS, OS X, and Linux. Held at Moscone Center, San Francisco.",
        "WWDC 2016 introduced macOS Sierra, iOS 10, watchOS 3, and tvOS 10. Cisco and Apple announced a partnership. Held at Bill Graham Civic Auditorium.",
        "WWDC 2017 announced iOS 11, watchOS 4, macOS High Sierra, and tvOS 11. New hardware included iMac Pro. Held at San Jose Convention Center.",
        "WWDC 2018 introduced iOS 12, macOS Mojave, watchOS 5, and tvOS 12. No new hardware announcements. Held at San Jose Convention Center.",
        "WWDC 2019 featured iOS 13, macOS Catalina, watchOS 6, tvOS 13, iPadOS 13, new Mac Pro and Pro Display XDR. Held at San Jose Convention Center.",
        "WWDC 2020 was held online due to COVID-19, introducing iOS 14, iPadOS 14, watchOS 7, tvOS 14, macOS Big Sur, and ARM processors for Macs.",
        "WWDC 2021 was an online event introducing iOS 15, iPadOS 15, watchOS 8, tvOS 15, and macOS Monterey. No new hardware was announced.",
        "WWDC 2022 introduced iOS 16, iPadOS 16, watchOS 9, tvOS 16, macOS Ventura, M2 chip, and new MacBook Air and Pro. Held online and in-person.",
        "WWDC 2023 introduced macOS Sonoma, iOS 17, iPadOS 17, watchOS 10, tvOS 17, M2 Ultra chip, 15-inch MacBook Air, and Apple Vision Pro. Held online and in-person.",
        "Various Tech Talks"
    ]



}
