//
//  DependencyContainer.swift
//  RemoteRecruit
//
//  Created by Kinjal Ughreja on 16/06/26.
//

// DependencyContainer creates and injects all
// dependencies following Dependency Injection.

import Foundation

final class DependencyContainer {
    private let environment: EnvironmentProtocol
    
    init(
        environment: EnvironmentProtocol = AppEnvironment.current
    ) {
        self.environment = environment
    }
    lazy var connectivityMonitor:ConnectivityMonitorProtocol =
    ConnectivityMonitor()
    
    lazy var networkClient:NetworkClientProtocol =
    NetworkClient(
        environment: environment,
        connectivityMonitor:
            connectivityMonitor
    )
    
    lazy var jobRepository:
    JobRepositoryProtocol =
    JobRepository(
        networkClient: networkClient
    )
    
    lazy var getJobsUseCase:
    GetJobsUseCaseProtocol =
    GetJobsUseCase(
        repository: jobRepository
    )
    
    func makeJobListViewModel()
    -> JobListViewModel {
        
        JobListViewModel(
            getJobsUseCase:
                getJobsUseCase
        )
    }

}
