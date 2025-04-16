//
//  Rate.swift
//  CurrencyExchangeSample
//
//  Created by Ivan2 on 16.04.2025.
//

import Foundation

struct Rate: Codable {
    let usd: Int
}

private enum CodingKeys: String, CodingKey {
    case usd = "USD"
}
