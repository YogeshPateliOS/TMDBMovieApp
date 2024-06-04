//
//  MovieEndPoint.swift
//  TMDBMovieApp
//
//  Created by Yogesh Patel on 15/04/24.
//

import Foundation

enum MovieEndPoint {
    case popular
    case topRated
    case upcoming
    case credits(movieID: Int)
    case search(name: String)
}
/// https://api.themoviedb.org/3/movie/693134/credits?api_key=4e478170763204c8184c0eb526981824
/// https://api.themoviedb.org/3/search/movie?query=Jack+Reacher&api_key=4e478170763204c8184c0eb526981824
extension MovieEndPoint: EndPointType {

    private var apiKey: String {
        "4e478170763204c8184c0eb526981824"
    }

    var url: URL? {
        switch self {
        case .search:
            URL(string: baseURL + path + "&api_key=\(apiKey)")
        default:
            URL(string: baseURL + path + "?api_key=\(apiKey)")
        }
    }

    var path: String {
        switch self {
        case .popular:
            return "popular"
        case .topRated:
            return "top_rated"
        case .upcoming:
            return "upcoming"
        case .credits(let id):
            return "\(id)" + "/credits"
        case .search(let name):
            return "query=\(name)"
        }
    }

    var baseURL: String {
        switch self {
        case .search:
            return "https://api.themoviedb.org/3/search/movie?"
        default:
            return "https://api.themoviedb.org/3/movie/"
        }
    }

    var body: Encodable? {
        nil
    }

    var headers: [String : String]? {
        APIManager.commonHeaders
    }

    var method: HTTPMethod {
        .get
    }

}
