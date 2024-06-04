//
//  ExpandableCardView.swift
//  WWDCArchives
//
//  Created by xx on 4/06/24.
//

import SwiftUI

struct ExpandableCardView: View {
    var faqItem: FAQItem
    @State private var isExpanded = false

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Button {
                withAnimation(.bouncy) {
                    isExpanded.toggle()
                }
            } label: {
                HStack {
                    Text(faqItem.question)
                        .font(.headline)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                    
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color(.systemGray6))
                .clipShape(.buttonBorder)
            }
            
            if isExpanded {
                Text(.init(faqItem.answer))
                        .font(.body)
                        .foregroundColor(.secondary)
                        .padding(.horizontal)
                        .transition(.opacity)
            }
        }
        .padding(.horizontal)
        .animation(.easeInOut(duration: 0.1), value: isExpanded)
    }
}

#Preview {
    ExpandableCardView(faqItem: FAQItem(question: "Test question test question test question", answer: "kshdksliasjhldfjlskjdflksjlkdf"))
}
