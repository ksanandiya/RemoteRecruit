//
//  MockNetworkSession.swift
//  RemoteRecruit
//
//  Created by Kinjal Ughreja on 17/06/26.
//

@testable import RemoteRecruit
import Foundation
// MARK: - Mock Session

final class MockNetworkSession: NetworkSession {

    var dataToReturn: Data?
    var responseToReturn: URLResponse?
    var errorToThrow: Error?

    func data(
        for request: URLRequest
    ) async throws -> (Data, URLResponse) {

        if let errorToThrow {
            throw errorToThrow
        }

        return (
            dataToReturn ?? Data(),
            responseToReturn ??
            HTTPURLResponse(
                url: request.url!,
                statusCode: 200,
                httpVersion: nil,
                headerFields: nil
            )!
        )
    }
}
