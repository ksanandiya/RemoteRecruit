//
//  AppEnvironment.swift
//  RemoteRecruit
//
//  Created by Kinjal Ughreja on 16/06/26.
//

/// Application environment configuration.
///
/// Provides:
/// - Production API URL
/// - Staging API URL (if available)
/// - QA API URL (if available)
/// - Environment specific values
///
import Foundation

enum AppEnvironment {

    static var current: EnvironmentProtocol {
        #if DEBUG
        return StagingEnvironment()
        #else
        return ProductionEnvironment()
        #endif
    }
}
