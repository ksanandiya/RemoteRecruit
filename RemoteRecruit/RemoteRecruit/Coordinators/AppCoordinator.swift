//
//  AppCoordinator.swift
//  RemoteRecruit
//
//  Created by Kinjal Ughreja on 16/06/26.
//

///Handles naviation throughtout the application
///
///Responsibilities:
///- Push Job Detail Screen
///- Pop Screens
///- Reset navigation stack

import SwiftUI
import Combine
final class AppCoordinator:ObservableObject {

    @Published var path =
        NavigationPath()

    func pop() {
        path.removeLast()
    }

    func popToRoot() {
        path = NavigationPath()
    }
    func showJobDetail(
            _ job: Job
    ) {
        path.append(job)
    }
}
