//
//  TransactionsList.swift
//  WorldOfPayback
//
//  Created by Merima Muhovic on 29. 4. 2023..
//

import SwiftUI


struct TransactionsList: View {
    @State private var transactions: Transactions?
    @State private var selectedTransaction: Item?
    private let filterOptions = ["All", "Category 1", "Category 2", "Category 3"]
    @State private var selectedFilterOption = "All"

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

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Total: \(filteredItemsSum, specifier: "%.2f")")
                    .font(.headline)
                    .foregroundColor(.black)
            }
            .padding(.horizontal)
            .padding(.top, 20)
            .navigationTitle(Content.transaction)

            HStack {
                ForEach(filterOptions, id: \.self) { option in
                    Button(action: {
                        selectedFilterOption = option
                    }, label: {
                        Text(option)
                            .fontWeight(selectedFilterOption == option ? .bold : .regular )
                    })
                    .buttonStyle(FilterButtonStyle(selected: selectedFilterOption == option))
                }
            }
            .padding(.horizontal)
            .padding(.top, 3)

            List(filteredItems, id: \.alias.reference) { item in
                NavigationLink(destination: TransactionDetails(partnerDisplayName: item.partnerDisplayName, description: item.transactionDetail.description ?? "")) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.partnerDisplayName)
                                .font(.headline)
                            Text(item.transactionDetail.description ?? "")
                                .font(.subheadline)
                                .padding(0.7)
                        }
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text("\(item.transactionDetail.value.amount) \(item.transactionDetail.value.currency)")
                            if let date = parseDate(from: item.transactionDetail.bookingDate) {
                                Text(dateToString(date: date))
                                    .font(.caption)
                            }
                        }
                    }
                    .onTapGesture {
                        selectedTransaction = item
                    }
                }
            }
            .onAppear {
                // Load the transactions data from the "PBTransactions.json" file
                transactions = Bundle.main.decode(Transactions.self, from: "PBTransactions.json")
            }
        }
    }

    struct FilterButtonStyle: ButtonStyle {
        let selected: Bool

        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding(.vertical, 10)
                .padding(.horizontal, 15)
                .foregroundColor(selected ? .white : .blue)
                .background(selected ? Color.blue : Color.white)
                .cornerRadius(20)
                .font(.caption)
        }
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

    struct TransactionsList_Previews: PreviewProvider {
        static var previews: some View {
            TransactionsList()
        }
    }
}
