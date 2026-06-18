//
//  NetworkErrorTests.swift
//  RemoteRecruit
//
//  Created by Kinjal Ughreja on 17/06/26.
//


@testable import RemoteRecruit
import XCTest

final class NetworkErrorTests: XCTestCase {

    func testDescriptions() {

        XCTAssertEqual(
            NetworkError.invalidURL.errorDescription,
            "Invalid URL"
        )

        XCTAssertEqual(
            NetworkError.noInternet.errorDescription,
            "No internet connection"
        )

        XCTAssertEqual(
            NetworkError.serverError(500).errorDescription,
            "Server error (500)"
        )
    }

    func testEquatable() {

        XCTAssertEqual(
            NetworkError.invalidURL,
            .invalidURL
        )

        XCTAssertEqual(
            NetworkError.serverError(404),
            .serverError(404)
        )
    }
}