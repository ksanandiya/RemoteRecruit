//
//  JobListViewModelTests.swift
//  RemoteRecruit
//
//  Created by Kinjal Ughreja on 17/06/26.
//


@testable import RemoteRecruit
import XCTest

@MainActor
final class JobListViewModelTests:XCTestCase {

    func testFetchJobsSuccess() async {

        let useCase = MockGetJobsUseCase()

        useCase.jobs = [.mock]

        let sut = JobListViewModel(getJobsUseCase: useCase)

        await sut.fetchJobs()

        XCTAssertEqual(
            sut.jobs.count,
            1
        )

        XCTAssertFalse(
            sut.isLoading
        )
    }

    func testFetchJobsFailure() async {

        let useCase = MockGetJobsUseCase()

        useCase.error = NetworkError.noInternet

        let sut = JobListViewModel(
            getJobsUseCase: useCase)

        await sut.fetchJobs()

        XCTAssertNotNil(
            sut.errorMessage
        )
    }

    func testSearchFiltering() async {
        let useCase = MockGetJobsUseCase()

        useCase.jobs = [.mock]

        let sut = JobListViewModel(getJobsUseCase: useCase)

        await sut.fetchJobs()

        sut.searchText = "iOS"

        XCTAssertEqual(
            sut.filteredJobs.count,
            1)
    }
    func testEmptySearchReturnsAllJobs() async {

        let useCase = MockGetJobsUseCase()
        useCase.jobs = [.mock]

        let sut = JobListViewModel(getJobsUseCase: useCase)

        await sut.fetchJobs()

        sut.searchText = ""

        XCTAssertEqual(
            sut.filteredJobs.count,
            sut.jobs.count
        )
    }
    func testSearchByCompany() async {

        let useCase = MockGetJobsUseCase()
        useCase.jobs = [.mock]

        let sut = JobListViewModel(getJobsUseCase: useCase)

        await sut.fetchJobs()

        sut.searchText = "Genesis"

        XCTAssertEqual(
            sut.filteredJobs.count,
            1
        )
    }
    func testSearchReturnsNoResult() async {

        let useCase = MockGetJobsUseCase()
        useCase.jobs = [.mock]

        let sut = JobListViewModel(getJobsUseCase: useCase)

        await sut.fetchJobs()

        sut.searchText = "Android"

        XCTAssertTrue(
            sut.filteredJobs.isEmpty
        )
    }
}
