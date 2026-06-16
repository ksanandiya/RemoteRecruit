//
//  JobResponse.swift
//  RemoteRecruit
//
//  Created by Kinjal Ughreja on 17/06/26.
//

import Foundation

struct JobResponse: Decodable {
    let jobs: [Job]
}

struct Job: Decodable, Identifiable {
    let id: Int
    let title: String
    let companyName: String
    let category: String

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case category
        case companyName = "company_name"
    }
}
