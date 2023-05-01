//
//  ApiClient.swift
//  WorldOfPayback
//
//  Created by Merima Muhovic on 1. 5. 2023..
//

import Foundation
import Alamofire

class ApiClient {
    static let sessionManager: Session = {
        var defaultHeaders = HTTPHeaders.default
        defaultHeaders.add(HTTPHeader.contentType("application/json"))
        defaultHeaders.add(HTTPHeader.accept("application/json"))

        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = defaultHeaders.dictionary
        configuration.timeoutIntervalForRequest = 15
        let session = Session(configuration: configuration)
        return session
    }()

    func buildUrl(_ path: String) -> URL {
        var url = URL(string: AppConfiguration.sharedInstance().serverUrl)!
        url.appendPathComponent(path)
        return url
    }

    func makeRequest<ResponseModel: Decodable>(
        using httpMethod: HTTPMethod,
        body: Encodable?,
        path: String,
        encoder: ParameterEncoder = JSONParameterEncoder.default,
        headers: HTTPHeaders = [:],
        decoder: DataDecoder = JSONDecoder(),
        requestModifier: Session.RequestModifier? = nil,
        callback: @escaping (ResponseModel?, ApiError?) -> Void) {

        let url = buildUrl(path)

        ApiClient.sessionManager.request(
            url,
            method: httpMethod,
            parameters: body == nil ? nil : AnyEncodable(value: body!),
            encoder: encoder,
            headers: headers,
            requestModifier: requestModifier)
            .validate(statusCode: 200..<300)
        .responseDecodable(
            decoder: decoder,
            completionHandler: { (response: DataResponse<ResponseModel, AFError>) in
                switch response.result {
                case .success(let responseBody):
                    callback(responseBody, nil)
                case .failure:
                    callback(nil, ApiError.fromDataResponse(response: response))
                }
        })
    }
}
