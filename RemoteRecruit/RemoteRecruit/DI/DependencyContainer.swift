//
//  DependencyContainer.swift
//  RemoteRecruit
//
//  Created by Kinjal Ughreja on 16/06/26.
//

import Foundation

final class DependencyContainer {
    private let environment: EnvironmentProtocol
    
    init(
        environment: EnvironmentProtocol = AppEnvironment.current
    ) {
        self.environment = environment
    }
    lazy var connectivityMonitor:
    ConnectivityMonitorProtocol =
    ConnectivityMonitor()
    
    lazy var networkClient:
    NetworkClientProtocol =
    NetworkClient(
        environment: environment,
        connectivityMonitor:
            connectivityMonitor
    )
}
