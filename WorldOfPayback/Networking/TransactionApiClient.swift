//
//  TransactionApiClient.swift
//  WorldOfPayback
//
//  Created by Merima Muhovic on 1. 5. 2023..
//

import Foundation
import Alamofire

class TransactionApiClient: ApiClient {

    func getTransaction(identifier: String, callback: @escaping (_ transaction: Transaction?,
                                                                 _ error: ApiError?) -> Void) {
        makeRequest(using: .post,
                    body: nil,
                    path: identifier,
                    callback: callback)
    }

}
