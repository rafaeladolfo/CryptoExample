//
//  NetworkManager.swift
//  Guru
//
//  Created by Rafael Adolfo  on 30/04/21.
//

import Foundation
import NetworkPackage

class NetworkManager {
    // MARK: - Singleton
    static let shared = NetworkManager()

    // MARK: - Network service providers
    let guruProvider = NetworkService<GuruEndPoint>()

    // MARK: - Public methods
    func fetchCryptoStocks(completion: @escaping ClosureType<CryptoStocks>, failure: @escaping Failure) {
        guruProvider.request(.fetchCryptoStocks, model: CryptoStocks.self, completion: completion, failure: failure)
    }
}
