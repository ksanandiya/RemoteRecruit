//
//   NetworkError.swift
//  RemoteRecruit
//
//  Created by Kinjal Ughreja on 16/06/26.
//

/// Network related errors.
///
/// Examples:
/// - Invalid URL
/// - No Internet
/// - Invalid Response
/// - Decoding Failure

import Foundation

enum NetworkError: LocalizedError, Equatable {
    
    case invalidURL
    case invalidResponse
    case serverError(Int)
    case decodingFailed
    case noInternet
    case unknown

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"

        case .invalidResponse:
            return "Invalid response received from server"

        case .serverError(let code):
            return "Server error (\(code))"

        case .decodingFailed:
            return "Failed to decode response"

        case .noInternet:
            return "No internet connection"

        case .unknown:
            return "Something went wrong.Please try again."
        }
    }
    
}
