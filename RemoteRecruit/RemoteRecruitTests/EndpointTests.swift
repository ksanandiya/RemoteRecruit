//
//  EndpointTests.swift
//  RemoteRecruit
//
//  Created by Kinjal Ughreja on 17/06/26.
//


@testable import RemoteRecruit
import XCTest

final class EndpointTests: XCTestCase {

    func testJobsEndpoint() {

        let endpoint = JobEndpoint.jobs

        XCTAssertEqual(
            endpoint.path,
            "/api/remote-jobs"
        )

        XCTAssertEqual(
            endpoint.method,
            .get
        )

        XCTAssertTrue(
            endpoint.queryItems?.isEmpty ?? true
        )
    }

    func testSearchEndpoint() {

        let endpoint =
        JobEndpoint.search("swift")

        XCTAssertEqual(
            endpoint.queryItems?.first?.name,
            "search"
        )

        XCTAssertEqual(
            endpoint.queryItems?.first?.value,
            "swift"
        )
    }
}