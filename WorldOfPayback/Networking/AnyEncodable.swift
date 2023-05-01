//
//  AnyEncodable.swift
//  WorldOfPayback
//
//  Created by Merima Muhovic on 1. 5. 2023..
//

import Foundation

struct AnyEncodable: Encodable {
    let value: Encodable

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try value.encode(to: &container)
    }
}

extension Encodable {
    func encode(to container: inout SingleValueEncodingContainer) throws {
        try container.encode(self)
    }
}
