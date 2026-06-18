//
//  NetworkClientTests.swift
//  RemoteRecruit
//
//  Created by Kinjal Ughreja on 17/06/26.
//


@testable import RemoteRecruit
import XCTest

@MainActor
final class NetworkClientTests: XCTestCase {

    func testRequestSuccess() async throws {

        let response =
        JobResponse(jobs: [.mock])

        let data =
        try JSONEncoder().encode(response)

        let session = MockNetworkSession()
        session.dataToReturn = data

        session.responseToReturn =
        HTTPURLResponse(
            url: URL(string:"https://test.com")!,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil
        )

        let sut = NetworkClient(
            environment: AppEnvironment.current,
            session: session,
            connectivityMonitor:
            MockConnectivityMonitor()
        )

        let result: JobResponse =
        try await sut.request(
            endpoint: JobEndpoint.jobs
        )

        XCTAssertEqual(
            result.jobs.count,
            1
        )
    }

    func testNoInternet() async {

        let sut = NetworkClient(
            environment: AppEnvironment.current,
            session: MockNetworkSession(),
            connectivityMonitor:
            MockConnectivityMonitor(
                isConnected: false
            )
        )

        do {

            let _: JobResponse =
            try await sut.request(
                endpoint: JobEndpoint.jobs
            )

            XCTFail()

        } catch {
            XCTAssertEqual(
                error as? NetworkError,
                .noInternet
            )
        }
    }

    func testServerError() async {

        let session = MockNetworkSession()

        session.responseToReturn =
        HTTPURLResponse(
            url: URL(string:"https://test.com")!,
            statusCode: 500,
            httpVersion: nil,
            headerFields: nil
        )

        let sut = NetworkClient(
            environment: AppEnvironment.current,
            session: session,
            connectivityMonitor:
            MockConnectivityMonitor()
        )

        do {

            let _: JobResponse =
            try await sut.request(
                endpoint: JobEndpoint.jobs
            )

            XCTFail()

        } catch {
            XCTAssertEqual(
                error as? NetworkError,
                .serverError(500)
            )
        }
    }
}
