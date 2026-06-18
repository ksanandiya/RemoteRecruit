//
//  MockNetworkClient.swift
//  RemoteRecruit
//
//  Created by Kinjal Ughreja on 17/06/26.
//

@testable import RemoteRecruit
import Foundation
// MARK: - Mock NetworkClient

final class MockNetworkClient: NetworkClientProtocol {

    var jobsResponse: JobResponse?
    var error: Error?

    func request<T>(
        endpoint: Endpoint
    ) async throws -> T where T : Decodable {

        if let error {
            throw error
        }

        return jobsResponse as! T
    }
}
