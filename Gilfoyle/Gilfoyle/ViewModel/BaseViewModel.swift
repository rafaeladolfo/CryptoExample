//
//  BaseViewModel.swift
//  Guru
//
//  Created by Rafael Adolfo  on 02/05/21.
//

import Foundation
import NetworkPackage

protocol BaseViewModelProtocol {
    func load()
}

class BaseViewModel: ObservableObject, BaseViewModelProtocol {
    // MARK: - Properties
    enum State {
        case idle
        case loading
        case failed(String)
        case loaded
    }

    @Published var state: State = State.idle  {
        didSet {
            switch state {
            case .idle:
                print("Idle state")
            case .loading:
                print("Loading state")
            case .failed(_):
                print("Failed state")
                monitorStatusChange()
            case .loaded:
                print("Loaded state")
            }
        }
    }

    // MARK: - Public methods
    func load() {

    }

    // MARK: - Private methods
    private func monitorStatusChange() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in

            if NetworkMonitor.shared.isConnected {
                self.load()
                timer.invalidate()
            }
        }
    }
}
