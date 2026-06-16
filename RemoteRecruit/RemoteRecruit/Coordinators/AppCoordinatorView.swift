//
//  AppCoordinatorView.swift
//  RemoteRecruit
//
//  Created by Kinjal Ughreja on 16/06/26.
//

import SwiftUI

struct AppCoordinatorView: View {

    @StateObject private var coordinator =
        AppCoordinator()

    private let container =
        DependencyContainer()

    var body: some View {

        NavigationStack(
            path: $coordinator.path
        ) {

            JobListView(viewModel:
                                container
                                .makeJobListViewModel()
                        )
        }
        .environmentObject(
            coordinator
        )
    }
}
