//
//  FAQItem.swift
//  WWDCArchives
//
//  Created by xx on 4/06/24.
//

import Foundation

struct FAQItem: Identifiable {
    var id = UUID()
    var question: String
    var answer: String
}
