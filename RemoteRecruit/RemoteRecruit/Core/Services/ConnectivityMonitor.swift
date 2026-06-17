//
//  ConnectivityMonitor.swift
//  RemoteRecruit
//
//  Created by Kinjal Ughreja on 16/06/26.
//

/// Monitors internet connectivity using NWPathMonitor.
///
/// Used before executing API requests.
import Foundation
import Network

protocol ConnectivityMonitorProtocol {
    var isConnected: Bool { get }
}
final class ConnectivityMonitor: ConnectivityMonitorProtocol {

    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(
        label: "ConnectivityMonitor"
    )

    private(set) var isConnected: Bool = true

    init() {

        monitor.pathUpdateHandler = { [weak self] path in

            DispatchQueue.main.async {

                self?.isConnected =
                    path.status == .satisfied
            }
        }

        monitor.start(queue: queue)
    }

    deinit {
        monitor.cancel()
    }
}
