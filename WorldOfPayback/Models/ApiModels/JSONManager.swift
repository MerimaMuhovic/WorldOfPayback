//
//  JSONManager.swift
//  WorldOfPayback
//
//  Created by Merima Muhovic on 27. 4. 2023..
//

import Foundation

struct Transactions: Hashable, Decodable {
    let items: [Item]
}

struct Item: Decodable, Hashable {
    let partnerDisplayName: String
    let alias: Alias
    let category: Int
    let transactionDetail: TransactionDetail
}

struct Alias: Decodable,Hashable {
    let reference: String
}

struct TransactionDetail: Decodable,Hashable {
    let description: String?
    let bookingDate: String
    let value: Value
}

struct Value: Decodable,Hashable {
    let amount: Int
    let currency: String
}

extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in app bundle.")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from app bundle.")
        }
        let decoder = JSONDecoder()
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from app bundle.")
        }
        return loaded
    }
}


