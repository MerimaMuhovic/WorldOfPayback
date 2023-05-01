//
//  TransactionsRepositorie.swift
//  WorldOfPayback
//
//  Created by Merima Muhovic on 1. 5. 2023..
//

import Foundation

typealias TransactionCallback = (_ error: ApiError?) -> Void

protocol TransactionRepositoryProtocol {
    
}

class TransactionRepository: TransactionRepositoryProtocol {
    private let apiClient: TransactionApiClient

    init(apiClient: TransactionApiClient = TransactionApiClient()) {
        self.apiClient = apiClient
    }

    func getTransaction(callback: @escaping TransactionCallback) {

    }
}
