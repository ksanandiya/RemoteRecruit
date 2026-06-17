//
//  Environment.swift
//  RemoteRecruit
//
//  Created by Kinjal Ughreja on 16/06/26.
//

/// Defines environment configuration protocol.
///
/// Used for:
/// - Base URL
/// - API settings
/// - Environment switching

import Foundation

protocol EnvironmentProtocol {
    var baseURL: String { get }
}

struct ProductionEnvironment:EnvironmentProtocol {

    let baseURL = "https://remotive.com"
}

// Here we have set both staging and production URL same as we don't have staging url but in production app we have staging and QA environment so we can define according to that.
struct StagingEnvironment:EnvironmentProtocol {

    let baseURL = "https://remotive.com"
}
