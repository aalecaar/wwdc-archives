//
//  WWDCRecord.swift
//  WWDCArchives
//
//  Created by xx on 24/05/24.
//

import Foundation

struct WWDCRecord: Codable {
    let updated: Date
    let source: URL
    let schema: Int
    let sessions: [Session]
    let events: [Event]
}

struct Session: Codable, Identifiable, Equatable, Hashable {
    let id: String
    let title: String
    let description: String?
    let eventID: String
    let eventContentID: String
    let year: Int
    let topic: String
    let speakers: [String]?
    let media: Media
    let platforms: [String]?
    let appleWeblink: URL?
    var formattedEventID: String {
        if eventID != "tech-talks" {
            return eventID.replacing("20", with: "", maxReplacements: 1).uppercased()
        } else {
            return eventID.replacing("-", with: " ").capitalized
        }
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case eventID = "eventId"
        case eventContentID = "eventContentId"
        case year
        case topic
        case speakers
        case media
        case platforms
        case appleWeblink
    }
}

struct Media: Codable, Equatable, Hashable {
    let duration: Int?
    let noVideoAvailable: Bool?
    let downloadSD: URL?
    let downloadSDSize: Int?
    let downloadSDState: String?
    let downloadHD: URL?
    let downloadHDSize: Int?
    let downloadHDState: String?
    let streamHLS: URL?
    let streamHLSState: String?
    let slides: URL?
    let slidesSize: Int?
    let slidesState: String?
    
    private enum CodingKeys: String, CodingKey {
        case duration
        case noVideoAvailable
        case downloadSD
        case downloadSDSize = "downloadSD_size"
        case downloadSDState = "downloadSD_state"
        case downloadHD
        case downloadHDSize = "downloadHD_size"
        case downloadHDState = "downloadHD_state"
        case streamHLS
        case streamHLSState = "streamHLS_state"
        case slides
        case slidesSize = "slides_size"
        case slidesState = "slides_state"
    }
}

struct Event: Codable, Identifiable, Hashable {
    let id: String
    let name: String
    let description: String
    var customDescriptions: [String] { return [
        "Apple's WWDC 2000 was held in San Jose, California, and focused on Mac OS X Developer Preview 4 and WebObjects.",
        "Apple's WWDC 2001, held in San Jose, California, introduced Mac OS X Server and WebObjects 5.",
        "Apple's WWDC 2002, held in San Jose, California, featured Mac OS X 10.2, QuickTime 6, Rendezvous (Bonjour), and the farewell to Mac OS 9.",
        "Apple's WWDC 2003 was held at the Moscone Center in San Francisco, where the Power Mac G5, Mac OS X Panther preview, Safari 1.0, and iApps were introduced.",
        "Apple's WWDC 2004, held at the Moscone Center, showcased 23\" & 30\" widescreen displays, Mac OS X Tiger preview, and iTunes 4.9 with podcast support.",
        "At Apple's WWDC 2005, held at the Moscone Center, the company announced the transition of Macs to Intel processors. ",
        "Apple's WWDC 2006, held at the Moscone Center West, saw the introduction of the Mac Pro, Mac OS X Leopard, and a major Mac OS X Server revision.",
        "Apple's WWDC 2007, held at the Moscone Center West, featured the Mac OS X Leopard beta, Safari for Windows, and the opening of iPhone development to third-party web applications.",
        "Apple's WWDC 2008, held at the Moscone Center West, was the launchpad for the App Store, iPhone SDK, iPhone 3G, Mac OS X Snow Leopard, and MobileMe.",
        "Apple's WWDC 2009, held at the Moscone Center West, showcased iPhone OS 3.0, Mac OS X Snow Leopard, new MacBook Pros, and the iPhone 3GS.",
        "Apple's WWDC 2010, held at the Moscone Center West, introduced the iPhone 4, the renaming of iPhone OS to iOS, FaceTime, and iMovie for iPhone.",
        "Apple's WWDC 2011, held at the Moscone Center West, unveiled Mac OS X Lion, iOS 5, and iCloud.",
        "Apple's WWDC 2012, held at the Moscone Center West, focused on Apple Maps, new MacBook Air and Pro models, OS X Mountain Lion, and iOS 6.",
        "Apple's WWDC 2013, held at the Moscone Center West, featured redesigned Mac Pro, AirPort Time Capsule, AirPort Extreme, MacBook Air, OS X Mavericks, iOS 7, iWork for iCloud, and iTunes Radio.",
        "Apple's WWDC 2014, held at the Moscone Center West, introduced iOS 8, OS X Yosemite, and the Swift programming language.",
        "Apple's WWDC 2015, held at the Moscone Center West, revealed iOS 9, OS X El Capitan, an Apple Watch software update, and Apple Music.",
        "Apple's WWDC 2016 was held at the Bill Graham Civic Auditorium and Moscone Center West, and it launched macOS Sierra (renaming OS X), iOS 10, watchOS 3, tvOS 10, Messages, Maps, and Siri extensions, the Home App, Swift Playgrounds, and APFS.",
        "Apple's WWDC 2017 was held at the San Jose Convention Center, where iOS 11, watchOS 4, macOS High Sierra, tvOS 11, iMac, MacBook, MacBook Pro updates, iMac Pro, 10.5-inch iPad Pro, and HomePod were introduced.",
        "Apple's WWDC 2018, held at the San Jose Convention Center, showcased iOS 12, macOS Mojave, watchOS 5, and tvOS 12.",
        "Apple's WWDC 2019, held at the San Jose Convention Center, unveiled SwiftUI, iOS 13, macOS Catalina, watchOS 6, tvOS 13, iPadOS 13, the 3rd generation Mac Pro, and the Pro Display XDR.",
        "Apple's WWDC 2020 was an online event that introduced iOS 14, iPadOS 14, watchOS 7, tvOS 14, macOS Big Sur, and Apple's transition to custom ARM processors for Macs.",
        "Apple's WWDC 2021 was an online event that showcased iOS 15, iPadOS 15, watchOS 8, tvOS 15, and macOS Monterey.",
        "Apple's WWDC 2022 was held online and in-person, and it introduced iOS 16, iPadOS 16, watchOS 9, tvOS 16, macOS Ventura, the M2 chip, and updated MacBook Air and 13-inch MacBook Pro models.",
        "Apple's WWDC 2023 was held online and in-person at Apple Park. The company introduced the Vision Pro AR/VR headset, macOS 14 Sonoma, iOS 17, new Mac models with M2 Ultra, and held the Swift Student Challenge."
    ]
    }
}
