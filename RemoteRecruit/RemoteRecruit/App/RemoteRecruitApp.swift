//
//  RemoteRecruitApp.swift
//  RemoteRecruit
//
//  Created by Kinjal Ughreja on 16/06/26.
//

///Application entry point
///Loads AppCoordinatorView as the root screen

import SwiftUI

@main
struct RemoteRecruitApp: App {
    var body: some Scene {
        WindowGroup {
            AppCoordinatorView()
        }
    }
}
