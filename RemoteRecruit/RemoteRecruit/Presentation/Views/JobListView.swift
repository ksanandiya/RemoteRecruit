//
//  JobListView.swift
//  RemoteRecruit
//
//  Created by Kinjal Ughreja on 16/06/26.
//

/// Displays list of remote jobs.
///
/// Features:
/// - Search jobs
/// - Loading indicator
/// - Error handling
/// - Navigation to Job Detail
/// 
import SwiftUI

struct JobListView: View {

    @StateObject var viewModel: JobListViewModel
    @EnvironmentObject var coordinator: AppCoordinator

    var body: some View {

        List {
            ForEach(viewModel.filteredJobs) { job in

                Button {
                    coordinator.showJobDetail(job)
                } label: {
                    JobRow(job: job)
                }
                .buttonStyle(.plain)
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
            }
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .background(Color(.systemGroupedBackground))
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
            await viewModel.fetchJobs()
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

#Preview {
    JobListView(
        viewModel: DependencyContainer().makeJobListViewModel()
    )
}
