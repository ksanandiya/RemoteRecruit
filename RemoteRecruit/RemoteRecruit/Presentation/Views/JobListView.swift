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

            headerSection
                .listRowInsets(
                    EdgeInsets(
                        top: 0,
                        leading: 0,
                        bottom: 16,
                        trailing: 0
                    )
                )
                .listRowSeparator(.hidden)

            ForEach(viewModel.jobs) { job in

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

    private var headerSection: some View {

        VStack(
            alignment: .leading,
            spacing: 8
        ) {

            Text("Find Your Next Opportunity")
                .font(.title.bold())

            Text(
                "\(viewModel.jobs.count) jobs available"
            )
            .foregroundStyle(.secondary)
        }
        .padding()
    }
}

//#Preview {
//    JobListView(
//        viewModel: JobListViewModel()
//    )
//}
