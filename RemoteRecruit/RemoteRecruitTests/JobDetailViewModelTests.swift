//
//  JobDetailViewModelTests.swift
//  RemoteRecruit
//
//  Created by Kinjal Ughreja on 17/06/26.
//


@testable import RemoteRecruit
import XCTest

final class JobDetailViewModelTests:
XCTestCase {

    func testInit() {

        let vm =
        JobDetailViewModel(
            job: .mock
        )

        XCTAssertEqual(
            vm.job.id,
            1
        )

        XCTAssertEqual(
            vm.job.title,
            "iOS Engineer"
        )
    }
}