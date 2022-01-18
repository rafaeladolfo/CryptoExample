//
//  CryptoStock.swift
//  Gilfoyle
//
//  Created by Rafael Adolfo  on 15/07/21.
//

import Foundation

// MARK: - CryptoStock
struct CryptoStock: Codable {
    let id: Int
    let updateDate: UpdateDate
    let name, symbol, iconUrl: String
    let quoteCurrency: QuoteCurrency
    let price, percentageOneHour, percentageOneDay, percentageSevenDays: Float
}

enum QuoteCurrency: String, Codable {
    case brl = "BRL"
}

enum UpdateDate: String, Codable {
    case the00010101T000000 = "0001-01-01T00:00:00"
}

typealias CryptoStocks = [CryptoStock]
