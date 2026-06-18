//
//  GetJobsUseCaseTests.swift
//  RemoteRecruit
//
//  Created by Kinjal Ughreja on 17/06/26.
//


@testable import RemoteRecruit
import XCTest

final class GetJobsUseCaseTests: XCTestCase {

    func testExecuteSuccess() async throws {

        let repo =
        MockJobRepository()

        repo.jobs = [.mock]

        let sut =
        GetJobsUseCase(
            repository: repo
        )

        let jobs =
        try await sut.execute()

        XCTAssertEqual(
            jobs.count,
            1
        )
    }

    func testExecuteError() async {

        let repo =
        MockJobRepository()

        repo.error =
        NetworkError.noInternet

        let sut =
        GetJobsUseCase(
            repository: repo
        )

        do {
            _ = try await sut.execute()
            XCTFail()
        } catch {
            XCTAssertEqual(
                error as? NetworkError,
                .noInternet
            )
        }
    }
}