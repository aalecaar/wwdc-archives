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
}
