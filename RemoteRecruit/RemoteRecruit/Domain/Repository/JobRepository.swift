//
//  JobRepository.swift
//  RemoteRecruit
//
//  Created by Kinjal Ughreja on 16/06/26.
//

import Foundation
protocol JobRepositoryProtocol {
    func fetchJobs() async throws -> [Job]
}

final class JobRepository: JobRepositoryProtocol {

    private let networkClient: NetworkClientProtocol

    init(networkClient: NetworkClientProtocol) {
        self.networkClient = networkClient
    }

    func fetchJobs() async throws -> [Job] {

        let response: JobResponse =
            try await networkClient.request(
                endpoint: JobEndpoint.jobs
            )

        return response.jobs
    }
}
