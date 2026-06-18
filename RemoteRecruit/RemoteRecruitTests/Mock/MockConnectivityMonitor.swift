//
//  MockConnectivityMonitor.swift
//  RemoteRecruit
//
//  Created by Kinjal Ughreja on 17/06/26.
//


// MARK: - Mock Connectivity
@testable import RemoteRecruit
import Foundation

final class MockConnectivityMonitor: ConnectivityMonitorProtocol {
    var isConnected: Bool

    init(isConnected: Bool = true) {
        self.isConnected = isConnected
    }
}
