//
//  JobListViewModel.swift
//  RemoteRecruit
//
//  Created by Kinjal Ughreja on 16/06/26.
//

/// ViewModel for Job Listing.
///
/// Responsibilities:
/// - Fetch jobs
/// - Handle loading state
/// - Handle errors
/// - Search filtering
import SwiftUI
import Combine

@MainActor
final class JobListViewModel:ObservableObject {
    @Published var jobs: [Job] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var searchText = ""
    
    private let getJobsUseCase:
    GetJobsUseCaseProtocol
    
    var filteredJobs: [Job] {
        guard !searchText.isEmpty else {
            return jobs
        }
        
        return jobs.filter {
            $0.title.localizedCaseInsensitiveContains(searchText) ||
            $0.companyName.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    init(getJobsUseCase:GetJobsUseCaseProtocol) {
        self.getJobsUseCase = getJobsUseCase
    }
    
    func fetchJobs() async {
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
