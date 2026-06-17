//
//  JobListView.swift
//  RemoteRecruit
//
//  Created by Kinjal Ughreja on 16/06/26.
//

import SwiftUI

struct JobListView: View {

    @StateObject var viewModel: JobListViewModel
    @EnvironmentObject var coordinator: AppCoordinator

    var body: some View {

        List {
            ForEach(viewModel.filteredJobs) { job in

                Button {

                } label: {

                    JobRow(job: job)
                }
                .buttonStyle(.plain)
                .listRowSeparator(.hidden)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Jobs")
        .navigationBarTitleDisplayMode(.large)
        .searchable(
            text: $viewModel.searchText,
            placement: .navigationBarDrawer(
                displayMode: .always
            ),
            prompt: "Search jobs or companies"
        )
        .task {
            viewModel.fetchJobs()
        }
        .overlay {

            if viewModel.isLoading {
                ProgressView()
            }
        }
        .alert(
            "Error",
            isPresented: Binding(
                get: {
                    viewModel.errorMessage != nil
                },
                set: { _ in
                    viewModel.errorMessage = nil
                }
            )
        ) {

        } message: {

            Text(viewModel.errorMessage ?? "")
        }
    }
}

//#Preview {
//    JobListView(
//        viewModel: JobListViewModel()
//    )
//}
