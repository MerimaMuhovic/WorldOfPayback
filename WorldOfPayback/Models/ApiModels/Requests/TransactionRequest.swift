//
//  TransactionRequest.swift
//  WorldOfPayback
//
//  Created by Merima Muhovic on 1. 5. 2023..
//

import Foundation

struct Transaction: Hashable, Decodable {
    let items: [Items]
}

struct Items: Decodable, Hashable {
    let partnerDisplayName: String
    let alias: AliasAlias
    let category: Int
    let transactionDetail: TransactionDetailsDetails
}

struct AliasAlias: Decodable,Hashable {
    let reference: String
}

struct TransactionDetailsDetails: Decodable,Hashable {
    let description: String?
    let bookingDate: String
    let value: Values
}

struct Values: Decodable,Hashable {
    let amount: Int
    let currency: String
}
