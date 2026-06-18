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
    
    func testInit() async {
        let useCase = MockGetJobsUseCase()

        useCase.jobs = [.mock]

        let sut = JobListViewModel(getJobsUseCase: useCase)

        await sut.fetchJobs()
        
        let vm =
        JobDetailViewModel(
            job: sut.jobs.first ?? .mock
        )
        
        XCTAssertEqual(vm.job.id,1)
        
        XCTAssertEqual(vm.job.title,"iOS Engineer")
        
        XCTAssertEqual(vm.job.companyName,"Genesis Infoweb")
        
        XCTAssertEqual(vm.job.category,"Software Development")

    }
}
