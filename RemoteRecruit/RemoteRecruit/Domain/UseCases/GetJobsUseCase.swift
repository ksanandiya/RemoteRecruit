//
//  GetJobsUseCase.swift
//  RemoteRecruit
//
//  Created by Kinjal Ughreja on 16/06/26.
//

/// Business logic layer.
///
/// Retrieves jobs from repository
/// and returns them to presentation layer.
/// 
import Foundation

protocol GetJobsUseCaseProtocol {
    func execute() async throws -> [Job]
}

final class GetJobsUseCase:
GetJobsUseCaseProtocol {

    private let repository:
        JobRepositoryProtocol

    init(
        repository: JobRepositoryProtocol
    ) {
        self.repository = repository
    }

    func execute() async throws -> [Job] {
        try await repository.fetchJobs()
    }
}
