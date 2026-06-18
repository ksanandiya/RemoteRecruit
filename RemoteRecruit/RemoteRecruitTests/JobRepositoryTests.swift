//
//  JobRepositoryTests.swift
//  RemoteRecruit
//
//  Created by Kinjal Ughreja on 17/06/26.
//


@testable import RemoteRecruit
import XCTest

@MainActor
final class JobRepositoryTests: XCTestCase {

    func testFetchJobsSuccess() async throws {

        let mockClient = MockNetworkClient()

        mockClient.jobsResponse =
        JobResponse(jobs: [.mock])

        let sut =
        JobRepository(
            networkClient: mockClient
        )

        let jobs =
        try await sut.fetchJobs()

        XCTAssertEqual(
            jobs.count,
            1
        )
    }

    func testFetchJobsError() async {

        let mockClient =
        MockNetworkClient()

        mockClient.error =
        NetworkError.noInternet

        let sut =
        JobRepository(
            networkClient: mockClient
        )

        do {
            _ = try await sut.fetchJobs()
            XCTFail()
        } catch {
            XCTAssertEqual(
                error as? NetworkError,
                .noInternet
            )
        }
    }
}
