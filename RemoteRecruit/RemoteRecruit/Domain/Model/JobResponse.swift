//
//  JobResponse.swift
//  RemoteRecruit
//
//  Created by Kinjal Ughreja on 17/06/26.
//

/// API response models.
///
/// Contains:
/// - JobResponse
/// - Job model
import Foundation

struct JobResponse: Codable {
    let jobs: [Job]
}

struct Job: Codable, Identifiable,Hashable,Equatable {
    let id: Int
    let title: String
    let companyName: String
    let category: String
    let description:String
    let location:String
    let salary:String

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case category
        case companyName = "company_name"
        case description
        case location = "candidate_required_location"
        case salary
    }
}
