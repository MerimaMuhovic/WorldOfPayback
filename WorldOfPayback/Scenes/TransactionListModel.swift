//
//  TransactionListModel.swift
//  WorldOfPayback
//
//  Created by Merima Muhovic on 2. 5. 2023..
//

import SwiftUI

class TransactionListModel: ObservableObject {
    
    @Published var transactions: Transactions?
    @Published  var selectedFilterOption = "All"
    @State private var isLoading = false

    var filteredItems: [Item] {
        switch selectedFilterOption {
        case "All":
            return transactions?.items.sorted(by: { $0.transactionDetail.bookingDate > $1.transactionDetail.bookingDate }) ?? []
        case "Category 1":
            return transactions?.items.filter { $0.category == 1 }.sorted(by: { $0.transactionDetail.bookingDate > $1.transactionDetail.bookingDate }) ?? []
        case "Category 2":
            return transactions?.items.filter { $0.category == 2 }.sorted(by: { $0.transactionDetail.bookingDate > $1.transactionDetail.bookingDate }) ?? []
        case "Category 3":
            return transactions?.items.filter { $0.category == 3 }.sorted(by: { $0.transactionDetail.bookingDate > $1.transactionDetail.bookingDate }) ?? []
        default:
            return transactions?.items.sorted(by: { $0.transactionDetail.bookingDate > $1.transactionDetail.bookingDate }) ?? []
        }
    }
    
    var filteredItemsSum: Double {
        Double(filteredItems.reduce(0) { $0 + $1.transactionDetail.value.amount })
    }
    
    func loadTransactions() {
        transactions = Bundle.main.decode(Transactions.self, from: "PBTransactions.json")

    }
    
    func parseDate(from dateString: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return dateFormatter.date(from: dateString)
    }
    
    func dateToString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy hh:mm a"
        return dateFormatter.string(from: date)
    }
}

