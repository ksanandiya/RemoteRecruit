//
//  AppCoordinator.swift
//  RemoteRecruit
//
//  Created by Kinjal Ughreja on 16/06/26.
//

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
}
