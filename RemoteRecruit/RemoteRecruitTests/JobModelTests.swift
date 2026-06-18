//
//  JobModelTests.swift
//  RemoteRecruit
//
//  Created by Kinjal Ughreja on 17/06/26.
//


@testable import RemoteRecruit
import XCTest

final class JobModelTests: XCTestCase {

    func testJobDecoding() throws {

        let json = """
        {
            "id": 1,
            "title": "iOS Engineer",
            "company_name": "Acme",
            "category": "Software",
            "description": "Desc",
            "candidate_required_location": "Worldwide",
            "salary": "$100k"
        }
        """

        let job = try JSONDecoder().decode(
            Job.self,
            from: Data(json.utf8)
        )

        XCTAssertEqual(job.id, 1)
        XCTAssertEqual(job.companyName, "Acme")
        XCTAssertEqual(job.location, "Worldwide")
    }

    func testHashable() {
        let set = Set([Job.mock])
        XCTAssertEqual(set.count, 1)
    }

    func testIdentifiable() {
        XCTAssertEqual(Job.mock.id, 1)
    }

    func testResponseDecode() throws {

        let json = """
        {
            "jobs":[
                {
                    "id":1,
                    "title":"iOS Engineer",
                    "company_name":"Acme",
                    "category":"Software",
                    "description":"Desc",
                    "candidate_required_location":"Worldwide",
                    "salary":"$100k"
                }
            ]
        }
        """

        let response =
        try JSONDecoder().decode(
            JobResponse.self,
            from: Data(json.utf8)
        )

        XCTAssertEqual(response.jobs.count, 1)
    }
}