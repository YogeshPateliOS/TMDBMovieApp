//
//  APIManager.swift
//  TMDBMovieApp
//
//  Created by Yogesh Patel on 15/04/24.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case network(_ error: Error?)
    case invalidError
}

final class APIManager {

    func request<T: Decodable>(type: EndPointType) async throws -> T {
        guard let url = type.url else { throw NetworkError.invalidURL }

        var request = URLRequest(url: url)
        request.httpMethod = type.method.rawValue

        if let body = type.body {
            request.httpBody = try? JSONEncoder().encode(body)
        }

        request.allHTTPHeaderFields = type.headers
        let (data, response) = try await URLSession.shared.data(for: request)

        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw NetworkError.invalidResponse }

        return try JSONDecoder().decode(T.self, from: data)
    }

    static var commonHeaders: [String: String]? {
        ["accept" : "application/json"]
    }
}
