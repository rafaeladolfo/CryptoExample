//
//  NetworkMonitor.swift
//  NetworkPackage
//
//  Created by Rafael Adolfo  on 01/05/21.
//

import Foundation
import Network

public protocol NetworkMonitoring {
    func startMonitoring()
    func stopMonitoring()
}

public final class NetworkMonitor {

    // MARK: - Singleton
    public static let shared = NetworkMonitor()

    // MARK: - Properties
    public var monitor: NWPathMonitor?
    public var isMonitoring = false
    public var didStartMonitoringHandler: (() -> Void)?
    public var didStopMonitoringHandler: (() -> Void)?
    public var netStatusChangeHandler: (() -> Void)?

    public var isConnected: Bool {
        guard let monitor = monitor else { return false }
        return monitor.currentPath.status == .satisfied
    }

    var interfaceType: NWInterface.InterfaceType? {
        guard let monitor = monitor else { return nil }

        return monitor.currentPath.availableInterfaces.filter {
            monitor.currentPath.usesInterfaceType($0.type) }.first?.type
    }

    var availableInterfacesTypes: [NWInterface.InterfaceType]? {
        guard let monitor = monitor else { return nil }
        return monitor.currentPath.availableInterfaces.map { $0.type }
    }

    var isExpensive: Bool {
        return monitor?.currentPath.isExpensive ?? false
    }

    private init() {
    }

    deinit {
        stopMonitoring()
    }
}

extension NetworkMonitor: NetworkMonitoring {

    //MARK: Public methods
    public func startMonitoring() {
        guard !isMonitoring else { return }

        monitor = NWPathMonitor()
        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor?.start(queue: queue)

        monitor?.pathUpdateHandler = { _ in
            self.netStatusChangeHandler?()
        }

        isMonitoring = true
        didStartMonitoringHandler?()
    }

    public func stopMonitoring() {
        guard isMonitoring, let monitor = monitor else { return }
        monitor.cancel()
        self.monitor = nil
        isMonitoring = false
        didStopMonitoringHandler?()
    }
}
