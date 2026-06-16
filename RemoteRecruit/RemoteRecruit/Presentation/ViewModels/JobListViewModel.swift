//
//  JobListViewModel.swift
//  RemoteRecruit
//
//  Created by Kinjal Ughreja on 16/06/26.
//

import SwiftUI
import Combine

@MainActor
final class JobListViewModel:ObservableObject {
    @Published var jobs: [Job] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let getJobsUseCase:
        GetJobsUseCaseProtocol

    init(
        getJobsUseCase:
        GetJobsUseCaseProtocol
    ) {
        self.getJobsUseCase =
            getJobsUseCase
    }

    func fetchJobs() {
        Task {
            do {
                isLoading = true
                jobs =
                try await getJobsUseCase
                    .execute()
                print(jobs)
                isLoading = false
                
            } catch {
                isLoading = false
                errorMessage =
                error.localizedDescription
            }
        }
    }
}
