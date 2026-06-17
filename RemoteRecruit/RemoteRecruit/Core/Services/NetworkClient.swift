//
//  NetworkClient.swift
//  RemoteRecruit
//
//  Created by Kinjal Ughreja on 16/06/26.
//

// NetworkClient validates connectivity before making
// any request and throws .noInternet when offline.

/// Generic networking layer.
///
/// Responsibilities:
/// - Execute API requests
/// - Decode responses
/// - Handle errors
/// - Check internet connectivity
/// 
import Foundation

protocol NetworkSession {
    func data(
        for request: URLRequest
    ) async throws -> (Data, URLResponse)
}

extension URLSession: NetworkSession {}

protocol NetworkClientProtocol {
    func request<T: Decodable>(
        endpoint: Endpoint
    ) async throws -> T
}



final class NetworkClient: NetworkClientProtocol {

    private let environment: EnvironmentProtocol
    private let session: NetworkSession
    private let decoder: JSONDecoder
    private let connectivityMonitor:
            ConnectivityMonitorProtocol
    init(
        environment: EnvironmentProtocol,
        session: NetworkSession = URLSession.shared,
        decoder: JSONDecoder = JSONDecoder(),connectivityMonitor:
        ConnectivityMonitorProtocol
    ) {
        self.environment = environment
        self.session = session
        self.decoder = decoder
        self.connectivityMonitor =
                    connectivityMonitor
    }

    func request<T: Decodable>(
        endpoint: Endpoint
    ) async throws -> T {
        guard connectivityMonitor.isConnected else {
            throw NetworkError.noInternet
        }
        
        guard var components = URLComponents(
            string: environment.baseURL + endpoint.path
        ) else {
            throw NetworkError.invalidURL
        }
        
        components.queryItems = endpoint.queryItems
        
        guard let url = components.url else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.httpBody = endpoint.httpBody
        
        endpoint.headers.forEach {
            request.setValue(
                $1,
                forHTTPHeaderField: $0
            )
        }
        
        let (data, response) = try await session.data(
            for: request
        )
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard 200...299 ~= httpResponse.statusCode else {
            throw NetworkError.serverError(httpResponse.statusCode)
        }
        
        return try decoder.decode(
            T.self,
            from: data
        )
    }
}
