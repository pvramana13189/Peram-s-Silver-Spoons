//
//  IncomeSummaryView.swift
//  Peram's Silver Spoons
//
//  Created by OSU APP CENTER on 3/15/24.
//

import SwiftUI

struct IncomeSummaryView: View {
    var summary: String

    @State private var editedSummary: String

    init(summary: String) {
        self.summary = summary
        self._editedSummary = State(initialValue: summary)
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("Additional Information")
                .font(.title)
                .padding()
            
            TextEditor(text: $editedSummary)
                .padding()
                .border(Color.gray, width: 1)
                .frame(minHeight: 200)
        }
        .padding()
        .frame(height: 300)
        .background(Color.gray.opacity(0.23))
    }
}

struct IncomeSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        IncomeSummaryView(summary: "Sample summary text")
    }
}
