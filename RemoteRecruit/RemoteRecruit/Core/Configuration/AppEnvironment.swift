//
//  AppEnvironment.swift
//  RemoteRecruit
//
//  Created by Kinjal Ughreja on 16/06/26.
//

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
