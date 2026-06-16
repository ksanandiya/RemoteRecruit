//
//  Environment.swift
//  RemoteRecruit
//
//  Created by Kinjal Ughreja on 16/06/26.
//

import Foundation

protocol EnvironmentProtocol {
    var baseURL: String { get }
}

struct ProductionEnvironment:
EnvironmentProtocol {

    let baseURL =
        "https://remotive.com"
}


struct StagingEnvironment:
EnvironmentProtocol {

    let baseURL =
        "https://remotive.com"
}
