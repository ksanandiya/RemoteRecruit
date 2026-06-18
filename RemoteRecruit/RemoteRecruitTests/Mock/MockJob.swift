//
//  MockJob.swift
//  RemoteRecruitTests
//
//  Created by Kinjal Ughreja on 17/06/26.
//

import Foundation
@testable import RemoteRecruit

// MARK: - Fixtures

extension Job {
    static let mock = Job(
        id: 1,
        title: "iOS Engineer",
        companyName: "Genesis Infoweb",
        category: "Software Development",
        description: "Job Description",
        location: "Remote",
        salary: "$100k"
    )
}
