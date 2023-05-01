//
//  TransactionDetails.swift
//  WorldOfPayback
//
//  Created by Merima Muhovic on 29. 4. 2023..
//

import SwiftUI
import Foundation

struct TransactionDetails: View {
    let partnerDisplayName: String
    let description: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(partnerDisplayName)
                .font(.title)
            Text(description)
                .font(.subheadline)
        }
        .padding()
        .navigationTitle("Transaction Details")
    }
}

struct TransactionDetails_Previews: PreviewProvider {
    static var previews: some View {
        TransactionDetails(partnerDisplayName: "", description: "")
    }
}
