//
//  TransactionsList.swift
//  WorldOfPayback
//
//  Created by Merima Muhovic on 29. 4. 2023..
//

import SwiftUI

struct TransactionsList: View {
    @State private var selectedTransaction: Item?
    private let filterOptions = ["All", "Category 1", "Category 2", "Category 3"]
    @ObservedObject private var viewModel = TransactionListModel()
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Total: \(viewModel.filteredItemsSum, specifier: "%.2f")")
                    .font(.headline)
                    .foregroundColor(.black)
            }
            .padding(.horizontal)
            .padding(.top, 20)
            .navigationTitle(Content.transaction)
            
            HStack {
                ForEach(filterOptions, id: \.self) { option in
                    Button(action: {
                        viewModel.selectedFilterOption = option
                    }, label: {
                        Text(option)
                            .fontWeight( viewModel.selectedFilterOption == option ? .bold : .regular )
                    })
                    .buttonStyle(
                        FilterButtonStyle(selected: viewModel.selectedFilterOption == option)
                    )
                }
            }
            .padding(.horizontal)
            .padding(.top, 3)
            
            List(viewModel.filteredItems, id: \.alias.reference) { item in
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
                            if let date = viewModel.parseDate(from: item.transactionDetail.bookingDate) {
                                Text(viewModel.dateToString(date: date))
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
                viewModel.loadTransactions()
            }
        }
    }
    
    struct TransactionsList_Previews: PreviewProvider {
        static var previews: some View {
            TransactionsList()
        }
    }
}
