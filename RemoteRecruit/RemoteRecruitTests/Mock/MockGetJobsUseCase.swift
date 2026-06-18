//
//  MockGetJobsUseCase.swift
//  RemoteRecruit
//
//  Created by Kinjal Ughreja on 17/06/26.
//

@testable import RemoteRecruit
import XCTest
// MARK: - Mock UseCase

final class MockGetJobsUseCase:GetJobsUseCaseProtocol {

    var jobs: [Job] = []
    var error: Error?

    func execute() async throws -> [Job] {

        if let error {
            throw error
        }

        return jobs
    }
}
