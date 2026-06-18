//
//  MockJobRepository.swift
//  RemoteRecruit
//
//  Created by Kinjal Ughreja on 17/06/26.
//

@testable import RemoteRecruit
import XCTest
// MARK: - Mock Repository

final class MockJobRepository: JobRepositoryProtocol {

    var jobs: [Job] = []
    var error: Error?

    func fetchJobs() async throws -> [Job] {

        if let error {
            throw error
        }

        return jobs
    }
}
