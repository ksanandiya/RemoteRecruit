//
//  Endpoint.swift
//  RemoteRecruit
//
//  Created by Kinjal Ughreja on 16/06/26.
//
import Foundation

protocol Endpoint {

    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String] { get }
    var queryItems: [URLQueryItem]? { get }
}
enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum JobEndpoint: Endpoint {

    case jobs
    case search(String)

   
    var path: String {
        "/api/remote-jobs"
    }

    var method: HTTPMethod {
        .get
    }

    var headers: [String : String] {
        [
            "Content-Type": "application/json"
        ]
    }

    var queryItems: [URLQueryItem]? {

        switch self {

        case .jobs:
            return nil

        case .search(let query):
            return [
                URLQueryItem(
                    name: "search",
                    value: query
                )
            ]
        }
    }
}
