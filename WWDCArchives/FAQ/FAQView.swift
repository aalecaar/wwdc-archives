//
//  FAQView.swift
//  WWDCArchives
//
//  Created by xx on 4/06/24.
//

import SwiftUI

struct FAQView: View {
    let faqItems: [FAQItem] = [
        FAQItem(question: "What is the purpose of this app?", answer: "This app aims to provide, in an unofficial way, information and insights on WWDC events since 2000."),
        FAQItem(question: "Do you have any affiliation with Apple?", answer: "This app is not affiliated with, endorsed by, or associated with Apple Inc. For the most accurate and up-to-date information, please refer to the official Apple Developer site."),
        FAQItem(question: "Who collected the information provided in this app?", answer: "The information provided in this app was collected by [WWDC Index](https://nonstrict.eu/wwdcindex/). Their efforts in compiling this valuable resource are greatly appreciated. This app would not be possible without the resource in JSON format publicly provided by them."),
        FAQItem(question: "Why should I use this app instead of going directly to the Apple Developer site?", answer: "The value of this app resides in the insights it provides and the information from early events that is no longer available or easily accessible from official sources. However, I encourage you to visit the official sources to find the most accurate information, specially for the most recent events." ), FAQItem(question: "How accurate is the information presented here?", answer: "Please have in mind that this is not an official source. Most of the information is provided by other people that in turn might have compiled it from official or other sources. For that reason, you cannot expect the information presented here to be always comprehensive or complete.")
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(faqItems) { item in
                        ExpandableCardView(faqItem: item)
                    }
                    Text("Disclaimer: This app is not affiliated with, endorsed by, or associated with Apple Inc. All information is sourced from publicly available resources on the Apple Developer site and on the Internet. For the most accurate and up-to-date information, please refer to the official Apple Developer site. The materials referenced in this app are the property of Apple Inc. and are used here for informational purposes only.")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .padding()
                }
                .padding(.vertical)
            }
            .navigationTitle("FAQ")
        }
    }
}

// Preview
#Preview {
    FAQView()
}
