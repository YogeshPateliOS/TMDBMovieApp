//
//  EndPointType.swift
//  TMDBMovieApp
//
//  Created by Yogesh Patel on 15/04/24.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case patch = "PATCH"
    case delete = "DELETE"
}

protocol EndPointType {
    var url: URL? { get }
    var path: String { get }
    var baseURL: String { get }
    var body: Encodable? { get }
    var headers: [String: String]? { get }
    var method: HTTPMethod { get }
}
