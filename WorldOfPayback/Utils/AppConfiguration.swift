//
//  AppConfiguration.swift
//  WorldOfPayback
//
//  Created by Merima Muhovic on 1. 5. 2023..
//

import Foundation

class AppConfiguration {
    private static var instance: AppConfiguration?
    private var cache: [String: Any]?

    public static func sharedInstance() -> AppConfiguration {
        if AppConfiguration.instance == nil {
            AppConfiguration.instance = AppConfiguration()
        }
        return AppConfiguration.instance!
    }

    private init() {
        cache = Bundle.main.infoDictionary?["AppConfiguration"] as? [String: Any]
    }

    var serverUrl: String {
        return get("\(#function)")!
    }

    var apiClient: String {
        return get("\(#function)")!
    }

    var apiSecret: String {
        return get("\(#function)")!
    }

    var appCenterId: String {
        return get("\(#function)")!
    }

    public func get<T>(_ key: String) -> T? {
        return cache?[key] as? T
    }

    public func getString(_ key: String) -> String? {
        return cache?[key] as? String
    }
}
