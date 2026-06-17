//
//  AppCoordinatorView.swift
//  RemoteRecruit
//
//  Created by Kinjal Ughreja on 16/06/26.
//

/// Root Navigation Container
///
/// Creates:
/// - AppCoordinator
/// - DependencyContainer
///
/// Injects dependecies and manage NavigationStack

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
            
            JobListView(
                viewModel:
                    container
                    .makeJobListViewModel()
            )
            .navigationDestination(
                for: Job.self
            ) { job in

                JobDetailView(
                    viewModel: container.makeJobDetailViewModel(job: job)
                )
            }
        }
        .environmentObject(
            coordinator
        )
    }
}
