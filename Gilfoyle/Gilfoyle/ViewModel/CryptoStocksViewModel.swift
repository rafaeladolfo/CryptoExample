//
//  CryptoStocksViewModel.swift
//  Guru
//
//  Created by Rafael Adolfo  on 03/05/21.
//

import SwiftUI
import Foundation
import NetworkPackage

final class CryptoStocksViewModel: BaseViewModel {
    // MARK: - Properties
    @Published var model: CryptoStocks = CryptoStocks()
    @Published var currentImageIndex: Int = 0
    @Published var timer = Timer.TimerPublisher(interval: 15, runLoop: .main, mode: .common).autoconnect()

    // MARK: - Public methods
    override func load() {
        fetchCryptoStocks()
    }

    func fetchCryptoStocks() {
        state = .loading
        NetworkManager.shared.fetchCryptoStocks { [weak self] response in
            if response.count == 0 { return }
            self?.model = response
            self?.state = .loaded
        } failure: { err in
            self.state = .failed(err)
        }
    }
}
