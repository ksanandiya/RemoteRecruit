//
//  JobDetailViewModelTests.swift
//  RemoteRecruit
//
//  Created by Kinjal Ughreja on 17/06/26.
//


@testable import RemoteRecruit
import XCTest

@MainActor
final class JobDetailViewModelTests:
    XCTestCase {
    
    func getJobDetalViewModel() async -> JobDetailViewModel {
        let useCase = MockGetJobsUseCase()

        useCase.jobs = [.mock]

        let sut = JobListViewModel(getJobsUseCase: useCase)

        await sut.fetchJobs()
        
       return
        JobDetailViewModel(
            job: sut.jobs.first ?? .mock
        )
    }
    func testCompanyName() async {

        let vm = await getJobDetalViewModel()

        XCTAssertEqual(
            vm.job.companyName,
            "Genesis Infoweb"
        )
    }
    func testCategory() async {

        let vm = await getJobDetalViewModel()

        XCTAssertEqual(
            vm.job.category,
            "Software Development"
        )
    }
    func testSalary() async {

        let vm = await getJobDetalViewModel()

        XCTAssertEqual(
            vm.job.salary,
            "$100k"
        )
    }
    
}

