//
//  RecordLoader.swift
//  WWDCArchives
//
//  Created by xx on 24/05/24.
//

import Foundation

struct RecordLoader {
    let record: WWDCRecord
    
    init() {
        self.record = try! Self.decodeRecord() // TODO: Find a better way to decode and initialize this. Ignoring the possible errors it can throws makes futile the effort of making it a throwing function in the first place. Besides that, if an error is thrown, the app will crash at runtime
    }
    
    private static func decodeRecord() throws -> WWDCRecord {
        guard let url = Bundle.main.url(forResource: "WWDCRecord", withExtension: "json") else {
            throw DecodingError.invalidURL
        }
        
        guard let data = try? Data(contentsOf: url) else {
            throw DecodingError.invalidData
        }
        
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        
        guard let decodedData = try? jsonDecoder.decode(WWDCRecord.self, from: data) else {
            throw DecodingError.unableToDecode
        }
     
        return decodedData
    }
    
    
    private enum DecodingError: Error {
        case invalidURL
        case invalidData
        case unableToDecode
    }
}

