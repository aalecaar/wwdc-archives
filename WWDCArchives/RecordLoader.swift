//
//  RecordLoader.swift
//  WWDCArchives
//
//  Created by xx on 24/05/24.
//

import Foundation
import Observation

final class RecordLoader {
    let record: WWDCRecord
    
    init() {
        self.record = try! Self.decodeRecord()
    }
    
    private static func decodeRecord() throws -> WWDCRecord {
        guard let url = Bundle.main.url(forResource: "wwdc-record", withExtension: "json") else {
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

